"""Fetch cXML originals and render one release as Markdown and source files."""

import argparse
import json
import re
import sqlite3
import sys
import time
import tomllib
from contextlib import closing
from hashlib import sha256
from html.parser import HTMLParser
from http.client import HTTPMessage
from io import BytesIO
from pathlib import Path, PurePosixPath
from tempfile import NamedTemporaryFile
from typing import IO, override
from urllib.error import HTTPError
from urllib.parse import urljoin, urlsplit
from urllib.request import HTTPRedirectHandler, Request, build_opener
from zipfile import BadZipFile, ZipFile

import pymupdf
import pymupdf4llm
from bs4 import BeautifulSoup
from markdownify import markdownify

ROOT = Path(__file__).resolve().parents[1]
UPSTREAM = ROOT / 'untracked' / 'cxml'
INDEX = 'https://www.cxml.org/downloads.html'
LICENSE = 'https://www.cxml.org/license.html'
HOSTS = {'www.cxml.org', 'xml.cxml.org', 'cxml.org'}
TRANSLATED_PDF = re.compile(r'_[a-z]{2}(?:[-_][a-z]{2})?\.pdf$', re.IGNORECASE)
type CachedResponse = tuple[bytes, str, str | None, str | None]
type Attributes = list[tuple[str, str | None]]


def official_url(url: str) -> bool:
    parts = urlsplit(url)
    return parts.scheme == 'https' and parts.netloc in HOSTS


class OfficialRedirects(HTTPRedirectHandler):
    """Follow HTTPS redirects within cXML.org only."""

    @override
    def redirect_request(
        self, req: Request, fp: IO[bytes], code: int, msg: str, headers: HTTPMessage, newurl: str
    ) -> Request | None:
        if not official_url(newurl):
            raise ValueError(f'Unexpected redirect: {newurl}')
        return super().redirect_request(req, fp, code, msg, headers, newurl)


class Cache:
    """Store each complete response and its validators in one SQLite transaction."""

    def __init__(self, connection: sqlite3.Connection, offline: bool) -> None:
        self.connection = connection
        self.offline = offline
        self.opener = build_opener(OfficialRedirects())
        self.next_request = 0.0
        self.connection.execute("""
            CREATE TABLE IF NOT EXISTS responses (
                url TEXT PRIMARY KEY, body BLOB, hash TEXT, etag TEXT, modified TEXT
            )
        """)

    def get(
        self, url: str, *, refresh: bool = False, release: str = '', seed: bytes | None = None
    ) -> bytes:
        """Reuse an intact response or issue a single GET for a miss or refresh."""
        if not official_url(url):
            raise ValueError(f'Unexpected source URL: {url}')
        key = f'{release} {url}' if release else url
        with self.connection:
            self.connection.execute('BEGIN IMMEDIATE')
            cached: CachedResponse | None = self.connection.execute(
                'SELECT body, hash, etag, modified FROM responses WHERE url = ?', (key,)
            ).fetchone()
            if cached is None and seed is not None:
                cached = (seed, sha256(seed).hexdigest(), None, None)
                self._store(key, cached)
            if cached is not None:
                body, digest, _, _ = cached
                if sha256(body).hexdigest() != digest:
                    raise ValueError(f'Cache integrity check failed for {url}')
                if not refresh:
                    return body
            if self.offline:
                raise ValueError(f'Offline cache miss for {url}')
            response = self._download(url, cached)
            self._store(key, response)
            return response[0]

    def _download(self, url: str, cached: CachedResponse | None) -> CachedResponse:
        headers = {'User-Agent': 'biobuddies/cxml (documentation mirror)'}
        if cached is not None:
            _, _, etag, modified = cached
            if etag:
                headers['If-None-Match'] = etag
            if modified:
                headers['If-Modified-Since'] = modified

        time.sleep(max(0, self.next_request - time.monotonic()))
        print(f'GET {url}', flush=True)  # noqa: T201
        try:
            request = Request(url, headers=headers)  # noqa: S310 official_url checked by get
            with self.opener.open(request, timeout=40) as response:
                if response.status != 200:
                    raise ValueError(f'Unexpected HTTP status {response.status} for {url}')
                body = response.read()
                validate(PurePosixPath(urlsplit(url).path).name, body)
                return (
                    body,
                    sha256(body).hexdigest(),
                    response.headers.get('ETag'),
                    response.headers.get('Last-Modified'),
                )
        except HTTPError as error:
            error.close()
            if error.code != 304 or cached is None:
                raise
            return cached
        finally:
            self.next_request = time.monotonic() + 2

    def _store(self, key: str, response: CachedResponse) -> None:
        self.connection.execute(
            'INSERT OR REPLACE INTO responses VALUES (?, ?, ?, ?, ?)', (key, *response)
        )


