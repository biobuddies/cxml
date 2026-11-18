# cXML changelog

> From the [upstream release notes](https://xml.cxml.org/current/ReleaseNotes.html).

## 1.1.010

---

### Added CopyRequest Element

The `CopyRequest` element enables copying and forwarding of messages
to new recipients, similar to forwarding an e-mail messages. To accomplish
this, a new message is created and sent that includes the original message.
It is primarily used by commerce network hubs and marketplace hosts.

### Added Comments to Country-Related Elements and Attributes

Better explanations of the country-related elements and attributes have been
added to the `CountryCode` element, and the `isoCountryCode`
attribute on the `Address`, `Country`, and `CountryCode`
elements.

## 1.1.009

---

### Change in Data Type of role Attribute of Contact Element

The data type of the of the `Contact` element's optional `role`
attribute has been changed from an enumeration containing `endUser`,
`administrator`, `purchasingAgent`, `technicalSupport`,
`customerService`, and `sales`, to a string with the same
allowed values. This change enables the usage of the `Contact` element
to be more easily expanded.

### Addition of a lastChangedTimeStamp Attribute to the Identity Element

An optional `lastChangedTimestamp` attribute has been added to the
`Identity` element. This attribute enables automatic synchronization
of data between systems.

### Addition of a domain Attribute to the InternalID Element

An optional `domain` attribute has been added to the `InternalID`
element and provides scoping for this subscription catalogue identifier. The
default domain value is "NetworkSubscription".

### Addition of a DocumentReference Element to the OrderRequestHeader Element

An optional `DocumentReference` element has been added to the`OrderRequestHeader` element. `DocumentReference` provides explicit
links between an update or delete action and the most recent `OrderRequest`
for the same order. `DocumentReference` contains the `payloadID`
of the most recent `OrderRequest` document in the list, not always
the original `OrderRequest` (with type set to "new").

### Definitions Rearranged

`DocumentReference` and `StatusUpdateRequest` have been
moved to new locations within the `cxml.dtd` file. The constituent
file `status.mod` no longer exists.

## 1.1.008

---

### New Entity for cXML Version

The cXML version string (for example, 1.1.008) is now stored in a single-parameter
entity named `cxml.version`. You can use this new entity to keep
the version number consistent throughout cXML documents. For example,

> `<!DOCTYPE cXML SYSTEM "http://xml.cXML.org/schemas/cXML/1.1.008/cXML.dtd">  
> <cXML version="&cxml.version;" payloadID="992662"
> xml:lang="en-US" timestamp="2000-03-12T18:39:09-08:00">`

Using this technique is not recommended when interacting with non-validating
XML parsers. Non-validating parsers will have no version information as they
load the cXML document, and will behave as if the `version` attribute
were absent.

### SGML Entity-Redefinition Conditionalized

cXML 1.1 followed a general XML recommendation to redefine five entities (lt,
gt, amp, apos, and quot) for interoperability with SGML parsers. However, it
was found that these redefinitions cause some XML parsers to complain.

These redefinitions are now conditionalized for better compatibility with XML
parsers. In the future, commerce network platforms might have an option for
setting the XML flag `SGML-help` to trigger these redefinitions for
interoperability with SGML parsers.

### Transaction Definitions Rearranged

The definitions of the `%cxml.messages`, `%cxml.requests`,
and `%cxml.responses` entities have been moved to a separate module
(`Entities.mod`) for improved maintainability. By moving these definitions
to `Entities.mod`, they appear together within the .dtd, separate
from their uses in the `Message`, `Request`, and `Response`
elements.

### New License Agreement

The copyright notice in the .dtd and .mod files has been replaced by a reference
to the license agreement on www.cXML.org:

> `For cXML license agreement information, please see  
> http://www.cxml.org/home/license.asp`

## 1.1.007

---

### Deterministic Declaration of cXML Element

The top-level `cXML` element has a new declaration:

> Old element type declaration:  
> `<!ELEMENT cXML ((Header, Message) | (Header, Request)
> | (Response))>`
>
> New declaration:  
> `<!ELEMENT cXML ((Header, (Message | Request)) |
> Response)>`

The new declaration uses a deterministic grammar that is compatible with more
XML parsers.

### OrderReference Changed to DocumentReference

The proposed element name `OrderReference` was changed to `DocumentReference`
so that it is more generic.

### Less Restrictive Data Type for Attributes

The data types of the following attributes have been changed from NMTOKEN to
CDATA so that they can contain less restrictive data:

> `isoCountryCode  
> currency  
> alternateCurrency  
> xml:lang`
