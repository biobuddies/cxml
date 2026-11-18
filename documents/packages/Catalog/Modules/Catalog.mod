<!--
    For cXML license agreement information, please see
    http://www.cxml.org/home/license.asp

    $Id$
-->

<!-- ====
    Allow this module to be built separately from any other DTD file.
==== -->

<!--
     Defined here to allow easy extension of the cXML specification
     (using additional DTDs) without redefining these entities.
-->

<!-- cxml.messages -->
<!ENTITY % cxml.messages ",(PunchOutOrderMessage)"
>

<!-- cxml.requests -->
<!ENTITY % cxml.requests "(OrderRequest |
                           MasterAgreementRequest |
                           PunchOutSetupRequest |
                           CopyRequest)"
>

<!-- cxml.responses -->
<!ENTITY % cxml.responses ",(PunchOutSetupResponse)?"
>