class Downloads(HTMLParser):
    """Collect document links under each version heading."""

    def __init__(self, body: bytes) -> None:
        super().__init__()
        self.releases: dict[str, dict[str, str]] = {}
        self.version: str | None = None
        self.heading: str | None = None
        self.feed(body.decode('utf-8'))
        self.close()

    @override
    def handle_starttag(self, tag: str, attrs: Attributes) -> None:
        if tag == 'h2':
            self.heading = ''
        href = dict(attrs).get('href')
        if tag == 'a' and self.version and href:
            url = urljoin(INDEX, href)
            path = urlsplit(url).path
            if (
                official_url(url)
                and not TRANSLATED_PDF.search(path)
                and (path.endswith(('.pdf', '.zip')) or path == '/release-notes.html')
            ):
                self.releases[self.version][PurePosixPath(path).name] = url

    @override
    def handle_data(self, data: str) -> None:
        if self.heading is not None:
            self.heading += data

    @override
    def handle_endtag(self, tag: str) -> None:
        if tag == 'h2' and self.heading is not None:
            match = re.search(r'\bVersion (\d+\.\d+\.\d+)\b', self.heading)
            self.version = match[1] if match else None
            if self.version:
                self.releases[self.version] = {}
            self.heading = None


class ReleaseNotes(HTMLParser):
    """Find the release notes embedded in the landing page."""

    def __init__(self, body: bytes) -> None:
        super().__init__()
        self.source: str | None = None
        self.feed(body.decode('utf-8'))
        self.close()

    @override
    def handle_starttag(self, tag: str, attrs: Attributes) -> None:
        attributes = dict(attrs)
        if tag == 'iframe' and attributes.get('title') == 'cXML Release Notes':
            self.source = attributes.get('src')


def replace(path: Path, body: bytes) -> None:
    if path.exists() and path.read_bytes() == body:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with NamedTemporaryFile(dir=path.parent, delete=False) as temporary:
        temporary_path = Path(temporary.name)
        try:
            temporary.write(body)
            temporary.close()
            temporary_path.replace(path)
        finally:
            temporary_path.unlink(missing_ok=True)


def validate(filename: str, body: bytes) -> None:
    if filename.endswith('.pdf') and not body.startswith(b'%PDF-'):
        raise ValueError(f'Invalid PDF: {filename}')
    if filename.endswith('.zip'):
        with ZipFile(BytesIO(body)) as archive:
            if not archive.namelist() or archive.testzip() is not None:
                raise ValueError(f'Invalid ZIP: {filename}')
    if filename.endswith('.html') and b'<html' not in body.lower():
        raise ValueError(f'Invalid HTML: {filename}')


def manifest_bytes(version: str, records: dict[str, dict[str, str | int]]) -> bytes:
    lines = [f'version = "{version}"']
    for filename, record in sorted(records.items()):
        lines.extend(('', f'[files.{json.dumps(filename, ensure_ascii=False)}]'))
        lines.extend(
            f'{key} = {json.dumps(value, ensure_ascii=False)}' for key, value in record.items()
        )
    return ('\n'.join(lines) + '\n').encode()


def release_files(directory: Path) -> dict[str, dict[str, str | int]]:
    manifest = directory / 'manifest.toml'
    if manifest.exists():
        return tomllib.loads(manifest.read_text(encoding='utf-8'))['files']
    legacy = directory / 'manifest.json'
    return json.loads(legacy.read_bytes())['files'] if legacy.exists() else {}


def mirror(cache: Cache, version: str, sources: dict[str, str], *, refresh: bool) -> None:
    directory = UPSTREAM / version
    known = release_files(directory)
    documents = {}
    records: dict[str, dict[str, str | int]] = {}
    pending = dict(sorted(sources.items()))
    while pending:
        filename = next(iter(pending))
        url = pending.pop(filename)
        path = directory / filename
        record = known.get(filename, {})
        seed = path.read_bytes() if path.exists() and record.get('url') == url else None
        if seed is not None and sha256(seed).hexdigest() != record['sha256']:
            seed = None
        body = cache.get(url, refresh=refresh, release=version, seed=seed)
        validate(filename, body)
        documents[path] = body
        records[filename] = {'bytes': len(body), 'sha256': sha256(body).hexdigest(), 'url': url}
        if filename == 'release-notes.html' and (source := ReleaseNotes(body).source):
            notes_url = urljoin(url, source)
            if notes_url != url:
                pending[PurePosixPath(urlsplit(notes_url).path).name] = notes_url
    for path, body in documents.items():
        replace(path, body)
    replace(directory / 'manifest.toml', manifest_bytes(version, records))
    print(f'cXML {version}: verified {len(records)} documents')  # noqa: T201


