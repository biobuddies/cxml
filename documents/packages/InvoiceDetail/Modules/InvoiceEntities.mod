<!--
    For cXML license agreement information, please see
    http://www.cxml.org/home/license.asp

    $Id$
-->

<!--
     Top-level entities used in Transport.mod.  Defined here to allow easy
     extention of the cXML specification (using additional DTDs) without
     redefining these entities.
-->

<!ENTITY % cxml.requests "(InvoiceDetailRequest |
                           ProviderSetupRequest)">

<!ENTITY % cxml.messages ",(ProviderDoneMessage)">

<!ENTITY % cxml.responses ",(ProviderSetupResponse)?">
