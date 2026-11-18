# Fetch and format cXML

```sh
mise install
mise run cxml -- fetch --refresh --history
mise run cxml -- render 1.2.072 untracked/rendered/1.2.072
```

Originals live in `untracked/cxml/`. Fetch skips translated PDFs, uses the cache by default, and
`fetch --offline` forbids networking. Render reads only the saved originals and writes to a new
directory. After review, replace the previous release's content with the rendered files, using their
paths relative to the repository root. Commit the snapshot separately from any tooling changes.
During the initial import, tags may move when we regenerate a snapshot. Once the history is settled,
record formatting revisions with ordinary commits.

On native Windows, the Measles development dependencies can require Linux wheels. For the converter
alone, use `uv venv`, `uv pip install -r pyproject.toml`, and `uv run --no-sync tools/cxml.py`.