def fetch(*, history: bool, offline: bool, refresh: bool) -> None:
    cache_path = ROOT / '.cache' / 'responses.sqlite3'
    cache_path.parent.mkdir(parents=True, exist_ok=True)
    with closing(sqlite3.connect(cache_path, timeout=60)) as connection:
        cache = Cache(connection, offline)
        index = UPSTREAM / 'downloads.html'
        body = cache.get(
            INDEX, refresh=refresh, seed=index.read_bytes() if index.exists() else None
        )
        releases = Downloads(body).releases
        latest = next(iter(releases), None)
        if latest is None or 'cXML_DTDs.zip' not in releases[latest]:
            raise ValueError('The downloads index did not list a current cXML archive')
        license_path = UPSTREAM / 'license.html'
        license_body = cache.get(
            LICENSE, seed=license_path.read_bytes() if license_path.exists() else None
        )
        validate(license_path.name, license_body)
        replace(license_path, license_body)
        mirror(cache, latest, releases[latest], refresh=refresh)
        replace(index, body)
        replace(UPSTREAM / 'latest.txt', (latest + '\n').encode())
        if history:
            for version, sources in list(releases.items())[1:]:
                mirror(cache, version, sources, refresh=False)


def html_to_markdown(body: bytes, url: str) -> str:
    soup = BeautifulSoup(body, 'html.parser')
    content = soup.find('main') or soup.body or soup
    for tag in content.find_all(['script', 'style', 'nav', 'footer', 'iframe', 'img']):
        tag.decompose()
    for link in content.find_all('a', href=True):
        href = link.get('href')
        if isinstance(href, str) and not href.startswith('#'):
            link['href'] = urljoin(url, href)
    return markdownify(str(content), heading_style='ATX').strip()


def pdf_to_markdown(body: bytes) -> str:
    pymupdf4llm.use_layout(False)  # noqa: FBT003
    with pymupdf.open(stream=body, filetype='pdf') as document:
        text = pymupdf4llm.to_markdown(document, ignore_images=True)
    if not isinstance(text, str):
        raise TypeError('PDF converter did not return Markdown')
    return text.strip()


def write_document(path: Path, body: bytes, url: str) -> None:
    extension = path.suffix.lower()
    if extension in {'.pdf', '.html', '.htm'}:
        markdown = pdf_to_markdown(body) if extension == '.pdf' else html_to_markdown(body, url)
        if not markdown:
            raise ValueError(f'No text extracted from {path.name}')
        source = f'> Converted from the [upstream source]({url}).'
        if extension == '.pdf':
            source += ' See the original for figures and page layout.'
        replace(path.with_suffix('.md'), f'{source}\n\n{markdown}\n'.encode())
    elif extension in {'.dtd', '.mod', '.xml', '.txt'}:
        replace(path, body)


def extract_archive(
    output: Path, package: str, body: bytes, url: str, direct_hashes: set[str]
) -> None:
    with ZipFile(BytesIO(body)) as archive:
        for member in archive.infolist():
            name = PurePosixPath(member.filename)
            if name.is_absolute() or '..' in name.parts or re.search(r'[:\\]', member.filename):
                raise ValueError(f'Unsafe archive path: {member.filename}')
            if TRANSLATED_PDF.search(name.name):
                continue
            if member.is_dir() or name.suffix.lower() not in {
                '.pdf',
                '.html',
                '.dtd',
                '.mod',
                '.xml',
                '.txt',
            }:
                continue
            original = archive.read(member)
            if name.suffix.lower() == '.pdf' and sha256(original).hexdigest() in direct_hashes:
                continue
            if package == 'cXML_DTDs' and name.suffix == '.dtd':
                write_document(output / name.name, original, url)
            else:
                package_dir = output / 'documents' / 'packages' / package
                write_document(package_dir.joinpath(*name.parts), original, url)
                if package == 'cXML' and name.suffix in {'.dtd', '.mod'}:
                    write_document(output.joinpath(*name.parts), original, url)


