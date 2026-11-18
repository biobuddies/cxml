<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 1996-1999 Ariba, Inc.
    All rights reserved. Patents pending.

    $Id: //ariba/specs/cXML/Item.mod#14 $
-->

<!-- Imports are NOT allowed in .mod files -->

<!--
    Must be a UN/CEFACT (Recommendation 20) unit of measure code.
-->
<!ELEMENT UnitOfMeasure (#PCDATA)> <!-- string -->

<!--
    ID with which the item's manufacturer identifies the item.
-->
<!ELEMENT ManufacturerPartID (#PCDATA)> <!-- string -->

<!--
    Name of the item's manufacturer.
-->
<!ELEMENT ManufacturerName (#PCDATA)> <!-- string -->

<!--
    Classification is used to group items into similar categories.
    
    domain
        "name" of classification, ie., SPSC
-->
<!ELEMENT Classification (#PCDATA)> <!-- string -->
<!ATTLIST Classification
	domain 	%string;  #REQUIRED
>

<!--
    How the supplier identifies an item they sell.

    If SupplierPartID does not provide a unique key to identify the item, 
    then the supplier should generate a key which identifies the part 
    uniquely when combined with the SupplierID and SupplierPartID. The 
    key is call SupplierPartAuxiliaryID.

    An example is where a Supplier would use the same PartID for an 
    item but have a different price for units of "EA" versus "BOX". 
    In this case, the ItemIDs should be:
    <ItemID>
  	<SupplierPartID>pn12345</SupplierPartID>
	<SupplierPartAuxiliaryID>EA</SupplierPartAuxiliaryID>
    </ItemID>
    <ItemID>
  	<SupplierPartID>pn12345</SupplierPartID>
	<SupplierPartAuxiliaryID><foo>well formed XML here</foo></SupplierPartAuxiliaryID>
    </ItemID>
-->
<!ELEMENT SupplierPartID (#PCDATA)> <!-- string -->

<!ELEMENT SupplierPartAuxiliaryID ANY>

<!--
    A unique identification of an item. SupplierID is not required since
    ItemIDs never travel alone.
-->
<!ELEMENT ItemID (SupplierPartID, SupplierPartAuxiliaryID?)>

<!--
    ItemDetail contains detailed information about an item. All the data that
    a user would want to see about an item instead of the bare essentials that
    are represented in the ItemID.
-->
<!ELEMENT ItemDetail (UnitPrice, Description+, UnitOfMeasure, 
                      Classification+, ManufacturerPartID?,
                      ManufacturerName?, URL?, Extrinsic*)>

