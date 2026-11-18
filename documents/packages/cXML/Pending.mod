<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 1996-1999 Ariba, Inc.
    All rights reserved. Patents pending.

    $Id: //ariba/specs/cXML/Pending.mod#4 $
-->

<!--
    For better definitions of these Elements/Entities, refer to the cXML
    Specification documents.
-->

<!-- Imports are NOT allowed in .mod files -->

<!-- 
    A request used for polling for waiting messages. A waiting message, if any,
    will be included in the returned stream. The lastReceivedTimestamp attribute,
    if present, provides the timestamp of the last received message. When the
    Receiver sees this, it can remove messages with earlier timestamps from 
    the pending queue. 
        
    The maxMessages attribute is used to indicate the maximum number of pending
    messages that can be included in the response. 
-->
<!ELEMENT GetPendingRequest (MessageType+)>
<!ATTLIST GetPendingRequest
    maxMessages            %int;          #IMPLIED
    lastReceivedTimestamp  %datetime.tz;  #IMPLIED
>

<!-- 
    Indicates the type of message(s) being polled for. The valid values are
    the corresponding element names e.g. SubscriptionChangeMessage.
-->
<!ELEMENT MessageType (#PCDATA)> <!-- string -->
 
 
<!-- 
    The data elements being carried back in the response. These are fully
    formed cXML messages being carried through the Request/Response channel.
-->
<!ELEMENT GetPendingResponse (cXML+)>