def changelog(version: str, output: Path) -> None:
    latest = UPSTREAM / 'latest.txt'
    sections: list[str] = []
    if latest.exists():
        notes = UPSTREAM / latest.read_text(encoding='utf-8').strip()
        source = release_files(notes).get('ReleaseNotes.html')
        if source is not None:
            body = (notes / 'ReleaseNotes.html').read_bytes()
            if sha256(body).hexdigest() != source['sha256']:
                raise ValueError('Source hash mismatch for ReleaseNotes.html')
            url = str(source['url'])
            markdown = html_to_markdown(body, url)
            markdown = re.sub(r'(?m)^#### .* \[Back to Top\]\(#top\)$', '', markdown)
            stops = re.split(r'(?m)^(?=## \d+\.\d+\.\d+[ \t]*$)', markdown)
            target = tuple(map(int, version.split('.')))
            sections = [
                section.strip()
                for section in stops[1:]
                if tuple(map(int, section.splitlines()[0][3:].strip().split('.'))) <= target
            ]
            if sections:
                sections.insert(0, f'> From the [upstream release notes]({url}).')
    if len(sections) < 2 or sections[1].splitlines()[0] != f'## {version}':
        sections.insert(0, f'The cached upstream changelog has no entry for cXML {version}.')
    replace(output / 'CHANGELOG.md', ('\n\n'.join(('# cXML changelog', *sections)) + '\n').encode())


def render(version: str, output: Path) -> None:
    if re.fullmatch(r'\d+\.\d+\.\d+', version) is None:
        raise ValueError(f'Invalid cXML version: {version}')
    directory = UPSTREAM / version
    records = {
        name: record
        for name, record in release_files(directory).items()
        if not TRANSLATED_PDF.search(name)
    }
    if not records:
        raise ValueError(f'No original files cached for cXML {version}')
    if output.exists():
        raise ValueError(f'Render to a new directory: {output}')
    originals = {name: (directory / name).read_bytes() for name in records}
    for name, body in originals.items():
        if sha256(body).hexdigest() != records[name]['sha256']:
            raise ValueError(f'Source hash mismatch: {directory / name}')
    direct_hashes = {
        sha256(body).hexdigest() for name, body in originals.items() if name.endswith('.pdf')
    }
    documents = output / 'documents'
    write_document(output / 'LICENSE.html', (UPSTREAM / 'license.html').read_bytes(), LICENSE)
    for name, body in originals.items():
        url = str(records[name]['url'])
        if name.endswith('.zip'):
            extract_archive(output, Path(name).stem, body, url, direct_hashes)
        elif name not in {'release-notes.html', 'ReleaseNotes.html'}:
            write_document(documents / name, body, url)
    if not (output / 'cXML.dtd').is_file():
        raise ValueError(f'No cXML.dtd found for cXML {version}')
    changelog(version, output)
    replace(documents / 'manifest.toml', manifest_bytes(version, records))
    guides = [f'- [{path.stem}](documents/{path.name})' for path in sorted(documents.glob('*.md'))]
    schemas = [
        f'- [{path.name}]({path.name})'
        for path in sorted(output.glob('*.dtd'))
        if path.name != 'cXML.dtd'
    ]
    index = '\n'.join((
        f'# cXML {version}',
        '',
        'English documentation and schemas from the',
        '[official cXML downloads](https://www.cxml.org/downloads.html).',
        '',
        '## Schemas',
        '',
        '- [cXML.dtd](cXML.dtd)',
        *schemas,
        '',
        '## Documentation',
        '',
        *guides,
        '- [Changelog](CHANGELOG.md)',
        '- [Packages and XML examples](documents/packages/)',
        '- [Upstream license](LICENSE.md)',
        '',
        '[Source manifest](documents/manifest.toml) · [Fetch and format tools](tools/README.md)',
        '',
    ))
    replace(output / 'README.md', index.encode())


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest='command', required=True)
    fetch_args = commands.add_parser('fetch', help='cache original cXML files')
    fetch_args.add_argument('--history', action='store_true', help='include linked older releases')
    network = fetch_args.add_mutually_exclusive_group()
    network.add_argument('--offline', action='store_true', help='use local files only')
    network.add_argument('--refresh', action='store_true', help='revalidate the current release')
    render_args = commands.add_parser(
        'render', help='convert one cached release without networking'
    )
    render_args.add_argument('version')
    render_args.add_argument('output', type=Path, help='new directory for the rendered snapshot')
    args = parser.parse_args()
    if args.command == 'render':
        render(args.version, args.output)
    else:
        fetch(history=args.history, offline=args.offline, refresh=args.refresh)


if __name__ == '__main__':
    try:
        main()
    except (BadZipFile, OSError, TypeError, ValueError, sqlite3.Error) as error:
        sys.exit(str(error))
