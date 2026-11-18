<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 1996-1999 Ariba, Inc.
    All rights reserved. Patents pending.

    $Id: //ariba/specs/cXML/Transport.mod#23 $
-->

<!--
    For better definitions of these Elements/Entities, refer to the cXML
    Protocol Specification documents.
-->

<!-- Imports are NOT allowed in .mod files -->

<!-- envelope -->
<!ELEMENT cXML ((Header, Message) | 
                (Header, Request) | 
                (Response))>

<!ATTLIST cXML
    version    %uint;         "1.0"
    payloadID  %string;       #REQUIRED
    timestamp  %datetime.tz;  #REQUIRED
>

<!-- header -->
<!ELEMENT Header (From, To, Sender)>

<!ELEMENT From (Credential+)>
<!ELEMENT To (Credential+)>
<!ELEMENT Sender (Credential, UserAgent)>

<!--
    A textual string representing who the UserAgent is conducting the cXML
    conversation. Analagous to UserAgent for HTTP conversations.
-->
<!ELEMENT UserAgent (#PCDATA)>

<!-- 
    A digital signature.  The recommended format is self-contained PK7. The
    exact signed content is not that significant but current timestamp would
    be used just as a convention.

    type
        The type of digital signature used.

    encoding
        How is the signature encoded in the XML stream.
-->  
<!ELEMENT DigitalSignature ANY>
<!ATTLIST DigitalSignature
    type      %string;  "PK7 self-contained"
    encoding  %string;  "Base64"
>

<!--
    A shared secret. Typically, this is a username/password type of secret
    exchanged through a secure transport before communication takes place.
-->
<!ELEMENT SharedSecret ANY>

<!--
    Represents an identity for a credential.
-->
<!ELEMENT Identity ANY>

<!--
    A combination of an Identity and authentication element. If the
    authentication element is present, it strongly authenticates who/what
    someone is.

    domain
        In what domain is this Credendial represented?
-->
<!ENTITY % cxml.authentication  "SharedSecret | 
                                 DigitalSignature"
>
<!ELEMENT Credential (Identity, (%cxml.authentication;)?)>
<!ATTLIST Credential
    domain  %string;  #REQUIRED
>

<!-- status -->
<!ELEMENT Status (#PCDATA)>
<!ATTLIST Status
    code  %uint;    #REQUIRED
    text  %string;  #REQUIRED
>

<!-- message -->
<!ENTITY % cxml.messages  "PunchOutOrderMessage |
                           PunchOutOrderAckMessage |
                           SubscriptionChangeMessage |
                           SupplierChangeMessage"
>

<!ELEMENT Message (Status?, (%cxml.messages;))>
<!ATTLIST Message
    deploymentMode  (production | test)  "production"
    inReplyTo       %string;  #IMPLIED
>

<!-- request -->
<!ENTITY % cxml.requests  "OrderRequest | 
                           PunchOutSetupRequest |
                           GetPendingRequest |
                           SubscriptionListRequest |
                           SubscriptionContentRequest |
                           SupplierListRequest |
                           SupplierDataRequest"
>

<!ELEMENT Request (%cxml.requests;)>
<!ATTLIST Request
    deploymentMode  (production | test)  "production"
>

<!-- response -->
<!ENTITY % cxml.responses  "OrderResponse |
                            PunchOutSetupResponse |
                            GetPendingResponse |
                            SubscriptionListResponse |
                            SubscriptionContentResponse |
                            SupplierListResponse |
                            SupplierDataResponse"
>

<!ELEMENT Response (Status, (%cxml.responses;)?)>
