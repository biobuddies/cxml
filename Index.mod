<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 1996-1999 Ariba, Inc.
    All rights reserved. Patents pending.

    $Id: //ariba/specs/cXML/Index.mod#10 $
-->

<!-- Imports are NOT allowed in .mod files -->

<!-- 
     IndexItemAdd is the element used to insert an item in an index.

     ItemID          - uniquely identifies the item
     ItemDetail      - general information about the item
     IndexItemDetail - Index specific item detail

-->
<!ELEMENT IndexItemAdd (ItemID, ItemDetail, IndexItemDetail)>
<!--
     IndexItemDelete is the element used to remove an item from the
     index.
     ItemID          - uniquely identifies the item

-->
<!ELEMENT IndexItemDelete (ItemID) >

<!--
     IndexItemPunchout is the element used to dynamically connect an
     index item to the supplier's resource for that item.

     ItemID          - uniquely identifies the item
     PunchoutDetail  - Describes the item being accessed
-->
<!ELEMENT IndexItemPunchout (ItemID, PunchoutDetail)>

<!--
     IndexItem is the general ELEMENT for the list of items in an
     index.

     IndexItemAdd      - Item(s) to be added to the index
     IndexItemDelete   - Item(s) to be removed from the index
     IndexItemPunchout - PunchoutItem(s) to be added to the index

-->
<!ELEMENT IndexItem (IndexItemAdd+ | IndexItemDelete+ | IndexItemPunchout+)>

<!-- 
     PunchoutDetail is the description of an item which is referenced
     in the index.

-->
<!ELEMENT PunchoutDetail (Description, URL, Classification+,
                          ManufacturerName?, ManufacturerPartID?,
                          ExpirationDate?, EffectiveDate?,
                          SearchGroupData*, TerritoryAvailable*)>

<!--
     Index is the element used to update the list of goods and/or
     services which are being handled by the system.

     SupplierID  - One or more identities by which this supplier is
                   known. NOTE: These are to be considered synonyms
                   for the same Supplier.
     SearchGroup - Description(s) of parametric search(es) for this
                   index
     IndexItem   - The list of items with which to modify the index

-->
<!ELEMENT Index (SupplierID+, Comments?, SearchGroup*, IndexItem+)>

<!-- 
     SearchGroup is a grouping of attributes which constitue a search
     which can be performed against an index.

     Name            - Name of the search
     SearchAttribute - List of searchable index fields.
-->
<!ELEMENT SearchGroup (Name, SearchAttribute+)>

<!--
     An attribute that can searched parametrically.

     name - name of the attribute.
     type - the type of the attribute
-->
<!ELEMENT SearchAttribute EMPTY>
<!ATTLIST SearchAttribute
    name  %string;  #REQUIRED
    type  %string;  #IMPLIED
>

<!-- 
     LeadTime specifies, in days, the amount of time required to
     receive the item.
-->
<!ELEMENT LeadTime (#PCDATA)>

<!-- 
     ExpirationDate is the date after which the element is no longer valid.
     Date must be specified in ISO 8601 format.

-->
<!ELEMENT ExpirationDate (#PCDATA)>
<!-- 
     EffectiveDate date at which the element becomes valid.
     Date must be specified in ISO 8601 format.
-->
<!ELEMENT EffectiveDate (#PCDATA)>

<!--
     IndexItemDetail contains various index specific elements which
     help to define an index item.
     LeadTime           - time in days to receive the item
     ExpirationDate     - Expiration date for the item in this index
     EffectiveDate      - Effective date for the item in this index
     SearchGroupData    - Parametric search data
     TerritoryAvailable - Country codes
-->
<!ELEMENT IndexItemDetail (LeadTime, ExpirationDate?, EffectiveDate?,
                           SearchGroupData*, TerritoryAvailable*)>

<!-- 
     Specification of a territory (using ISO country and/or region codes)
     in which the particular index item is available.
-->
<!ELEMENT TerritoryAvailable (#PCDATA)>

<!--
     SearchGroupData specifies the data which should be used to identify
     this item in a search.
-->
<!ELEMENT SearchGroupData (Name, SearchDataElement+)>

<!--
     SearchDataElement is a field and value which are used to provide the
     parametric data to a search.
-->
<!ELEMENT SearchDataElement EMPTY>
<!ATTLIST SearchDataElement
     name  %string; #REQUIRED
     value %string; #REQUIRED
>



