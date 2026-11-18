<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 1996-1999 Ariba, Inc.
    All rights reserved. Patents pending.

    $Id: //ariba/specs/cXML/Common.mod#10 $
-->

<!-- 
    Common types used throughout the cXML definiton. 

    The types try to follow the XML DATA definition submitted to the W3C. See
    the following for more information,

        http://msdn.microsoft.com/xml/reference/schema/datatypes.asp
        http://www.w3c.org/TR/1998/NOTE-XML-data-0105/

-->

<!-- Imports are NOT allowed in .mod files -->

<!-- Atomic-level Types -->
<!ENTITY % bin.base64 "CDATA">
<!ENTITY % bin.hex "CDATA">
<!ENTITY % boolean "(0 | 1)"> <!-- 0 is false, 1 is true -->
<!ENTITY % char "CDATA">
<!ENTITY % date "CDATA">
<!ENTITY % datetime.tz "CDATA">
<!ENTITY % fixed.14.4 "CDATA">
<!ENTITY % i8 "CDATA">
<!ENTITY % int "%i8;">
<!ENTITY % r8 "CDATA">
<!ENTITY % number "%r8;">
<!ENTITY % string "CDATA">
<!ENTITY % time.tz "CDATA">
<!ENTITY % ui8 "CDATA">
<!ENTITY % uint "%ui8;">
<!ENTITY % uri "CDATA">
<!ENTITY % uuid "CDATA">

<!-- Higher-level Types -->
<!ENTITY % isoLangCode "CDATA">
<!ENTITY % isoCountryCode "CDATA">
<!ENTITY % URL "%uri;">
