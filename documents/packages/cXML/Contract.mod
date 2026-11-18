<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 1996-1999 Ariba, Inc.
    All rights reserved. Patents pending.

    $Id: //ariba/specs/cXML/Contract.mod#11 $
-->

<!-- Imports are NOT allowed in .mod files -->

<!ELEMENT Contract (SupplierID+, Comments?, ItemSegment+)>
<!ATTLIST Contract
    effectiveDate   %datetime.tz;  #REQUIRED
    expirationDate  %datetime.tz;  #REQUIRED
>

<!--
    Defines an item segment for the index.  An item segment is an
    overlay for index items, allowing suppliers to override certain
    item attributes on a per-contract basis.

    Items may be segmented by some agreed-upon user-specific key that
    is used to determine who is eligible for these particular overlaid
    attributes (such as reduced or different prices).  Omitting the
    segmentKey indicates that the supplier wishes to set the given
    contract price system wide (for all users).

    segmentKey      - optional agreed-upon string used to segment
                      custom prices
-->
<!ELEMENT ItemSegment (ContractItem+)>
<!ATTLIST ItemSegment
    segmentKey  %string;  #IMPLIED
>

<!--
    A particular (custom) item overlay for a index item.  The item is
    referenced by the supplierPartID.

    ItemID - ID for the part to be overlaid.
    UnitPrice - Contract price for item
    Extrinsic - Named overlay. The Extrinsic should be named with the
    item field name it is to overlay. The Extrinsic must contain a
    <value> element which supplies the replacement value for the item
    field.
    For example:
    <ContractItem>
      <ItemId>
           <SupplierPartID>123456</SupplierPartID>
      </ItemId>
      <Extrinsic name="URL">http://www.newaddress.com</Extrinsic>
    </ContractItem>
-->
<!ELEMENT ContractItem (ItemID, UnitPrice?, Extrinsic*)>

