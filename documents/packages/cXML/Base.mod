<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 1996-1999 Ariba, Inc.
    All rights reserved. Patents pending.

    $Id: //ariba/specs/cXML/Base.mod#19 $
-->

<!-- Imports are NOT allowed in .mod files -->

<!--
    This file defines the basic elements used to build higher level
    constructs in cXML.
-->

<!-- Basic Name/Data Elements -->
<!--
    Name is used to provide an identifier for other elements.

    xml:lang
        ISO 639 language identifiers
-->
<!ELEMENT Name (#PCDATA)> <!-- string -->
<!ATTLIST Name
    xml:lang  %isoLangCode;  #REQUIRED
>

<!--
    Value is used to represent #PCDATA values in other elements
-->
<!ELEMENT Value (#PCDATA)> <!-- string -->

<!--
    An Extrisic is an element which can be used to extend the data
    associated with known elements.

    Since this Element is of type ANY, it could contain any arbitrary XML
    document within itself, or a binary ![CDATA[]] document.

    name
        Name used to identify this extrinsic.
-->
<!ELEMENT Extrinsic ANY>
<!ATTLIST Extrinsic
    name  %string;  #REQUIRED
>

<!--
    Description is a string which describes something.

    xml:lang
        an ISO 639 code representing the language in which the description is
        written
-->
<!ELEMENT Description (#PCDATA)> <!-- string -->
<!ATTLIST Description
    xml:lang  %isoLangCode;  #REQUIRED
>

<!-- Telephone Number Elements -->
<!--
    International ITU dial code for the country code in question.

    isoCountryCode
        The ISO 3166 country code for the dial code in question
-->
<!ELEMENT CountryCode (#PCDATA)> <!-- uint -->
<!ATTLIST CountryCode
    isoCountryCode  %isoCountryCode;  #REQUIRED
>

<!--
    The areacode or city code within a CountryCode.
-->
<!ELEMENT AreaOrCityCode (#PCDATA)> <!-- uint -->

<!--
    The local number part of a telephone number.
-->
<!ELEMENT Number (#PCDATA)> <!-- uint -->

<!--
    An extension within relative to the Number element. This element has no
    meaning without an associated Number element.
-->
<!ELEMENT Extension (#PCDATA)> <!-- uint -->

<!--
    TelephoneNumber represents international telephone numbers.a
-->
<!ELEMENT TelephoneNumber (CountryCode, AreaOrCityCode, Number, Extension?)>

<!--
     Phone is a "named" TelephoneNumber.

     name
          specifies an identifier which indicates the type of phone number. US
          examples would include "work","home", etc.
-->
<!ELEMENT Phone (TelephoneNumber)>
<!ATTLIST Phone
    name  %string;  #IMPLIED
>

<!--
    Fax number.
-->
<!ELEMENT Fax (TelephoneNumber | URL | Email)>
<!ATTLIST Fax
    name  %string;  #IMPLIED
>

<!-- Addressing Elements -->
<!--
    URL. A string which represents a URL
-->
<!ELEMENT URL (#PCDATA)> <!-- uri -->
<!ATTLIST URL
    name  %string;  #IMPLIED
>

<!--
    An email address. Address must conform to RFC 821 (SMTP Standard).
-->
<!ELEMENT Email (#PCDATA)> <!-- string -->
<!ATTLIST Email
    name  %string;  #IMPLIED
>

<!--
    Contact represents and entity at a location. The nature of this
    element is that it represents a communication "end point" for a
    location.
-->
<!ELEMENT Contact (Name, PostalAddress*, Email*, Phone*, Fax*, URL*)>

<!--
    The DeliverTo part of an Address. This would be internal to the actual
    address know to the outside world. Similar to what an extension is to a
    TelephoneNumber.
-->
<!ELEMENT DeliverTo (#PCDATA)> <!-- string -->

<!--
    Street is a single line of an Address' location.
-->
<!ELEMENT Street (#PCDATA)> <!-- string -->

<!--
    City is the name of the city in an Address' location.
-->
<!ELEMENT City (#PCDATA)> <!-- string -->

<!--
    State is an optional state identifier in an Address' location.
-->
<!ELEMENT State (#PCDATA)> <!-- string -->

<!--
    PostalCode (I have no idea how to describe it)
-->
<!ELEMENT PostalCode (#PCDATA)> <!-- string -->

<!--
    Country is the name of the country in an Address' location

    isoCountryCode
        The ISO 3166 2-letter country code.
-->
<!ELEMENT Country (#PCDATA)> <!-- string -->
<!ATTLIST Country
    isoCountryCode  %isoCountryCode;  #REQUIRED
>

<!--
    PostalAddress is a real-world location for a business or person.
-->
<!ELEMENT PostalAddress (DeliverTo*, Street+, City, State?, PostalCode?, Country)>
<!ATTLIST PostalAddress
    name  %string;  #IMPLIED
>

<!--
    Address is the association of a Contact and an Location.

    isoCountryCode
        The ISO 3166 country code for the dial code in question

    addressID
        An id for the address. Needed to support address codes for
        relationships that require id references.
-->
<!ELEMENT Address (Name, PostalAddress?, Email?, Phone?, Fax?, URL?)>
<!ATTLIST Address
    isoCountryCode  %isoCountryCode;  #IMPLIED
    addressID       %string;          #IMPLIED
>

<!-- Financial Elements -->
<!--
    Money is the representation of the object used to pay for items.

    currency
        specifies the currency in which amount is stated, must conform to ISO
        4217 currency codes.

    alternateAmount
        the amount of money in the alternateCurrency. Optional and used to
        support dual-currency requirements such as the Euro.

    alternateCurrency
        specifies the currency in which the aleternateAmount is stated, must
        conform to ISO 4217 currency codes.
-->
<!ELEMENT Money (#PCDATA)> <!-- number -->
<!ATTLIST Money
    currency           %string;  #REQUIRED
    alternateAmount    %number;  #IMPLIED
    alternateCurrency  %string;  #IMPLIED
>

<!--
    Optional textual child for communicating arbitrary comments or
    description along with the parent.

    xml:lang
        an ISO 639 code representing the language in which the description is
        written
-->
<!ELEMENT Comments ANY>
<!ATTLIST Comments
    xml:lang  %isoLangCode;  #IMPLIED
>

<!--
    Price per unit of item.
-->
<!ELEMENT UnitPrice (Money)> 
