<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 1996-1999 Ariba, Inc.
    All rights reserved. Patents pending.

    $Id: //ariba/specs/cXML/Transaction.mod#21 $
-->

<!--
    For better definitions of these Elements/Entities, refer to the cXML
    Transaction Specification documents.
-->

<!-- Imports are NOT allowed in .mod files -->

<!-- Basic transactional elements used throughout -->
<!--
    The total for something.
-->
<!ELEMENT Total (Money)>

<!--
    The bill to for an item.
-->
<!ELEMENT BillTo (Address)>

<!--
    The ship to for a item. 
-->
<!ELEMENT ShipTo (Address)>

<!--
    Definition of a cXML Shipping item. Represents a shipping cost in the
    shopping basket (PunchOutResponse) or an order to the supplier
    (SupplierOrder). There could be one of these for the entire order, or one
    per lineitem.

    trackingDomain
        represents the logistics supplier, I.E., "FedEx", "UPS", etc.

    trackingId
        an optional element value that represents the logistics supplier
        tracking number

    tracking
        Deprecated - Do Not Use
-->
<!ELEMENT Shipping (Money, Description)>
<!ATTLIST Shipping
    trackingDomain  %string;  #IMPLIED
    trackingId      %string;  #IMPLIED
    tracking        %string;  #IMPLIED
>

<!--
    Defines a Purchasing Card element used for payment
-->
<!ELEMENT PCard (PostalAddress?)>
<!ATTLIST PCard
    number      %uint;    #REQUIRED
    expiration  %date;    #REQUIRED
    name        %string;  #IMPLIED
>    

<!--
    The list of valid payment types. 
-->
<!ENTITY % cxml.payment  "PCard">
<!ELEMENT Payment (%cxml.payment;)>

<!--
    Defines an accounting segment.

    type
        The accounting type of this segment.

    id
        The unique key of this Segment against the type. 

    description
        Textual description of the Segment. For human readability.
-->
<!ELEMENT Segment EMPTY>
<!ATTLIST Segment 
    type         %string;  #REQUIRED
    id           %string;  #REQUIRED
    description  %string;  #REQUIRED
>

<!--
    An accounting object. 

    name
        The name of the object containing the specified accounting segments.
-->
<!ENTITY % cxml.accounting  "Segment+">
<!ELEMENT Accounting (%cxml.accounting;)>
<!ATTLIST Accounting
    name  %string;  #REQUIRED
> 

<!--
    A charge against an Accounting element.
-->
<!ELEMENT Charge (Money)>

<!--
    The combination of a Charge against an Accounting Element. A distribution
    represents the breakdown of one overall amount into sub-amounts.
-->
<!ELEMENT Distribution (Accounting, Charge)>

<!--
    Definition of a cXML Tax item. This represents what a Tax element should
    be in the classic notion of a line on a PO or Invoice. It can also
    represent a per-lineitem tax element depending on where it appears (inside
    of a item ELEMENT or inside of a something like a supplierOrder ELEMENT).

    Represents a tax item in the shopping basket. There could be one of these
    for the entire order, or one per lineitem.
-->
<!ELEMENT Tax (Money, Description)>

<!-- Item Elements -->
<!--
    The representation of a line item as it needs to be for sending to a
    supplier. 

    quantity
        How many items are desired. 

    requisitionID
        The buyers system requisition id for this line item. It might be the
        same as orderID, and it might not be included at all.

-->
<!ELEMENT ItemOut (ItemID, ItemDetail?, SupplierID?, ShipTo?, Shipping?, Tax?, Distribution*, Comments?)>
<!ATTLIST ItemOut
    quantity               %uint;    #REQUIRED
    requisitionID          %string;  #IMPLIED
    requestedDeliveryDate  %date;    #IMPLIED
>

<!--
    The representation of a line item as it needs to be for sending to a
    buyer. 

    quantity
        How many items are desired.
-->
<!ELEMENT ItemIn (ItemID, ItemDetail, SupplierID?, ShipTo?, Shipping?, Tax?)>
<!ATTLIST ItemIn
    quantity  %int;  #REQUIRED
>

<!-- OrderRequest* Elements -->
<!-- 
    Definition of an order.  This is the data that is send the the supplier
    to have them place an order in their order management system. The new
    world order equivalent of a PO.
-->
<!ELEMENT OrderRequest (OrderRequestHeader, ItemOut+)>

<!-- 
    Header of an order.  This is the data that is send the the supplier
    to have them place an order in their order management system. Money
    represents the total amount of this order.

    orderID
        The buyer system orderID for this request. Basically, what the PO
        number is today.

    orderDate
        The date the order request was created. 

    type
        The type of the order request. Defaults to "new".
-->
<!ELEMENT OrderRequestHeader (Total, ShipTo?, BillTo, Shipping?, Tax?, Payment?, Comments?)>
<!ATTLIST OrderRequestHeader
    orderID    %string;        #REQUIRED
    orderDate  %datetime.tz;   #REQUIRED
    type       (new | update | delete)  "new"
>

<!-- 
     The response to an OrderRequest. This is how the supplier confirms they
     have received and are going to act on an OrderRequest.

     orderID
         The buyer system orderID for this request. Basically, what the PO
         number is today.

     orderDate
         The date the order request was created. Should be the same date send
         in the SupplierOrderRequest.
-->
<!ELEMENT OrderResponse EMPTY>
<!ATTLIST OrderResponse
    orderID    %string;       #REQUIRED
    orderDate  %datetime.tz;  #REQUIRED
>

<!-- PunchOut* Elements -->
<!--
     Definition of a PunchOut Setup Request.  This is the data that is send to
     the the external system that the Ariba ORMS is going to extract catalog
     data from.

     The URL element is the URL we would like the browser re-directed to when
     the PunchOut shopping experience is finished (after the
     PunchOutOrderRequest messages have been exchanged).
-->
<!ELEMENT PunchOutSetupRequest (BuyerCookie, Extrinsic*, BrowserFormPost?, 
                                SupplierSetup, ShipTo?, ItemOut*)>
<!ATTLIST PunchOutSetupRequest
    operation  (create | inspect | edit)  #REQUIRED
>

<!ELEMENT BuyerCookie ANY> <!-- any valid XML data -->

<!ELEMENT BrowserFormPost (URL)>
<!ELEMENT SupplierSetup (URL)>
<!ELEMENT PunchOutSetupResponse (StartPage)>
<!ELEMENT StartPage (URL)>

<!-- 
     Definition of a PunchOut Order Message.  This is the data that is send
     back to the Ariba ORMS system from the external system that the PunchOut
     Request was targeted at.
-->
<!ELEMENT PunchOutOrderMessage (BuyerCookie, PunchOutOrderMessageHeader, ItemIn+)>

<!-- 
     Header of a PunchOut Order Request.  This is the data that is send from the
     supplier to transfer the supplier aquired shopping basket back to the
     buyer system.

     operationAllowed
          list of operations that are allowed on the PunchOut shopping basket.
-->
<!ELEMENT PunchOutOrderMessageHeader (Total, ShipTo?, Shipping?, Tax?)>
<!ATTLIST PunchOutOrderMessageHeader
    operationAllowed  (create | inspect | edit)  #REQUIRED
>

<!ELEMENT PunchOutOrderAckMessage (BuyerCookie, PunchOutOrderMessageHeader, ItemIn+)>

