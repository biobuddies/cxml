# cXML changelog

The cached upstream changelog has no entry for cXML 1.2.072.

> From the [upstream release notes](https://xml.cxml.org/current/ReleaseNotes.html).

## 1.2.071

---

### ScheduleLine Element

This is an existing element. A new attribute `statisticalDeliveryDate` is added to this element.

`ScheduleLine` includes the following attribute:

| Attribute | Description |
| --- | --- |
| `statisticalDeliveryDate` | The statistical date provided by the buyer at the schedule-line level offers visibility to the supplier on the originally requested delivery date and supports vendor KPI measurement and performance tracking. |

### IUIDInfo Element

This is a new element. It is added to the `ItemOutIndustry` and `ShipNoticeItem` elements to provide item unique identification information.

`IUIDInfo` modifies the following elements:

| Element | Description |
| --- | --- |
| `IUIDNumber` | A unique identification number for the item. |
| `requiresIUID` | A value of yes indicates that this item requires IUID information. |

### ImportInfo Element

This is a new element. It is added to the `ShipNoticeItemDetail` element to provide import-related information for the shipment.

`ImportInfo` modifies the following elements:

| Element | Description |
| --- | --- |
| `HTSCode` | Harmonized Tariff Schedule Code. A classification code used by customs authorities to identify products imported into a country and determine the applicable duties, tariffs, taxes, and trade regulations. |
| `ImporterOfRecord` | The individual or organization legally responsible for ensuring imported goods comply with a country's customs and trade regulations./td> |

## 1.2.070

---

There are no DTD changes for this release.

## 1.2.069

---

### ContractRequestHeaderIndustry Element

This is a new element. It is added to the `ContractRequestHeader` element for you to provide industry-specific header information to be used in the Aerospace and Defense industry for a contract request. It allows attribute-based access control on documents in the Aerospace and Defense industry.

`ContractRequestHeaderIndustry` modifies the following element:

| Element | Description |
| --- | --- |
| `AerospaceAndDefense` | Provides Aerospace and Defense industry information. It supports the use of the `AuthorizationLables` element to restrict document visibility. Only eligible users can access the documents in the Aerospace and Defense industry. |

### QuoteRequestHeaderIndustry Element

This is a new element. It is added to the `QuoteRequestHeader` element to provide industry-specific header information to be used in the Aerospace and Defense industry for a quote request. It allows attribute-based access control on documents in the Aerospace and Defense industry.

`QuoteRequestHeaderIndustry` modifies the following element:

| Element | Description |
| --- | --- |
| `AerospaceAndDefense` | Provides Aerospace and Defense industry information. It supports the use of the `AuthorizationLables` element to restrict document visibility. Only eligible users can access the documents in the Aerospace and Defense industry. |

## 1.2.068

---

### AuthorizationProfiles Element

This is a new element. It is added as a sub-element of `Person` within the `DataSyncSnapshot` element. The `AuthorizationProfiles` element enables synchronization of user authorization data between SAP Business Network and connected applications such as SAP Ariba Supplier Management (SM) or SAP Ariba Sourcing (S4), supporting Attribute-Based Access Control (ABAC) in controlled environments such as FedRAMP.

`AuthorizationProfiles` modifies the following element:

| Element | Description |
| --- | --- |
| `Person` | Supports the inclusion of the `AuthorizationProfiles` element, which holds all authorization profiles associated with a user. |

The `AuthorizationProfiles` groups all authorization profiles associated with a user. Each profile can contain one or more authorization attributes that define access restrictions or permissions.

If the `AuthorizationProfiles` element is empty (contains zero profiles), the system applies a Zero Trust model, and access to controlled resources is denied until valid profiles are synchronized.

`AuthorizationProfiles` contains the following sub-element:

| Element | Description |
| --- | --- |
| `AuthorizationProfile` | Identifies an individual authorization profile assigned to a user. Each profile is defined by a name, owning organization, and list of attributes. |

### AuthorizationProfile Element

This is a new element. It defines an individual authorization profile created by a buyer organization.

`AuthorizationProfile` modifies the following attributes:

| Attribute | Description |
| --- | --- |
| `name` | Specifies the profile name as displayed to the client. Must be unique in combination with the owning organization. |
| `owningOrg` | Specifies the ANID of the buyer organization that created this profile. |

`AuthorizationProfile` contains the following sub-element:

| Element | Description |
| --- | --- |
| `AttributeDomain` | Groups all attributes belonging to the authorization profile. |

### AttributeDomain

This is a new element. It defines attributes or properties used by Segregation of Duties (SOD).

Each domain can contain one or more attributes represented by IdReference elements.

`AttributeDomain` modifies the following attributes:

| Attribute | Description |
| --- | --- |
| `name` | Specifies the collaboration or document type (for example, ORDER\_COLLABORATION, PLANNING\_COLLABORATION, QUALITY\_COLLABORATION, or GENERAL). |

`AttributeDomain` contains the following sub-element:

| Element | Description |
| --- | --- |
| `IdReference` | Identifies an individual authorization attribute. Each must have a unique domain (for example, sip, program, or documentVisibility) and a single identifier value. If multiple identifiers apply, use separate `IdReference` elements. |

## 1.2.067

---

### CatalogInfo Element

This is a new element. It contains catalog information for the `SubscriptionChangeMessage` document.

`CatalogInfo` modifies the following elements:

| Element | Description |
| --- | --- |
| `CatalogInfo` | This is a new element.  A new `CatalogInfo` element is available for `SubscriptionChangeMessage`. `CatalogInfo` allows buyers and suppliers to view the details of each published catalog, and suppliers can validate, approve, and activate the catalog for their buyers. If the user interface differs between the buyer's and supplier's systems, `CatalogInfo` must be included in the `SubscriptionChangeMessage` element:  * `name`: The catalog's file name. * `size`: The total size of the catalog. * `totalItems`: The total number of items or products in the catalog. |
| `SubscriptionChangeMessage` | This is an existing element. `SubscriptionChangeMessage` element is enhanced to support additional elements for commodities. `CatalogInfo` requires the buyer and supplier to include the `name`, `size`, and `totalItems` of the catalog. `CatalogInfo` must be included in the `SubscriptionChangeMessage` element before it is routed from the supplier's data center to the buyer's data center. |

### acknowledgementRequired Attribute

This is a new attribute. The `acknowledgementRequired` has been added to the `AerospaceAndDefense` element. It allows orders to be sent with an acknowledgement status as `ActionRequired` or `notRequired`.

The acknowledgement status will remain `ActionRequired` until the supplier or surrogate acknowledger has manually acknowledged the order. DPAS-rated orders are unavailable for order confirmations until the orders are manually acknowledged. In ERP systems, the customer is responsible for labeling the order as "required ack". The `acknowledgementRequired` default value is "Yes".

`acknowledgementRequired` modifies the following elements:

| Element | Description |
| --- | --- |
| `AerospaceAndDefense` | Supports the use of `acknowledgementRequired` to send orders with an acknowledgment status. You can accept or reject the terms and conditions of the defense procurement order. This attribute is required for DPAS-related orders. `acknowledgementRequired` is optional for non-DPAS-rated orders.  The default value is `Yes`. When the value is set to `Yes`, the status is displayed as `ActionRequired`. When the value is set to `No`, the order's acknowledgement status is displayed as `notRequired`. |

## 1.2.066

---

### AerospaceAndDefense Element

This is a new element. It contains aerospace and defense industry header information for OrderRequestHeaderIndustry.

`AerospaceAndDefense` modifies the following elements:

| Element | Description |
| --- | --- |
| `AuthorizationLabels` | Supports the use of `AuthorizationLabels` in the DTD.  A new `DocumentVisibility` domain is available for `IdRefrence`. The `DocumentVisibility` domain is used to specify the visibility of the documents with an identifier:  * `identifier="citizen"`: The document is only available to users who are US citizens. * `identifier="US-Resident"`: The document is only available to users who are lawful permanent residents, such as green card holders. |
| `ProductActivityHeader` | Supports the use of `DPAS` in the DTD. |

### ProductActivityHeader Element

This is a new element. It defines header information that applies to SAP Business Network for Supply Chain.

`ProductActivityHeader` modifies the following attributes:

| Attribute | Description |
| --- | --- |
| `creationDate` | Displays the date of when the order was created in the `2014-11-10T22:00:00-08:00` format. |
| `messageID` | Displays the type of message to include in the document, for example: messageID-"inv\_001". |

### ProductActivityHeaderIndustry Element

This is a new element. Defines the industry-specific header information. When this element is added to the `ProductActivityHeader` element, you can define the industry element and its attributes.

`ProductActivityHeaderIndustry` modifies the following elements:

| Element | Description |
| --- | --- |
| `AerospaceAndDefense` | Provides aerospace and defense industry information. |
| `AuthorizationLabels` | Defines an IdReference attribute for this authorization label. Each IdReference means a different domain. No duplicate domain values are allowed. |

## 1.2.065

---

### PoolID Element

This is a new element. `PoolID` is an alternative to the `StudyID` element for grouping several studies together in the Life Sciences industry. Its value is passed only when several studies are pooled. Using this element modifies `StudyID` and `ProtocolID` as optional elements. `PoolID` is required for `ItemOutLifeSciences` when the `isCFGPooled` attribute's value is set to 'yes'.

`PoolID` modifies the following elements:

| Element | Description |
| --- | --- |
| `ShipNoticeItemLifeSciences` | Using `PoolID` modifies `StudyID` and `ProtocolID` as optional elements. |
| `ItemOutLifeSciences` | Using `PoolID` modifies `StudyID` and `ProtocolID` as optional elements.  Note: `PoolID` is required when the `isCFGPooled` attribute's value is set to 'yes'. |

| `OrderRequestHeaderIndustry` | Using `PoolID` modifies `StudyID` and `ProtocolID` as optional elements. |

## 1.2.064

---

### IncoTerm Attribute

This is a modification of an existing element. Specifies whether the supplier has delivered and unloaded the goods.

`incoTerm` modifies the following elements:

| Element | Description |
| --- | --- |
| `ConfirmationHeader` | Specify whether the supplier has delivered and unloaded the goods.  * `cfr` - Cost and Freight * `cif` - Costs, Insurance & Freight * `cip` - Carriage and Insurance Paid to * `cpt` - Carriage Paid to * `daf` - Delivered at Frontier * `dap` - Delivered at Place * `ddp` - Delivered at Duty * `ddu` - Delivered Duty Unpaid * `dpu` - Delivered at Place Unloaded * `deq` - Delivered ex Quay (duty paid) * `des` - Delivered ex Ship * `exw` - Ex Works * `fas` - Free Alongside Ship * `fca` - Free Carrier * `fob` - Free on Board |

## 1.2.063

---

### dpasRating Attribute

This is a modification of an existing element. It indicates that the order is DPAS-rated and requires a special handling to comply with the applicable law.

`dpasRating` modifies the following elements:

| Element | Description |
| --- | --- |
| `ScheduleLineAerospaceAndDefense` | Specify the highest rating of the schedule line. |
| `ItemOutAerospaceAndDefense` | Specify the highest rating of the item. |

## 1.2.062

---

### AuthorizationLabels Element

This is a new element. It defines one or more authorization labels for the document.

An authorization label identifies a document as part of a certain user-defined classification
but doesn't by itself grant or deny access to a user. Instead, it's up to the application
to decide if a user should or shouldn't have access based on this information.

`AuthorizationLabels` has the following element:

| Element | Description |
| --- | --- |
| `IdReference` (required) | Defines an ID reference for this authorization label. Each `IdReference` means a different `domain`. No duplicate `domain` values are allowed.  Valid `domain` values are:   * `sip` * `program`   Multiple values within the same `domain` must appear as comma-separated values in the same element. |

**Messages:** `OrderRequest`

### DPAS Element

This is a new element. It indicates that the order is DPAS-rated and requires a special handling
to comply with the applicable law. DPAS stands for Defense Priorities & Allocations System Program, a U.S.
program run by the Department of Commerce.

`DPAS` has the following attributes:

| Attribute | Description |
| --- | --- |
| `rating` (required) | The DPAS rating, such as DO or DX. More specific ratings can be entered here. |
| `contract` | The contract number related with this DPAS-rated order. Shouldn't be present for header-level. |
| `quantity` | The allocation quantity, for line-level or lower information. Shouldn't be present for header-level. |

**Messages:** `OrderRequest`

### ItemOutAerospaceAndDefense Element

This is a new element. It contains aerospace and defense industry item information.

`ItemOutAerospaceAndDefense` has the following element:

| Element | Description |
| --- | --- |
| `DPAS` (required) | Indicates that the order is DPAS-rated and requires a special handling to comply with the applicable law. |

**Messages:** `OrderRequest`

### ItemOutIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `ItemOutAerospaceAndDefense` | Contains aerospace and defense industry item information. See [ItemOutAerospaceAndDefense Element](#ItemOutAerospaceAndDefense). |

**Messages:** `OrderRequest`

### LifeSciences Element

This is a new element. It contains life sciences industry header information for orders.

`LifeSciences` has the following attribute:

| Attribute | Description |
| --- | --- |
| `orderCategory` | Life sciences order category. Possible values:   * `clinicalFinishedGoodsOrder` - Order for clinical finished goods. * `labelPrintingOrder` - Order for label printing. * `reworkOrder` - Order for rework. * `shelfLifeExtensionRelabelOrder` - Order for shelf-life extension relabeling. * `additionalLabelPrintingOrder` - Order for printing additional labels. |

**Messages:** `OrderRequest`

### OrderRequestHeaderIndustry Element

For the `industryType` attribute, the `aerospaceAndDefense` value was added.

The following elements were added:

| Element | Description |
| --- | --- |
| `LifeSciences` | Provides life sciences industry specific detail. See [LifeSciences Element](#LifeSciences). |
| `DPAS` | Header-level DPAS-rating information for this order, if applicable. See [DPAS Element](#DPAS). |
| `AuthorizationLabels` | Defines one or more authorization labels for the document. See [AuthorizationLabels Element](#AuthorizationLabels). |

**Messages:** `OrderRequest`

### ScheduleLine Element

The following element was added:

| Element | Description |
| --- | --- |
| `ScheduleLineIndustry` | Contains industry-specific information for the schedule line. See [ScheduleLineIndustry Element](#ScheduleLineIndustry). |

**Messages:** `OrderRequest`

### ScheduleLineAerospaceAndDefense Element

This is a new element. It contains aerospace and defense industry item information.

`ScheduleLineAerospaceAndDefense` has the following element:

| Element | Description |
| --- | --- |
| `DPAS` | Indicates that the order is DPAS-rated and requires a special handling to comply with the applicable law. See [DPAS Element](#DPAS). |

**Messages:** `OrderRequest`

### ScheduleLineIndustry Element

This is a new element. It contains schedule line industry-specific information.

`ScheduleLineIndustry` has the following element:

| Element | Description |
| --- | --- |
| `ScheduleLineAerospaceAndDefense` | Contains aerospace and defense industry item information. and requires a special handling to comply with the applicable law. See [ScheduleLineAerospaceAndDefense Element](#ScheduleLineAerospaceAndDefense). |

**Messages:** `OrderRequest`

## 1.2.061

---

### PaymentPartner Element

The [PaymentToken Element](#PaymentToken) was added.

**Message:** `PaymentRemittanceRequest`

### PaymentToken Element

This is a new element. It defines a virtual payment token card element used for payment.

`PaymentToken` has the following attributes:

| Attribute | Description |
| --- | --- |
| `number` (required) | Number of the virtual card. |
| `expiration` (required) | Expiration date of the virtual card. |
| `name` | Name of the virtual card. |
| `token` (required) | Token of the virtual card. The token is typically a randomly-generated string of characters or numbers with no inherent meaning outside the specific payment system. |

**Messages:** `PaymentRemittanceRequest`

### ServiceEntryRequestHeader Element

The value `update` was added to the `operation` attribute:

| Attribute | Description |
| --- | --- |
| `operation` (required) | * `new` - The `ServiceEntryRequest` creates a new service sheet. The default value is operation="new". * `update` - Updates an existing service sheet. The "update" document must be complete, and the existing   service sheet must be specified in a `DocumentReference` or `DocumentInfo` element. * `delete` - The `ServiceEntryRequest` cancels an existing service sheet, which must be specified by   referencing its `payloadID` in the `DocumentReference` element. |

**Message:** `ServiceEntryRequest`

## 1.2.060

---

### BusinessPartner Element

The value `logistics` was added to the `role` attribute:

| Attribute | Description |
| --- | --- |
| `role` (required) | Indicates the role the partner plays in the procurement process. Possible values are `soldTo`, `shipFrom`, `orderingAddress`, or `logistics`. |

**Message:** `OrderRequest`

### Indicator Element

This is a new element. It contains information about the indicator of a line item and if it is a warning or an error.

`Indicator` has the following attributes:

| Attribute | Description |
| --- | --- |
| `type` | Name given to indicator. |
| `level` | Defines whether the indicator is a warning or error message. Possible values:   * `warning` * `error` |

**Message:** `OrderRequest`

### ItemOut Element

The following attribute was updated:

| Attribute | Description |
| --- | --- |
| `operation` | Defines the action associated with the line item. Possible values:   * `delete` - Removes the line item. * `block` - Blocks the line item. |

The following element was added:

| Element | Description |
| --- | --- |
| `Indicator` | Contains information about the indicator of a line item and if it is a warning or an error. See [Indicator Element](#Indicator). |

**Message:** `OrderRequest`

### PackageControlNumber

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `isPackageControlNumberReleased` | Set to `yes` when the `PackageControlNumber` is released. |

**Message:** `OrderRequest`

### SubcontractingComponentIndustry

The following element was added:

| Element | Description |
| --- | --- |
| `BatchInfo` | Controls whether the batch information is required or not for an item when a supplier creates an order response. See [BatchInfo Element](#BatchInfo). |

**Message:** `OrderRequest`

## 1.2.059

---

### OrderRequestHeaderIndustry Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `industryType` | Identifies the industry for which the document is being sent. The only possible value is `lifeSciences`. |

**Message:** `OrderRequest`

### ShipNoticeItemLifeSciences Element

The following element was added:

| Element | Description |
| --- | --- |
| `MedicationListInfo` | Contains a set of medication sequence number ranges. See [MedicationListInfo Element](#MedicationListInfo). |

**Message:** `ShipNoticeRequest`

## 1.2.058

---

### ItemOutIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `ItemOutLifeSciences` | Contains life sciences industry item information. See [ItemOutLifeSciences Element](#ItemOutLifeSciences). |

**Message:** `OrderRequest`

### ItemOutLifeSciences Element

This is a new element. It contains life sciences industry item information. This information is sent to the supplier to support
collaboration for clinical supply management.

`ItemOutLifeSciences` has the following attribute:

| Attribute | Description |
| --- | --- |
| `isCFGPooled` | Indicates whether clinical finished goods are pooled, that is, used in a pool of studies. |

`ItemOutLifeSciences` has the following elements:

| Element | Description |
| --- | --- |
| `Study` (required) | Contains information about a clinical study. See [Study Element](#Study). |
| `KitType` | Contains a unique identifier for a group of clinical finished goods (CFG) that represents the generalization of the stock keeping unit of a specific clinical supply, regardless of country-specific packaging and labeling requirements. See [KitType Element](#KitType). |
| `ProtocolID` (required) | Contains a unique external identifier assigned to the protocol. The protocol is the detailed plan of the clinical study. See [ProtocolID Element](#ProtocolID). |
| `PackageControlNumber` | Contains an identification number used for blinding the individual batch numbers for an active drug and a placebo. See [PackageControlNumber Element](#PackageControlNUmber). |
| `PoolID` | Contains an alternative to `StudyID` when several studies are pooled or grouped together. This value is passed only when several studies are pooled. See [PoolID Element](#PoolID). |
| `MedicationListInfo` | Contains a set of medication sequence number ranges. See [MedicationListInfo Element](#MedicationListInfo). |
| `Extrinsic` | Contains any additional information related to the `ItemOutLifeSciences` element. |

**Message:** `OrderRequest`

### KitType Element

This is a new element. It contains a unique identifier for a group of clinical finished goods (CFG) that represents
the generalization of the stock keeping unit of a specific clinical supply, regardless of country-specific packaging
and labeling requirements.

`KitType` has the following elements:

| Element | Description |
| --- | --- |
| `KitTypeID` (required) | Contains an identification number of the kit type. See [KitTypeID Element](#KitTypeID). |
| `Description` | Contains a string that describes the `KitType`. |

**Message:** `OrderRequest`

### KitTypeID Element

This is a new element. It contains an identification number of the kit type.

**Message:** `OrderRequest`

### LabelID Element

This is a new element. It contains an identification number used in the BOM for artwork of a label.

**Message:** `OrderRequest`

### MedicationListInfo Element

This is a new element. It contains a set of medication sequence number ranges.

`MedicationListInfo` has the following attribute:

| Attribute | Description |
| --- | --- |
| `type` | Specifies the available medication sequence numbers. Possible value:  * range - A range of sequence numbers, only valid for numeric ranges. |

`MedicationListInfo` has the following element:

| Element | Description |
| --- | --- |
| `PropertyValue` | When MedictionListInfo@type is "range", minimum and maximum acceptable limits should be provided in PropertyValue element. In this case, PropertyValue@name should be "range" and PropertyValue@Characteristic should provide the minimum and maximum values in Characteristic@value attribute with "minimum" and "maximum" as domains in Characteristic@domain attribute. |

**Message:** `OrderRequest`

### PackageControlNumber Element

This is a new element. It contains an identification number used for blinding the individual batch numbers for an active drug and a placebo.

`PackageControlNumber` has the following attribute:

| Attribute | Description |
| --- | --- |
| `packageControlNumberExpiryDate` (required) | Expiration date of the `PackageControlNumber`. |

**Message:** `OrderRequest`

### Packaging Element

The following element was added:

| Element | Description |
| --- | --- |
| `PackagingIndustry` | Contains industry relevant information. See [PackagingIndustry Element](#PackagingIndustry). |

**Message:** `OrderRequest`, `ShipNoticeRequest`

### PackagingIndustry Element

This is a new element. It contains industry relevant information.

`PackagingIndustry` has the following element:

| Element | Description |
| --- | --- |
| `PackagingLifeSciences` | Defines life sciences industry specific information for `Packaging`. See [PackagingLifeSciences Element](#PackagingLifeSciences). |

**Message:** `OrderRequest`, `ShipNoticeRequest`

### PackagingLifeSciences Element

This is a new element. It defines life sciences industry specific information for `Packaging`.

`PackagingLifeSciences` has the following element:

| Element | Description |
| --- | --- |
| `MedicationListInfo` | Contains a set of medication sequence number ranges. See [MedicationListInfo Element](#MedicationListInfo). |

**Message:** `OrderRequest`, `ShipNoticeRequest`

### PoolID Element

This is a new element. It contains an alternative to `StudyID` when several clinical studies are pooled or grouped together. This value
is passed only when several clinical studies are pooled.

**Message:** `OrderRequest`

### ProtocolID Element

This is a new element. It contains a unique external identifier assigned to the protocol. The protocol is the detailed plan of the
clinical study.

**Message:** `OrderRequest`, `ShipNoticeRequest`

### ShipNoticeItemIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `ShipNoticeItemLifeSciences` | Contains life sciences specific elements for ship notices. See [ShipNoticeItemLifeSciences Element](#ShipNoticeItemLifeSciences). |

**Message:** `ShipNoticeRequest`

### ShipNoticeItemLifeSciences Element

This is a new element. It contains life sciences specific elements for ship notices.

`ShipNoticeItemLifeSciences` has the following elements:

| Element | Description |
| --- | --- |
| `Study` | Contains information about a clinical study. See [Study Element](#Study). |
| `ProtocolD` | Contains a unique external identifier assigned to the protocol. The protocol is the detailed plan of the clinical study. See [ProtocolID Element](#ProtocolID). |
| `Extrinsic` | Contains any additional information related to the `ShipNoticeItemLifeSciences` element. |

**Message:** `ShipNoticeRequest`

### Study Element

This is a new element. It contains information about a clinical study.

`Study` has the following elements:

| Element | Description |
| --- | --- |
| `StudyID` (required) | Contains a unique identification number of a clinical study. See [StudyID Element](#StudyID). |
| `Description` | Contains a string that describes the study. |

**Message:** `OrderRequest`, `ShipNoticeRequest`

### StudyID Element

This is a new element. It contains a unique identification number of a clinical study.

**Message:** `OrderRequest`, `ShipNoticeRequest`

### SubcontractingComponent Element

The following element was added:

| Element | Description |
| --- | --- |
| `SubcontractingComponentIndustry` | Contains industry-specific information for `SubcontractingComponent`. See [SubcontractingComponentIndustry Element](#SubcontractingComponentIndustry). |

**Message:** `OrderRequest`

### SubcontractingComponentIndustry Element

This is a new element. It contains industry-specific information for `SubcontractingComponent`.

`SucontractingComponentIndustry` has the following element:

| Element | Description |
| --- | --- |
| `SubcontractingComponentLifeSciences` | Contains life sciences specific elements for subcontracting components. See [SubcontractingComponentLifeSciences Element](#SubcontractingComponentLifeSciences). |

**Message:** `OrderRequest`

### SubcontractingComponentLifeSciences Element

This is a new element. It contains life sciences specific elements for subcontracting components.

`SubcontractingComponentLifeSciences` has the following elements:

| Element | Description |
| --- | --- |
| `LabelID` | Contains an identification number used in the BOM for artwork of a label. See [LabelID Element](#LabelID). |
| `Extrinsic` | Contains any additional information related to the `SubcontractingComponentLifeSciences` element. |

**Message:** `OrderRequest`

## 1.2.057

---

There are no DTD changes for this release.

## 1.2.056

---

### IdReference Element

The following values were added for the `domain` attribute:

* `buyerLocationID`
* `storageLocationID`
* `unloadingPointID`

**Message:** `OrderRequest`

### ItemOut Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `operation` | Defines the action associated with the line item. There is only one possible value:   * `delete` - Removes the line item. |

**Message:** `OrderRequest`

### ScheduleLine Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `type` | Defines the schedule line type when the `OrderRequest` is a scheduling agreement release. For information purposes only. Possible values:   * `backlog` - The schedule line has a delivery date in the past. * `immediate` - The schedule line has the delivery date 'today.' * `forecast` - The schedule line has a delivery date in the future. |

**Message:** `OrderRequest`

## 1.2.055

---

There are no DTD changes for this release.

## 1.2.054

---

### AcceptanceScheduleDetail Element

The documentation for the `approvedAction` and `lineNumber` attributes was updated.

**Message:** `ApprovalRequest`

### ModificationDetail Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `scope` | The scope of the modification. Possible values:   * `unitPrice` - Applies to pricing conditions for the item. * `lineItem` - Applies to allowances or charges for the line item. |
| `calculationType` | The calculation logic applied to this modification. Possible values:   * `fixedAmount` * `quantity` * `percentage` |

The following elements were added:

| Element | Description |
| --- | --- |
| `IdReference` | Defines an ID reference for this modification. The domain for an `IdReference` contained in `ModificationDetail` should be `"ID"`.  **Note:** The `IdReference` and `ParentID` elements are used to define a hierarchy of pricing conditions for a line item. They are not used for header-level modifications. |
| `ParentID` | Identifies the parent modification within the line item that is calculated before its child modifications. |

**Message:** `OrderRequest`

### QualityNotificationActivity, QualityNotificationCause, QualityNotificationRequestItem, and QualityNotificationTask Elements

The following element was added:

| Element | Description |
| --- | --- |
| `QNNotes` | Defines comments and attachments for this quality notification object. |

**Message:** `QualityNotificationRequest`

## 1.2.053

---

### ProductActivityHeader Element

The following value was added to the `processType` attribute: `StockInventory`.

**Message:** `ProductActivityMessage`

### ReceiptRequestHeader Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `activityStepType` | An identifier for a business process. The only possible value is `stockTransfer`, representing the stock transport order scenario. |

**Message:** `ReceiptRequest`

### ShipNoticeHeader Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `activityStepType` | An identifier for a business document. When creating a ship notice for a stock transport order, you must specify one of the following values:   * `stockTransfer` - Identifies a ship notice message sent from buyer to supplier for stock transfer   scenario. * `stockShippingAdvice` - Identifies a ship notice message sent from a supplier for stock transfer   scenario. |

**Message:** `ShipNoticeRequest`

## 1.2.052

---

There are no DTD changes for this release.

## 1.2.051

---

### ItemOut Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `stoFinalDelivery` | When the attribute `itemCategory` has the value "stockTransfer" and the attribute `stoFinalDelivery` is set to "yes", then further ship notice creation isn't possible. This setting is relevant for stock transport orders or stock transport releases. |

**Message:** `OrderRequest`

### PaymentProposalRequest Element

The following element was added:

| Element | Description |
| --- | --- |
| `DiscountPercent` | The discount rate applied to the payable, expressed as a percentage. |

**Message:** `PaymentProposalRequest`

## 1.2.050

---

### InvoiceDetailRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `PaymentInformation` | Defines payment information that buyers can provide in ERP Copy Invoices and ERS invoices. It contains the payment net due date for an invoice as determined by the buyer. See [PaymentInformation Element](#PaymentInformation). |

**Message:** `InvoiceDetailRequest`

### InvoiceStatus Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `paymentNetDueDate` | Date and time after which the invoice has to be paid without any discount.  The date/time value can include a time-zone offset from Coordinated Universal Time (UTC).  The payment net due date may be based on settings the buyer has configured in their invoice processing system to determine when the invoice must be paid without discount. The value of the payment net due date is not a legally binding date. Actual payment could happen before or after that date. |

**Message:** `StatusUpdateRequest`

### PaymentInformation Element

This is a new element. It defines payment information that buyers can provide in ERP Copy Invoices and ERS invoices.
It contains the payment net due date for an invoice as determined by the buyer.

`PaymentInformation` has the following attribute:

| Attribute | Description |
| --- | --- |
| `paymentNetDueDate` | Date and time after which the invoice has to be paid without any discount.  The date/time value can include a time-zone offset from Coordinated Universal Time (UTC).  The payment net due date may be based on settings the buyer has configured in their invoice processing system to determine when the invoice must be paid without discount. The value of the payment net due date is not a legally binding date. Actual payment could happen before or after that date. |

**Message:** `InvoiceDetailRequest`

## 1.2.049

---

### ContractItemIn Element

The following elements were added:

| Element | Description |
| --- | --- |
| `SupplierProductionFacilityRelations` | Defines the relationships that exist between suppliers' production facilities and their production facility roles. See [SupplierProductionFacilityRelations Element](#SupplierProductionFacilityRelations). |
| `Extrinsic` | Contains any additional information related to the contract item. |

**Message:** `ContractRequest`

### Correspondent Element

The following element was added:

| Element | Description |
| --- | --- |
| `Routing` | Defines the corresponding routing destination. See [Routing Element](#Routing). |

**Message:** All messages received from an external business partner.

### IdReference Element

The `domain` attribute now supports an additional value, `iso6523`, which identifies a business
partner with the electronic address scheme governed by the iso6523 standard.

**Message:** All messages received from an external business partner.

### ItemOut Element

The `stoDelivery` attribute, which specifies whether full or partial delivery is allowed for a stock transport order item, no longer has a default value.

**Message:** `OrderRequest`

### QuoteItemIn Element

The following elements were added:

| Element | Description |
| --- | --- |
| `SupplierProductionFacilityRelations` | Defines the relationships that exist between suppliers' production facilities and their production facility roles. See [SupplierProductionFacilityRelations Element](#SupplierProductionFacilityRelations). |
| `Extrinsic` | Contains any additional information related to the quote item. |

**Message:** `QuoteMessage`

### QuoteMessageHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `SupplierProductionFacilityRelations` | Defines the relationships that exist between suppliers' production facilities and their production facility roles. See [SupplierProductionFacilityRelations Element](#SupplierProductionFacilityRelations). |

**Message:** `QuoteMessage`

### Routing Element

This is a new element. It defines the corresponding routing destination of an external business partner.

`Routing` has the following attribute:

| Attribute | Description |
| --- | --- |
| `destination` (required) | The name of the routing destination. Possible values:   * `peppol` * `fieldglass` |

**Message:** All messages received from an external business partner.

## 1.2.048

---

### BlanketItemDetail Element

The following elements were added:

| Element | Description |
| --- | --- |
| `OverallLimit` | Contains the maximum value that the total of all unplanned services (or the value of the material) covered by this item may not exceed. This limit represents a budget for unplanned services, and it must not be exceeded. This limit can be used in service lines and the items of blanket purchase orders. At service outline level (top-level service item), this field captures limit for the total of all unplanned services (or the value of the material). At service item level, it captures the sub-limits (the budget for that item). See [OverallLimit Element](#OverallLimit). |
| `ExpectedLimit` | Contains a value that the unplanned services (or the material) covered by this item are not expected to exceed. `ExpectedLimit` captures the planned or expected value and is mainly used for analysis purposes and for determining the total value of the item. The buyer assumes that `ExpectedLimit` is the final amount payable. `ExpectedLimit` is specified only for a top-level service item.  The `ExpectedLimit` is generally less than the specified `OverallLimit`. However, `ExpectedLimit` can also be higher than `OverallLimit` if the buyer determines that the total sum payable is made available at the start of the procurement project, but initially only services worth a value of up to the `OverallLimit` may be performed. Further work can only be carried out if the buyer increases the `OverallLimit`. This enables progressive allotment of the budget to different phases of the project. See [ExpectedLimit Element](#ExpectedLimit). |

**Message:** `OrderRequest`, `MasterAgreementRequest`, `PunchOutSetupRequest`

### BusinessPartner Element

This is a new element. It contains information about the business partner for an item.

`BusinessPartner` has the following attributes:

| Attribute | Description |
| --- | --- |
| `type` (required) | Identifies the type of the business partner. Only possible value is `organization`. |
| `role` (required) | Indicates the role the partner plays in the procurement process. Possible values are `soldTo`, `shipFrom`, or `orderingAddress`. |

`BusinessPartner` has the following elements:

| Element | Description |
| --- | --- |
| `Address` (required) | Provides a description of the business party. Follow these instructions for each `role`:   * `soldTo`: The `domain` attribute of the element `IdReference`   should be set to "buyerAccountID", the identifier to the sold to party ID. The `addressIDDomain` should be set to   "buyerAccountID". The `addressID` should be set to the sold to party ID. Use the name for the description. * `shipFrom`: The `addressIDDomain` should be set to "shipFromAddressID". The `addressID`   should be set to the ship from party ID. Use the name for the description. * `orderingAddress`: The `addressIDDomain` should be set to "supplierCorporate". The   `addressID` should be set to the ordering address party ID. Use the name for the description. |
| `IdReference` | ID reference is within the application context (for example, a certain pair of buyer and supplier). The (identifier, domain) pair should be unique. |

**Message:** `OrderRequest`

### ItemIn Element

The following attribute was updated:

| Attribute | Description |
| --- | --- |
| `itemCategory` | Specifies how an item is procured. The following item category was added:   * `limit` - Indicates that there is an expected limit for unplanned services or material   covered by this item. |

**Message:** `ConfirmationRequest`, `ContractRequest`

### ItemOut Element

The following attributes were added or updated:

| Attribute | Description |
| --- | --- |
| `itemCategory` | Specifies how an item is procured. The following item category was added:   * `limit` - Indicates that there is an expected limit for unplanned services or material   covered by this item. |
| `stoDelivery` | The delivery options possible for stock transport order item.   * `full` (default) - Only full delivery allowed for the order. This is specific to stock transport order or stock transport release. * `partial` - Partial delivery allowed for the order. This is specific to stock transport order or stock transport release. |
| `stoOrderCombination` | When the attribute `itemCategory` has the value "stockTransfer" and the attribute `stoOrderCombination` is set to "yes", then it is possible to combine items from different stock transport orders with the flag set during ship notice creation. The corresponding flag for order combination is set in the buyer's ERP. This setting is relevant for stock transport orders or stock transport releases. |

**Message:** `OrderRequest`

### OrderRequestHeader Element

The following attributes were added or updated:

| Attribute | Description |
| --- | --- |
| `orderType` | The following type was added:   * `stockTransportRelease` - Indicates that this order is a stock transport scheduling agreement release (SAR). |
| `isSTOOutbound` | Set to `yes` to indicate that this `OrderRequest` is used to send the stock to the supplier. The goods are sent from the buyer plant to the supplier plant. This is currently relevant only for the stock transport order scenario. |

The following element was added:

| Element | Description |
| --- | --- |
| `BusinessPartner` | Contains information about the business partner for an item. See [BusinessPartner Element](#BusinessPartner). |

**Message:** `OrderRequest`

## 1.2.047

---

### IdReference Element

Depending on your procurement application, the `domain` attribute supports an additional possible value:

* `creditorRefID` - Specifies the creditor reference number for an `InvoicePartner`.

**Message:** `InvoiceDetailRequest`

## 1.2.046

---

### AccountCurrency Element

This is a new element. It refers to the account currency for a `PaymentPartner`.

`AccountCurrency` has the following attribute:

| Attribute | Description |
| --- | --- |
| `code` (required) | Specifies a three-letter ISO 4217 currency code. |

**Message:** `PaymentBatchRequest`

### ContractRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `SupplierProductionFacilityRelations` | Defines the relationships that exist between suppliers' production facilities and their production facility roles. See [SupplierProductionFacilityRelations Element](#SupplierProductionFacilityRelations). |

**Message:** `ContractRequest`

### ItemIn Element

The following element was added:

| Element | Description |
| --- | --- |
| `Period` | The period during which the service item can be performed. |

**Message:** `ConfirmationRequest`, `ContractRequest`, `PunchOutOrderMessage`, `PurchaseRequisitionRequest`, `SalesOrderRequest`

### ItemOut Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `stockTransferType` | The buyer's ERP system sends the stock transfer type based on the stock transport order. Possible values:   * `intra` - Refers to transfer of stock from one plant to another plant within the same company code. * `inter` - Refers to transfer of stock from one plant to another plant in different company codes. |

**Message:** `OrderRequest`

### OrderRequestHeader Element

The `orderType` attribute was updated, adding a new value, `stockTransport`:

| Attribute | Description |
| --- | --- |
| `orderType` (required) | Type of order. Possible values:   * `regular` - Standard purchase order (default). * `release` - Release against an existing master agreement, contract, or a blanket purchase order. * `blanket` - Blanket purchase order. * `stockTransport` - Stock transport order. |

**Message:** `OrderRequest`

### PaymentPartner Element

The following element was added:

| Element | Description |
| --- | --- |
| `AccountCurrency` | Refers to the account currency for the current `PaymentPartner`. See [AccountCurrency Element](#AccountCurrency). |

**Message:** `PaymentBatchRequest`

### PaymentPurpose Element

This is a new element. It refers to the purpose of payment, for example, reimbursement of medical expenses, salary, and so on.

`PaymentPurpose` has the following attribute:

| Attribute | Description |
| --- | --- |
| `code` (required) | Code representing the payment purpose. This may be a country-specific code for the payment purpose. The value `"other"` indicates that a free-text payment purpose is provided instead. |

**Message:** `PaymentBatchRequest`

### PaymentRemittanceRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `PaymentPurpose` | Refers to the purpose of payment. See [PaymentPurpose Element](#PaymentPurpose). |

**Message:** `PaymentBatchRequest`

### ProductActivityDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `ManufacturerName` | Name of the item's manufacturer. |

**Message:** `ProductActivityMessage`

### ProductReplenishmentDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `ManufacturerName` | Name of the item's manufacturer. |

**Message:** `ProductReplenishmentMessage`

### ProductionFacility Element

This is a new element. It defines a supplier unit used for a particular manufacturing process.

`ProductionFacility` has the following attribute:

| Attribute | Description |
| --- | --- |
| `name` | Name of the production facility. |

`ProductionFacility` has the following elements:

| Element | Description |
| --- | --- |
| `IdReference` (required) | Defines an ID reference. The identifier/domain pair identifies a production facility. |
| `ProductionFacilityRole` (required) | Identifies the stage of a manufacturing process for which a supplier production facility is used. |

**Message:** `ContractRequest`

### ProductionFacilityAssociation Element

This is a new element. It defines a relationship between a production facility and a production facility role.

`ProductionFacilityAssociation` has the following attribute:

| Attribute | Description |
| --- | --- |
| `operation` | Operation to be performed. Possible values:   * `new` (default) - Represents a new production facility association sent to the external system. * `update` - Represents an update to an existing production facility association. * `delete` - Represents an instruction to delete this production facility association in the external system. |

`ProductionFacilityAssociation` has the following elements:

| Element | Description |
| --- | --- |
| `ProductionFacility` (required) | Defines a relationship between a production facility and a production facility role. See [ProductionFacility Element](#ProductionFacility). |
| `OrganizationalUnit` (required) | Purchasing organization of the buyer. |
| `ShipTo` | Optional Ship-To addressing information for the buyer's plant. |

**Message:** `ContractRequest`

### ProductionFacilityRole Element

This is a new element. It defines the stage of a manufacturing process for which a supplier production
facility is used. For example, an apparel manufacturing process could have separate production facility
roles for cutting, sewing, pressing and folding, finishing and detailing, dyeing, and washing.

`ProductionFacilityRole` has the following attribute:

| Attribute | Description |
| --- | --- |
| `name` | Name of the production facility role. |

`ProductionFacilityRole` has the following element:

| Element | Description |
| --- | --- |
| `IdReference` | Defines an ID reference. The identifier/domain pair identifies a production facility role. |

**Message:** `ContractRequest`

### ShipNoticeItem Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `stockTransferType` | Specifies the type of stock transport order. Possible values:   * `intra` - Identifies the ship notice item was created for intra stock transport order. * `inter` - Identifies the ship notice item was created for inter stock transport order. |
| `outboundType` | Set to `stockTransport` to indicate that outbound delivery needs to be created for a stock transport order. |

**Message:** `ShipNoticeRequest`

### SupplierProductionFacilityRelations Element

This is a new element. It defines the relationships that exist between suppliers' production facilities and their production
facility roles.

`SupplierProductionFacilityRelations` has the following element:

| Element | Description |
| --- | --- |
| `ProductionFacilityAssociation` (required) | Defines a relationship between a production facility and a production facility role. See [ProductionFacilityAssociation Element](#ProductionFacilityAssociation). |

**Message:** `ContractRequest`

## 1.2.045

---

### ChargeFile Element

This is a new element. It contains bank charge file related information. The bank charge file is the file sent by banks
to the buyer for reconciliation purposes.

`ChargeFile` has the following attributes:

| Attribute | Description |
| --- | --- |
| `filename` | Name of the bank charge file. |
| `size` | Size of the bank charge file. |
| `frequency` (required) | Defines the frequency of the bank charge file. Possible values:   * `daily` * `weekly` * `monthly` |
| `format` | Defines the standard format of the bank charge file, for example, MT940, CAMT.053, BAI2, or CSV. |
| `statementDate` (required) | Date of generation of this charge file statement. |

`ChargeFile` has the following elements:

| Element | Description |
| --- | --- |
| `Period` (required) | Defines the period for the charge file. |
| `Attachment` (required) | Contains a URL reference to the attached charge file. |
| `NumberOfCharges` (required) | Contains the number of charges contained in the attachment. |

**Message:** `ChargeFileRequest`

### ChargeFileDetails Element

This is a new element. It contains a list of bank charge files.

`ChargeFileDetails` has the following elements:

| Element | Description |
| --- | --- |
| `ChargeFile` (required) | Bank charge file related information. See [ChargeFile Element](#ChargeFile). |
| `Comments` | Comments associated with these bank charge files. |
| `IdReference` | Defines an ID reference. For example, the identifier/domain pair could identify the buyer. |
| `Extrinsic` | Contains any additional information related to the bank charge files. |

**Message:** `ChargeFileRequest`

### ChargeFileRequest Element

This is a new element. It is a cXML request wrapper for a bank charge file.
Each request is guaranteed to be for one buyer from one bank account. Therefore,
the request uniquely identifies the buyer associated with the charge
file. The `ChargeFileRequest` document is sent by the
provider to the buyer.

`ChargeFileRequest` has the following elements:

| Element | Description |
| --- | --- |
| `ChargeFileRequestHeader` (required) | Contains required fields to process a bank charge file. See [ChargeFileRequestHeader Element](#ChargeFileRequestHeader). |
| `ChargeFileDetails` (required) | Contains a list of bank charge files. See [ChargeFileDetails Element](#ChargeFileDetails). |

**Message:** `ChargeFileRequest`

### ChargeFileRequestHeader Element

This is a new element. It contains the required fields to process a bank charge file.

`ChargeFileRequestHeader` has the following elements:

| Element | Description |
| --- | --- |
| `ProviderName` (required) | Contains the bank/provider name. |
| `Comments` | Comments associated with these bank charge files. |
| `IdReference` | Defines an ID reference. For example, the identifier/domain pair could identify the buyer. |
| `Extrinsic` | Contains any additional information related to the bank charge files. |

**Message:** `ChargeFileRequest`

### ItemOut Element

The `Comments` element was updated to support multiple instances.

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `unlimitedDelivery` | Set to `yes` to indicate that the line item supports unlimited quantity deliveries. Corresponding unlimited delivery tolerance is flagged on the ERP. This flag is used during ship notice creation only. |
| `isItemChanged` | Set to `yes` to indicate that the item has changed. |
| `isKanban` | Set to `yes` to indicate that the item is flagged for the Kanban process. Kanban-related orders require in time and 100% delivery quality. |

**Message:** `MasterAgreementRequest`, `OrderRequest`, `PunchOutSetupRequest`

### ItemOutIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `PackagingDistribution` | Provides packaging distribution information between stores. See [PackagingDistribution Element](#PackagingDistribution). |

**Message:** `MasterAgreementRequest`, `OrderRequest`, `PunchOutSetupRequest`

### NumberOfCharges Element

This is a new element. It contains the total number of charges included in the bank charge file.

**Message:** `ChargeFileRequest`

### OrderRequestHeader Element

The `Comments` element was updated to support multiple instances.

**Message:** `OrderRequest`

### Packaging Element

The following element was added:

| Element | Description |
| --- | --- |
| `StoreCode` | The code of the store assigned for this packaging. See [StoreCode Element](#StoreCode). |

**Message:** `InvoiceDetailRequest`, `MasterAgreementRequest`, `OrderRequest`, `PunchOutSetupRequest`, `ShipNoticeRequest`, `TransportRequest`

### PackagingDistribution Element

This is a new element. It contains packaging distribution information between stores.

`PackagingDistribution` has the following attribute:

| Attribute | Description |
| --- | --- |
| `quantity` (required) | Number of this packaging distribution information. Expressed in the units given in the `UnitOfMeasure` element. |

`PackagingDistribution` has the following elements:

| Element | Description |
| --- | --- |
| `StoreCode` (required) | The code of the store assigned for this packaging distribution information. See [StoreCode Element](#StoreCode). |
| `UnitOfMeasure` (required) | The unit of measure for the quantity. It must conform with UN/CEFACT Unit of Measure Common Codes. |

**Message:** `MasterAgreementRequest`, `OrderRequest`, `PunchOutSetupRequest`

### PaymentAmount Element

This is a new element. It contains the amount paid in the payment receipt.

**Message:** `PaymentReceiptConfirmationRequest`

### PaymentDetails Element

This is a new element. It contains details of the payment.

`PaymentDetails` has the following elements:

| Element | Description |
| --- | --- |
| `PaymentAmount` (required) | Amount paid in the payment receipt. See [PaymentAmount Element](#PaymentAmount). |
| `PreviousBalance` | Balance amount to be paid before making this payment. See [PreviousBalance Element](#PreviousBalance). |
| `PresentBalance` | Balance amount to be paid later. See [PresentBalance Element](#PresentBalance). |
| `Extrinsic` | Contains any additional information, including country-specific information, related to the `PaymentDetails`. |

**Message:** `PaymentReceiptConfirmationRequest`

### PaymentReceiptConfirmationRequest Element

This is a new element. It defines a payment receipt confirmation request, which is sent to the buyer by a supplier. It
transmits a Payment Receipt confirmation request to a buyer, and it provides information related to the payment, including payment
partner details, supplier tax ID, buyer tax ID, document submission method, and so on. This document must be sent to the
location specified in the buyer's `ProfileResponse`.

Payment receipts are defined by certain tax authorities, such as the Mexican Tax Authority (SAT). Payment receipts must
be issued by suppliers when they receive payments in installments or after the invoice date.

`PaymentReceiptConfirmationRequest` has the following elements:

| Element | Description |
| --- | --- |
| `PaymentReceiptConfirmationRequestHeader` (required) | Header of a `PaymentReceiptConfirmationRequest`, which is sent to the buyer to confirm the payment received by the supplier or contractor. See [PaymentReceiptConfirmationRequestHeader Element](#PaymentReceiptConfirmationRequestHeader). |
| `PaymentReceiptDetails` (required) | Contains detailed information of the receipt associated with the payment made. See [PaymentReceiptDetails Element](#PaymentReceiptDetails). |
| `PaymentReceiptSummary` (required) | Contains a summary of the payment made. See [PaymentReceiptSummary Element](#PaymentReceiptSummary). |
| `Extrinsic` | Contains any additional information related to the `PaymentReceiptConfirmationRequest`, including country-specific information like payment receipt submission method, classification code, and so on. |

**Message:** `PaymentReceiptConfirmationRequest`

### PaymentReceiptConfirmationRequestHeader Element

This is a new element. It defines the header for a `PaymentReceiptConfirmationRequest`.

`PaymentReceiptConfirmationRequestHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `paymentReceiptID` (required) | A supplier generated identifier for the payment receipt. |
| `issuedDate` (required) | Date and time this payment receipt was created. |
| `paymentReceivedDate` (required) | Date and time at which payment was received by the payee. |
| `paymentReferenceNumber` | Indicates a payment transaction reference or payment identification number. For example, for check payments, the `paymentReferenceNumber` is the check number, and for electronic payments, it is an electronic reference or confirmation number. |

`PaymentReceiptConfirmationRequestHeader` has the following elements:

| Element | Description |
| --- | --- |
| `PaymentMethod` | The payment method used for the payment. |
| `PaymentPartner` (required) | Payer (buyer user) and payee (supplier user), originating bank, and receiving bank contact details. |
| `Comments` | Contains comments associated with this `PaymentReceiptConfirmationRequest`. |
| `Extrinsic` | Contains any additional information related to the `PaymentReceiptConfirmationRequest`. Should not duplicate anything in `PaymentReceiptConfirmationRequest`. |

**Message:** `PaymentReceiptConfirmationRequest`

### PaymentReceiptDetails Element

This is a new element. It contains `PaymentReceiptItem` elements. Each `PaymentReceiptItem` corresponds to one
invoice or payment remittance document.

`PaymentReceiptDetails` has the following element:

| Element | Description |
| --- | --- |
| `PaymentReceiptItem` | Contains details of the individual invoice for which the payment is made. See [PaymentReceiptItem Element](#PaymentReceiptItem). |

**Message:** `PaymentReceiptConfirmationRequest`

### PaymentReceiptItem Element

This is a new element. It contains details of the individual invoice for which the payment is made.

`PaymentReceiptItem` has the following attributes:

| Attribute | Description |
| --- | --- |
| `paymentLineNumber` (required) | Line number of the payment in payment receipt document. |
| `installmentNumber` | The installment number of the payment number. |

`PaymentReceiptItem` has the following elements:

| Element | Description |
| --- | --- |
| `PaymentDetails` (required) | Contains details of the payment. See [PaymentDetails Element](#PaymentDetails). |
| `ReferenceDocumentInfo` (required) | Contains details of the reference document for which the payment is made. |
| `Extrinsic` | Contains any additional information, including country-specific information, related to the `PaymentReceiptItem`. |

**Message:** `PaymentReceiptConfirmationRequest`

### PaymentReceiptSummary Element

This is a new element. It contains the summary of the payment amount details.

`PaymentReceiptSummary` has the following elements:

| Element | Description |
| --- | --- |
| `NetAmount` (required) | Contains the net amount paid through the payment receipt. |
| `Extrinsic` | Contains any additional information, including country-specific information, related to the `PaymentReceiptSummary`. |

**Message:** `PaymentReceiptConfirmationRequest`

### PresentBalance Element

This is a new element. It contains the balance amount to be paid later.

**Message:** `PaymentReceiptConfirmationRequest`

### PreviousBalance Element

This is a new element. It contains the balance amount to be paid before making this payment.

**Message:** `PaymentReceiptConfirmationRequest`

### ProviderName Element

This is a new element. It contains the bank/provider name for a `ChargeFileRequest`.

`ProviderName` has the following attribute:

| Attribute | Description |
| --- | --- |
| `xml:lang` (required) | Language or locale in which the `ProviderName` is written. |

**Message:** `ChargeFileRequest`

### StoreCode Element

This is a new element. It contains the code of a store assigned for an item's packaging. If packaging is distributed between multiple stores, then multiple store codes are specified in the distribution.

**Message:** `InvoiceDetailRequest`, `MasterAgreementRequest`, `OrderRequest`, `PunchOutSetupRequest`, `ShipNoticeRequest`, `TransportRequest`

## 1.2.044

---

### ConditionType Element

This is a new element. It references a pricing condition type. `ConditionType` can have a
default cost term value, which is used in cases where scales are not specified. If the scale is
specified, the cost term value provided in the scale is used.

`ConditionType` has the following attribute:

| Attribute | Description |
| --- | --- |
| `name` (required) | Name of the condition type. Examples: Price, Surcharge. |

`ConditionType` has the following elements:

| Element | Description |
| --- | --- |
| `CostTermValue` | Reference to a pricing condition cost term. See [CostTermValue Element](#CostTermValue). |
| `Scales` | Reference to a pricing condition scales vector. See [Scales Element](#Scales). |

**Message:** `ContractRequest`, `QuoteRequest`

### ConditionTypes Element

This is a new element. It references a condition types list.

`ConditionTypes` has the following element:

| Element | Description |
| --- | --- |
| `ConditionType` (required) | References a pricing condition type. See [ConditionType Element](#ConditionType). |

**Message:** `ContractRequest`, `QuoteRequest`

### CostTermValue Element

This is a new element. It references a pricing condition cost term. It contains a `Money` or `Percentage` value.

**Message:** `ContractRequest`, `QuoteRequest`

### IncorporationType

This is a new element. It specifies the company type. The data type is a string and can be any characters with a maximum of 255 characters.

**Message:** `PaymentProposalRequest`, `PaymentRemittanceRequest`, `TradeRequest`

### InventoryTimeSeries

The `type` attribute now supports the following additional values:

* `minimumStock` - Required minimum quantity of stock supplier
  must maintain in a given time period.
* `maximumStock` - Required maximum quantity of stock supplier
  must maintain in a given time period.

**Message:** `ProductActivityMessage`

### Packaging

The following element was added:

| Element | Description |
| --- | --- |
| `AssetInfo` | Contains information for the asset referenced by the packaging. |

**Message:** `InvoiceDetailRequest`, `MasterAgreementRequest`, `OrderRequest`, `PunchOutSetupRequest`, `ShipNoticeRequest`, `TransportRequest`

### PaymentPartner Element

The following element was added:

| Element | Description |
| --- | --- |
| `IncorporationType` | Specifies the company type. The data type is string and can be any characters with max 255 characters. See [IncorporationType Element](#IncorporationType). |

**Message:** `PaymentProposalRequest`, `PaymentRemittanceRequest`, `TradeRequest`

### PricingConditions Element

This is a new element. It references a pricing condition object for a given line item.

`PricingConditions` has the following element:

| Element | Description |
| --- | --- |
| `ValidityPeriods` (required) | References a list of validity periods. See [ValidityPeriods Element](#ValidityPeriods). |

**Message:** `ContractRequest`, `QuoteRequest`

### Scale Element

This is a new element. It represents the volume scale. There can be more than one
cost term per scale.

`Scale` has the following attributes:

| Attribute | Description |
| --- | --- |
| `from` | Lower bound value for the scale. |
| `to` | Upper bound value for the scale. |

`Scale` has the following element:

| Element | Description |
| --- | --- |
| `CostTermValue` (required) | References a pricing condition cost term. See [CostTermValue Element](#CostTermValue). |

**Message:** `ContractRequest`, `QuoteRequest`

### Scales Element

This is a new element. It references a pricing condition scales vector.

`Scales` has the following attributes:

| Attribute | Description |
| --- | --- |
| `scaleType` (required) | Represents the scale type for the validity period. Possible values:   * `From` * `To` * `Graduated` |
| `scaleBasis` | Represents the scale basis, a string. The default is "quantity". |

`Scales` has the following element:

| Element | Description |
| --- | --- |
| `Scale` (required) | Represents the volume scale. See [Scale Element](#Scale). |

**Message:** `ContractRequest`, `QuoteRequest`

### UnitPrice Element

The following element was added:

| Element | Description |
| --- | --- |
| `PricingConditions` | Pricing condition that represents the cost elements with validity period and optional scales. See [PricingConditions Element](#PricingConditions). |

**Message:** `ContractRequest`, `QuoteRequest`

### ValidityPeriod Element

This is a new element. It references a pricing condition validity period.

`ValidityPeriod` has the following attributes:

| Attribute | Description |
| --- | --- |
| `from` (required) | Start date of the validity period. |
| `to` (required) | End date of the validity period. |

`ValidityPeriod` has the following element:

| Element | Description |
| --- | --- |
| `ConditionTypes` (required) | References a condition types list. See [ConditionTypes Element](#ConditionTypes). |

**Message:** `ContractRequest`, `QuoteRequest`

### ValidityPeriods Element

This is a new element. It references a list of validity periods.

`ValidityPeriods` has the following element:

| Element | Description |
| --- | --- |
| `ValidityPeriod` (required) | References a pricing condition validity period. See [ValidityPeriod Element](#ValidityPeriod). |

**Message:** `ContractRequest`, `QuoteRequest`

## 1.2.043

---

### AcceptanceItem Element

The following elements were added:

| Element | Description |
| --- | --- |
| `AcceptanceItemDetail` | Contains the information about the deviation approved when the acceptance status is `approvedAndUpdatePO`. See [AcceptanceItemDetail Element](#AcceptanceItemDetail). |
| `Extrinsic` | Contains any additional information related to this `AcceptanceItem`. |

### AcceptanceItemDetail Element

This is a new element. It provides details on an `AcceptanceItem`.

`AcceptanceItemDetail` has the following attribute:

| Attribute | Description |
| --- | --- |
| `approvedAction` | The action generated from the approval process. Possible values:   * `update` - Updates an existing item with the `lineNumber` specified in the `AcceptanceItem`. * `replace` - Replaces all the schedule information for an existing item with the `lineNumber` specified   in the `AcceptanceItem`. |

`AcceptanceItemDetail` has the following elements:

| Element | Description |
| --- | --- |
| `AcceptanceScheduleDetail` | Contains detailed information for the schedule line. See [AcceptanceScheduleDetail Element](#AcceptanceScheduleDetail). |
| `UnitPrice` | Unit price of the item. If this element is included, the unit price is updated. |
| `Extrinsic` | Contains any additional information related to this `AcceptanceItemDetail`. |

### AcceptanceScheduleDetail Element

This is a new element. It contains detailed information for the schedule line.

`AcceptanceScheduleDetail` has the following attributes:

| Attribute | Description |
| --- | --- |
| `quantity` (required) | Quantity approved. |
| `deliveryDate` | Delivery date approved. |
| `approvedAction` | The action generated from the approval process. Possible values:   * `new` - Generates a new schedule line. * `update` - Updates the schedule line of the specified `lineNumber` in the `AcceptanceScheduleDetail`. * `delete` - The schedule line referenced no longer exists and must be deleted. The `lineNumber`   attribute must be present in this case. |
| `lineNumber` | The line number of the schedule line to delete or update. |

`AcceptanceScheduleDetail` has the following element:

| Element | Description |
| --- | --- |
| `Extrinsic` | Contains any additional information related to this `AcceptanceScheduleDetail`. |

### ApprovalRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `Extrinsic` | Contains any additional information related to this `ApprovalRequestHeader`. |

### AssetInfo Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `isReferencedAsset` | Indicates whether the asset info is for a referenced asset associated with the item in the document. |
| `equipmentId` | Equipment ID of the unit. |

### ConfirmationItem Element

The `itemType` attribute now supports the following additional value:

* `lean` - Indicates that no child item is expected for the line.

### Contact Element

The `role` attribute supports an additional value:

* `payeeContact`

If the contact role is `payee`, the name under the contact is the supplier organization name.
If the contact role is `payeeContact`, the name under the contact is the supplier contact name.

### ContractItemIn Element

The `itemType` attribute now supports the following additional value:

* `lean` - Indicates that no child item is expected for the line.

### IdReference Element

The `domain` attribute supports an additional value:

* `companyRegistrationNumber`

### InvoiceDetailItem Element

The `itemType` attribute now supports the following additional value:

* `lean` - Indicates that no child item is expected for the line.

### InvoiceDetailServiceItem Element

The `itemType` attribute now supports the following additional value:

* `lean` - Indicates that no child item is expected for the line.

### InvoiceInstruction Element

The following elements were added:

| Element | Description |
| --- | --- |
| `Lower` | Specifies tolerances that define a lower limit. See [Lower Element](#Lower). |
| `Upper` | Specifies tolerances that define an upper limit. See [Upper Element](#Upper). |

### ItemIn Element

The `itemType` attribute now supports the following additional value:

* `lean` - Indicates that no child item is expected for the line.

### ItemOut Element

The `itemType` attribute now supports the following additional value:

* `lean` - Indicates that no child item is expected for the line.

### ItemOutIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `AssetInfo` | Provides detailed per-unit asset information for a line item. |

### NatureOfBusiness Element

This is a new element. It specifies the sector or industry to which a company belongs.
It describes what the company does. The data type is a string and can be any characters
with a maximum of 255 characters.

### OrderRequestHeaderIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `AssetInfo` | Provides detailed per-unit asset information for a line item. |

### PaymentPartner Element

The following element was added:

| Element | Description |
| --- | --- |
| `NatureOfBusiness` | Specifies the sector or industry to which a company belongs. It describes what the company does. The data type is a string and can be any characters with max 255 characters. See [NatureOfBusiness Element](#NatureOfBusiness). |

### QuoteItemIn Element

The `itemType` attribute now supports the following additional value:

* `lean` - Indicates that no child item is expected for the line.

### QuoteItemOut Element

The `itemType` attribute now supports the following additional value:

* `lean` - Indicates that no child item is expected for the line.

### ReceiptItem Element

The `itemType` attribute now supports the following additional value:

* `lean` - Indicates that no child item is expected for the line.

### SESInstruction Element

The following elements were added:

| Element | Description |
| --- | --- |
| `Lower` | Specifies a lower tolerance limit. See [Lower Element](#Lower). |
| `Upper` | Specifies an upper tolerance limit. See [Upper Element](#Upper). |

### ShipNoticeItem Element

The `itemType` attribute now supports the following additional value:

* `lean` - Indicates that no child item is expected for the line.

## 1.2.042

---

### ConfirmationStatus Element

The following element was added:

| Element | Description |
| --- | --- |
| `ScheduleLineReference` | Defines all references related to a schedule line in the confirmation. See [ScheduleLineReference Element](#ScheduleLineReference). |

### ContractRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `FollowUpDocument` | Contains information on how to follow up on a `QuoteMessage` or `ContractRequest`. See [FollowUpDocument Element](#FollowUpDocument). |

### FollowUpDocument Element

This element is now used in `ContractRequestHeader` as well as `QuoteHeaderInfo`.
It contains information on how to follow up on a `QuoteMessage` or `ContractRequest`.

The `type` and `category` attributes could be set to anything, but they should be
well known strings that can be understood by the backend system. For example, `type` could
be set to "Contract" and `category` could be set to "WK" or "value". This would give a hint
to the backend system that the next step should be to create a WK Contract.

`FollowUpDocument` has the following attributes:

| Attribute | Description |
| --- | --- |
| `type` | Indicates the document type. Possible values are `Contract`, `Scheduling Agreement`, or any custom document type. |
| `category` | Indicates the document category.  For an Outline Agreement: Enter `value` or `quantity`.  For a Scheduling Agreement: Enter `LP` or `LPA`.  For a custom document category: Enter any configured value. |

### InputItemID Element

This is a new element. It uniquely identifies materials consumed by a resource during the production process.

`InputItemID` has the following element:

| Element | Description |
| --- | --- |
| `ItemID` | Provides unique identification of an item. |

### ItemIn Element

The following attribute was updated:

| Attribute | Description |
| --- | --- |
| `itemCategory` | Specifies how a component or material is procured. Possible values:   * `materialUnknown` - Refers to procuring a material without specifying the material number. * `text` - Refers to procuring a free-form text item. * `stockTransfer` - Refers to transfer of stock from one plant to another. * `materialGroup` - Refers to procuring a material without specifying the value or quantity. * `subcontract` - Procuring a material by providing component information to a   contract manufacturer that makes the finished product. * `consignment` - Managing a material through a special process where the payment   to supplier is withheld until the material or service is consumed by the buyer. * `thirdParty` - Procuring a material from a third-party vendor. |

### ItemOut Element

The following attributes were added or updated:

| Attribute | Description |
| --- | --- |
| `itemClassification` | Specifies whether the current line item is material or service. Possible values:   * `material` * `service` |
| `itemCategory` | Specifies how a component or material is procured. Possible values:   * `materialUnknown` - Refers to procuring a material without specifying the material number. * `text` - Refers to procuring a free-form text item. * `stockTransfer` - Refers to transfer of stock from one plant to another. * `materialGroup` - Refers to procuring a material without specifying the value or quantity. * `subcontract` - Procuring a material by providing component information to a   contract manufacturer that makes the finished product. * `consignment` - Managing a material through a special process where the payment   to supplier is withheld until the material or service is consumed by the buyer. * `thirdParty` - Procuring a material from a third-party vendor. |

### OutputItemID Element

This is a new element. It uniquely identifies materials produced by a resource during the production process.

`OutputItemID` has the following element:

| Element | Description |
| --- | --- |
| `ItemID` | Provides unique identification of an item. |

### PlanningTimeSeries Element

The `type` attribute has a new value, `capacitydemand`:

| Attribute | Description |
| --- | --- |
| `type` (required) | A string value to identify the type time series. Possible values:   * `grossdemand` - Quantity that is considered as demand without taking   inventory and receipts into consideration. * `netdemand` - Quantity determined based on available inventory and   receipts derived based on planning output. * `supplyPlan` - Quantity derived to meet the demand based on supply planning. * `longtermforecast` - Forecast quantity derived based on historical trends. * `constrainedforecast` - Unconstrained forecast when limited by supply constraints results in   constrained forecast. * `capacitydemand` - Quantity of production output that is requested from a specific resource. * `custom` - Buyer specific business values could be represented by the `customType` string. |

### ProductActivityHeader Element

The `processType` attribute has a new value, `Capacity`:

| Attribute | Description |
| --- | --- |
| `processType` | Identifies the business process supported by the message. Possible values:   * `SMI` - Supplier-managed inventory (`Inventory`, `ConsignmentInventory`, `PlanningTimeSeries`, `InventoryTimeSeries`). * `OEM` - OEM-owned inventory scenarios (`Inventory`, `ConsignmentInventory`, `TimeSeries`, `PlanningTimeSeries`, `InventoryTimeSeries`). * `VMI` - Vendor-managed inventory (`Inventory`, `ConsignmentInventory`, `PlanningTimeSeries`, `InventoryTimeSeries`). * `3PL` - Third-party logistics inventory scenarios (`Inventory`, `ConsignmentInventory`, `PlanningTimeSeries`, `InventoryTimeSeries`). * `ManufacturingVisibility` - Contract manufacturers sharing inventory visibility (`Inventory`, `ConsignmentInventory`, `PlanningTimeSeries`, `InventoryTimeSeries`). * `Forecast` - Forecast collaboration (`TimeSeries`, `PlanningTimeSeries`). * `Consignment` - Consignment material movements (`ConsignmentInventory`, `ConsagnmentMovement`). * `Sales` - Sales report visibility (`SalesReport`) * `POC` - Purchase order collaboration scenarios (`Inventory`, `ConsignmentInventory`, `TimeSeries`, `PlanningTimeSeries`). * `Capacity` - Capacity planning scenarios (`PlanningTimeSeries`). * `Other` - Other collaboration scenarios. |

### ProductActivityDetails Element

A new `ResourceID` element was added as an alternative to `ItemID`:

| Element | Description |
| --- | --- |
| `ItemID` | `ResourceID` | * `ItemID`: A unique identification of a component item in the supplier backend system or buyer backend system. * `ResourceID`: A unique identification of a production facility leveraged during production, such as a piece of equipment or a production line. |

### ProductReplenishmentHeader Element

The [`processType` attribute](#processType_attr) has a new value, `Capacity`.

### ProductReplenishmentDetails Element

A new [`ResourceID` element](#ResourceID_el) was added as an alternative to `ItemID`.

### ReplenishmentTimeSeries Element

The `type` attribute has two new values, `capacityConfirmation` and `capacityShiftRuns`.

* `capacityConfirmation` represents the quantity of production output of a specific resource that supplier commits to attain.
* `capacityShiftRuns` represents the number of shifts a specific production resource can run.

Here is the full list of `type` values:

* `manufacturingOrder`
* `purchaseOrder`
* `supplierForecast`
* `shipment`
* `projectedStock`
* `firmReceipt`
* `plannedReceipt`
* `forecastConfirmation`
* `capacityConfirmation`
* `capacityShiftRuns`

### ResourceID Element

This is a new element. It contains a unique identification of a production facility leveraged during production, such as a piece of
equipment or a production line.

`ResourceID` has the following elements:

| Element | Description |
| --- | --- |
| `SupplierResourceID` (required) | Uniquely identifies a plant, piece equipment or other production facilities leveraged by the supplier during production. |
| `ResourceType` | Identifies the resource category the `ResourceID` belongs to. |
| `InputItemID` | Uniquely identifies materials consumed by a resource during production process. |
| `OutputItemID` | Uniquely identifies materials produced by a resource during production process. |
| `IdReference` | Defines an ID reference. The identifier/domain pair should be unique within each trading partner relationship (a buying organization and a supplier). |

### ResourceType Element

This is a new element. It identifies the resource category the `ResourceID` belongs to.

### ScheduleLineReference Element

This is a new element. It defines all references related to a schedule line in the confirmation.

`ScheduleLineReference` has the following attributes:

| Attribute | Description |
| --- | --- |
| `quantity` (required) | Quantity from the `ScheduleLine` element of the `OrderRequest` document that the current document is referring to. |
| `requestedDeliveryDate` (required) | Requested delivery date from the `ScheduleLine` element of the `OrderRequest` document that the current document is referring to. |
| `lineNumber` | Line number identifier from the `ScheduleLine` element of the `OrderRequest` document that the current document is referring to. |

`ScheduleLineReference` has the following element:

| Element | Description |
| --- | --- |
| `Extrinsic` | Contains any additional information related to this `ScheduleLineReference`. |

### SupplierResourceID Element

This is a new element. It uniquely identifies a plant, piece of equipment, or other production facilities leveraged by the supplier during production.

### Tax Element

This following element was added:

| Element | Description |
| --- | --- |
| `TaxAdjustmentAmount` | The adjustment amount for the total tax for the document or in other words the adjustment amount corresponding to tax represented by this `Tax` element and is optional (this is supposedly the sum of the amounts in `TaxAdjustmentAmount` elements under the `TaxDetail` children of this `Tax` element). Currently, this element is ONLY supported for the `PaymentProposalRequest` document. It is used instead of the `TaxAdjustment` element (now deprecated). |

### TaxAdjustment Element

This element is deprecated in the `PaymentProposalRequest` document in cXML 1.2.042. Use
the `Tax.TaxAdjustmentAmount` element instead.

### TaxAdjustmentAmount Element

This is a new element. It is used with a `PaymentProposalRequest` document
to specify the adjustments on tax for the payable. If it is included under the `Tax`
element then it is used to specify the adjustment for total tax in the `PaymentProposalRequest`
document. If it is included under the `TaxDetail` element then it specifies the
adjustment for tax for a specific tax category and region.

`TaxAdjustmentAmount` has the following element:

| Element | Description |
| --- | --- |
| `Money` (required) | Describes the adjustment for the tax (either for `Tax` or `TaxDetail`) given on the payable. |

### TaxAdjustmentDetail Element

This element is deprecated in the `PaymentProposalRequest` document in cXML 1.2.042. Use
the `TaxDetail.TaxAdjustmentAmount` element instead.

### TaxDetail Element

This following element was added:

| Element | Description |
| --- | --- |
| `TaxAdjustmentAmount` | The adjustment amount for the tax for the specific tax line (tax for a specific category and location) or in other words the adjustment amount corresponding to tax represented by this `TaxDetail` element. Currently, this element is ONLY supported for the `PaymentProposalRequest` document. It is used instead of the `TaxAdjustmentDetail` element (now deprecated). |

## 1.2.041

---

### ComponentConsumptionDetails Element

This following element was added:

| Element | Description |
| --- | --- |
| `Dimension` | Specifies item dimensions. |

### ComponentConsumptionItem Element

This following element was added:

| Element | Description |
| --- | --- |
| `AssetInfo` | Provides asset tag numbers or serial numbers for individual items in a shipment of goods. |

### ItemOutIndustry Element

This following attributes were added:

| Attribute | Description |
| --- | --- |
| `requiresRealTimeConsumption` | Set to `yes` to indicate that real time consumption is required for this item. |
| `isHUMandatory` | Set to `yes` to indicate that a handling unit is required for this item. A handling unit is a physical unit consisting of packaging materials (load carriers/packing material) and the goods contained on or in it. |

### QNCode Element

This following attribute was updated:

| Attribute | Description |
| --- | --- |
| `domain` (required) | Domain in which this value has meaning. Recognized domains include:   * `type` - Quality notification type, does not have a code group. * `subject` - Quality notification subject (category). * `reason` - Reason of defect. * `task` - Quality notification task. * `activity` - Quality notification activity. * `defect` - Quality notification defect. * `defectLocation` - Area where a quality notification defect occurs (used in `QualityNotificationRequestItem` only). * `cause` - Quality notification cause. * `revision` - Quality notification revision. |

### QualityNotificationRequestItem Element

This following element was updated:

| Element | Description |
| --- | --- |
| `QNCode` | `QualityNoficationRequestItem` now supports multiple `QNCode` elements, which contain quality notification codes and their descriptions in different domains. A code with domain "defect" represents the defect's category/subcategory. A code with domain "defectLocation" represents the area where the defect occurs. Only one defect location code is allowed per item. |

## 1.2.040

---

### ScheduleLine Element

This following element was added:

| Element | Description |
| --- | --- |
| `ShipTo` | The ship to address for an item. |

## 1.2.039

---

### AcceptanceItem Element

This is a new element. It provides details about a specific approval of a line item. An `ApprovalRequest` can contain one or
more `AcceptanceItem` elements.

`AcceptanceItem` has the following attributes:

| Attribute | Description |
| --- | --- |
| `lineNumber` (required) | Number of the line item. |
| `acceptanceStatus` (required) | Acceptance status of the line item. Possible values:   * `approved` * `awaitingApproval` * `rejected` * `approvedAndUpdatePO` |

`AcceptanceItem` has the following elements:

| Element | Description |
| --- | --- |
| `DeviationReason` | Deviation reason why it is not approved. |
| `Comments` | Contains comments associated with this acceptance item. |

### AllowedValues Element

You can now use the `PropertyValue` element to provide the unit of measure of the allowed values by characteristic.

### ApprovalItem Element

Usage of `ApprovalItem` is deprecated. Use [AcceptanceItem](#AcceptanceItem) instead.

### ApprovalRequest Element

The following element replaces `ApprovalItem`, which is deprecated:

| Element | Description |
| --- | --- |
| `AcceptanceItem` | Provides details about a specific approval of a line item. See [AcceptanceItem Element](#AcceptanceItem). |

### BatchInfo Element

This is a new element. It controls whether the batch information is required or not for an item when a supplier
creates an order response. It has the following attribute:

| Attribute | Description |
| --- | --- |
| `requiresBatch` | Set to `yes` to indicate that this item requires a batch number to be provided by the supplier in the `Batch` element in the `ShipNoticeItem`/`ConfirmationStatus` element of the corresponding `ShipNoticeRequest`/`ConfirmationRequest` documents. |

### BlanketItemDetail Element

The following elements were added::

| Element | Description |
| --- | --- |
| `MaxContractAmount` | Defines a maximum amount for contract items, as specified by the buyer. See [MaxContractAmount Element](#MaxContractAmount). |
| `MaxAdhocAmount` | Defines a maximum amount for unplanned items, as specified by the buyer. See [MaxAdhocAmount Element](#MaxAdhocAmount). |

### CertificateInfo Element

This is a new element. It represents certificate information.

`CertificateInfo` has the following attribute:

| Attribute | Description |
| --- | --- |
| `isRequired` | Indicates whether the certificate is required. |

`CertificateInfo` has the following element:

| Element | Description |
| --- | --- |
| `IdReference` | Use this element to send Quality Material Control Code and Inspection Certificate type information.  For Quality Material Control Code, the `domain` is "controlCode".  For Inspection Certificate type, the `domain` is "certificateType". |

### DeviationReason Element

This is a new element. It represents the deviation reason.

`DeviationReason` has the following attribute:

| Attribute | Description |
| --- | --- |
| `value` (required) | Type of deviation. Possible values:   * `dateDeviation` * `quantityDeviation` * `priceDeviation` |

`DeviationReason` has the following element:

| Element | Description |
| --- | --- |
| `Comments` | Contains comments associated with this deviation reason. |

### ItemOutIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `BatchInfo` | Controls whether the batch information is required or not for an item when a supplier creates an order response. See [BatchInfo Element](#BatchInfo). |

### MaxAdhocAmount Element

This is a new element. It defines a maximum amount for ad-hoc (non-contract) items, as specified by the buyer.

`MaxAdhocAmount` has the following element:

| Element | Description |
| --- | --- |
| `Money` (required) | Monetary amount. |

### MaxContractAmount Element

This is a new element. It defines a maximum amount for contract items, as specified by the buyer.

`MaxContractAmount` has the following element:

| Element | Description |
| --- | --- |
| `Money` (required) | Monetary amount. |

### OrderRequestHeader Element

The following elements were added:

| Element | Description |
| --- | --- |
| `LegalEntity` | Identifies legal entity in the external system. |
| `OrganizationalUnit` | Identifies purchase unit or purchase group in the external system. |

### OrderRequestHeaderIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `QualityInfo` | Represents of the quality information for the entire `OrderRequest`. |

### ProductActivityDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `SerialNumberInfo` | Represents the required serial number information for a line item. For Component Inventory, the `SerialNumberInfo@type` must be "list" or "range". |

### QualityInfo Element

The following element was added:

| Element | Description |
| --- | --- |
| `CertificateInfo` | Represents certificate information. Each `QualityInfo` element supports one certificate. See [CertificateInfo Element](#CertificateInfo). |

### QualityInspectionRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `AssetInfo` | Contains a list of asset information of the complaint items. |

### QualityInspectionResultRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `AssetInfo` | Contains list of asset information of the valuated items. |

### QualityNotificationRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `AssetInfo` | Contains the list of asset information of the complaint items. |

### QualityNotificationRequestItem Element

The following element was added:

| Element | Description |
| --- | --- |
| `AssetInfo` | Contains the list of asset information of the complaint items. |

### QualityNotificationTask Element

The following attribute was updated:

| Attribute | Description |
| --- | --- |
| `status` | Current state of execution of this task. Possible values:   * `new` (default) * `in-process` * `complete` * `close`   The `close` status is new. It is the final step when a task is considered closed. |

### QualitySampleResult Element

You can now use `PropertyValue@Characteristic` to provide the unit of measure for each `QualityInspectionValuation`.

### QuoteItemOut Element

The following element was added:

| Element | Description |
| --- | --- |
| `SupplierSelector` | Defines the way suppliers are selected for responding to RFQ. |

### ReceiptItemReference Element

The following element was added:

| Element | Description |
| --- | --- |
| `ReferenceDocumentInfo` | Contains additional document reference information. |

### ReferenceDocumentInfo Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `scheduleLineNumber` | Schedule line number of a schedule item in the referenced `lineNumber`. If this attribute has a value, the `lineNumber` attribute is mandatory. |

### SalesOrderHeader Element

This is a new element. It contains common information about a sales order.

`SalesOrderHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `salesOrderID` (required) | An identifier for this particular sale order assigned by the supplier. This attribute provides an unambiguous and direct connection between all versions of the sale order. A user-visible and secondary (to the `payloadID` attribute of the cXML element) identifier for this document. This value should remain same for all `SalesOrderRequests` corresponding to the same order.  The `salesOrderID` may be used in the procurement application for processing this request. Links between these documents must be deduced using the `DocumentReference` element contained in the updated `SalesOrderHeader` and the `payloadID` attribute of the original or previous update. |
| `operation` | The operational mode of the sales order document. Possible values:   * `new` (default) - Creates a new sales order.* `update` - Updates an existing sale order to correct an   error or add additional information. In either case, an "update"   sales order must be complete. All data from the original sale order   or a previous update should be discarded by the recipient. * `cancel` - Cancels a sale order sent earlier.   A `SalesOrderRequest` with an `"update"` operation must also include a `DocumentReference` element in the `SalesOrderHeader`. This effectively sequences multiple versions of a confirmation and may provide a link between those versions. |
| `operationAllowed` (required) | Highest operation allowed on the shopping basket in the procurement application. Possible values:   * `create` - Allows only later `OrderRequest`   operations on these items. * `"inspect"` - Adds a `PunchOutSetupRequest`   with `operation="inspect"`. * `edit` - Allows `operation="edit"` in the   later punchout setup request. |
| `noticeDate` (required) | The date and time this sale order was created. |
| `orderVersion` | The supplier system order version number for this request. Relevant when the `SalesOrderRequest` represents a change order request. The version number for the original document should be 1 and should be incremented by 1 for each subsequent version. |
| `channelType` | Indicates the action expected by the supplier who initiates the sales document. Possible values:   * `buy` - The buyer will create a Sales Order. * `sell` - The buyer will create a Purchase Order. * `visibility` - The supplier is sending the sales document   for visibility on another purchase order from a third party. |

`SalesOrderHeader` has the following elements:

| Element | Description |
| --- | --- |
| `DocumentReference` | Required when the `operation` is `"update"`. It contains a reference to the most recent `SalesOrderRequest` document for this particular sales order (usually also indicated by a common `salesOrderID`). For example, when a sale order is created, updated, and then updated again, the final document must contain a `DocumentReference` referring to the previous sales order request with `operation="update"`. That document must, in turn, refer to the original (`operation="new"`) `SalesOrderRequest` document. |
| `Total` | The total of the sales order request. |
| `Tax` | Indicates taxes that are applicable to this sales order request. |
| `Contact` (required) | Uniquely identifies the requester in the procurement application. There must a contact with the role of `"requester"` along with the details of the requester. |
| `Comments` | Contains comments associated with this sales order request. |
| `Extrinsic` | Contains any additional information related to this sales order request. |

### SalesOrderRequest Element

This is a new element. It represents a sales order request, which contains the shopping basket data
sent to the procurement application from the supplier.

`SalesOrderRequest` has the following elements:

| Element | Description |
| --- | --- |
| `SalesOrderHeader` (required) | Contains common information about a sales order request. See [SalesOrderHeader Element](#SalesOrderHeader). |
| `ItemIn` | Contains an item from a shopping basket to add to a requisition in the procurement application. |

### SerialNumberInfo Element

The `type` attribute is now optional.

### ServiceEntryRequestHeader Element

This element now supports multiple `Comments` elements. They can be used to attach quality
certificates that were required in a service PO. In this case, one comment will be provided by attachment,
and the certificate type will be provided in the `Comments@type` attribute.

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `isFinal` | Set to "yes" to indicate that this item is closed, and no more deliveries are expected for it. |

### ShipNoticeHeader Element

The following elements were added:

| Element | Description |
| --- | --- |
| `ReferenceDocumentInfo` | Contains additional document reference information. |
| `LegalEntity` | Identifies legal entity in the external system. |
| `OrganizationalUnit` | Identifies Purchase Unit or Purchase group in the external system. |

### ShipNoticeItem Element

The following element was added:

| Element | Description |
| --- | --- |
| `ReferenceDocumentInfo` | Contains additional document reference information. |

### ShipNoticePortion Element

The following element was added:

| Element | Description |
| --- | --- |
| `ReferenceDocumentInfo` | Contains additional document reference information. |

## 1.2.038

---

### InvoiceInstruction Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `unitPriceEditable` | Specifies whether a buyer or supplier is allowed to update the unit price while creating an invoice. Possible values:   * `yes` - Buyer or supplier is allowed to edit unit price.   The new price must be within price tolerance. * `no` - The unit price is not editable regardless of transaction rules   defined in the network hub.   If the `unitPriceEditable` attribute is not present, the system honors the default transaction rules present in the network hub. |

### SESInstruction Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `unitPriceEditable` | Specifies whether a buyer or supplier is allowed to update the unit price while creating a service sheet. Possible values:   * `yes` - Buyer or supplier is allowed to edit unit price.   The new price must be within price tolerance. * `no` - The unit price is not editable regardless of transaction rules   defined in the network hub.   If the `unitPriceEditable` attribute is not present, the system honors the default transaction rules present in the network hub. |

## 1.2.037

---

### Alternative Element

This is a new element. It represents an alternative option to service specification lines. If an alternative
is specified, it consists of a basic line and one or more alternative lines.

`Alternative` has the following attributes:

| Attribute | Description |
| --- | --- |
| `alternativeType` (required) | The alternative type of a service line item. Possible values:   * `noAlternative` - Describes a service that cannot be performed in alternative ways. * `basicLine` - Describes a service that can be performed in alternative ways.   There are one or more alternative lines for each basic line. The value of a basic line   is included in the total value of the service specifications. * `alternativeLine` - Describes a different way of performing a service or doing   work than that set out in the associated basic line. The value of an alternative line is not   included in the total value of the service specifications. Example: If flooring is to be   renewed, you may want to enter one service line for parquetry flooring and an alternative   line for ceramic tiles. |
| `basicLineNumber` | When an alternative type is set as `alternativeLine`, the line number of the service line whose alternative type is set as `basicLine` is set here. This enables this service line item to identify for which service line item this is alternative to. |

### Batch Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `batchQuantity` | Quantity for a batch of material or goods. |

### ComponentConsumptionDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `AssetInfo` | Provides asset tag numbers or serial numbers for individual items in a shipment of goods. |

### ConsignmentMovement Element

The following elements were added:

| Element | Description |
| --- | --- |
| `ReferenceDocumentInfo` | Contains details of a referenced document in the consignment procurement process such as a purchase order, scheduling agreement, ship notice, and receipt. |
| `Extrinsic` | Contains any additional information for this consignment movement. |

### ContractItemIn Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `itemType` | Specifies whether the line item is a grouped item having child items or an independent line item. Possible values are `"composite"` to identify an item group or `"item"` to identify an independent line item.  This attribute is applicable only for a line item with an item group. |
| `serviceLineType` | Represents the type of the service line. Possible values:   * `standard` * `blanket` * `contingency` * `openquantity` * `information` |

The following element was added:

| Element | Description |
| --- | --- |
| `Alternative` | An alternative option to service specification lines. See [Alternative Element](#Alternative). |

### ItemOutIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `SerialNumberInfo` | Represents the serial number information of a line item. |

### ProductActivityDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `UnitOfMeasure` | The unit of measure for an inventory/forecast/consignment quantity at the item level. This applies to the entire item and is used as the default unit of measure for time series quantities. |

### ProductReplenishmentDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `UnitOfMeasure` | The unit of measure for an inventory/forecast/consignment quantity at the item level. This applies to the entire item and is used as the default unit of measure for time series quantities. |

### QualityInspectionCharacteristic Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `isAdHoc` | Indicates whether the characteristic does not exist in the reference document and is an additional valuation. |

### QualityInspectionResultRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `QualityInspectionQuantity` | The quantity of inventory that is under quality inspection. This element has a `quantity` attribute and a `UnitOfMeasure` element.  Inspection lot quantity could be filled by supplier based on the inspected quantity on `QualityInspectionResult`. Generally, it is sent by the buyer, but if not the contract manufacturer can provide this quantity based on the inspection lot. |

### QualityInspectionValuation Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `isAdHoc` | Indicates whether the characteristic does not exist in the reference document and is an additional valuation. |

### QualityNotificationRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `QualityInspectionRequestReference` | Reference to the quality inspection request.  The reference can contain the `payloadId` or `DocumentNumber` and `DocumentDate` of the quality inspection request. This is used in the case when quality inspection results are not met successfully and a quality notification is created with reference to the quality inspection request. |

### QuoteItemIn Element

The following element was added:

| Element | Description |
| --- | --- |
| `Alternative` | An alternative option to service specification lines. See [Alternative Element](#Alternative). |

### QuoteItemOut Element

The following element was added:

| Element | Description |
| --- | --- |
| `Alternative` | An alternative option to service specification lines. See [Alternative Element](#Alternative). |

### SerialNumberInfo Element

This is a new element. It represents the serial number information of a line item.

`SerialNumberInfo` has the following attributes:

| Attribute | Description |
| --- | --- |
| `requiresSerialNumber` | Indicates whether this item requires a serial number to be provided by the supplier in `AssetInfo` tags in `ShipNoticeItem` element of the corresponding ship notice. |
| `type` (required) | Specifies the type of serial number number. Possible values:   * `list` - A list of acceptable serial numbers. * `range` - A range of acceptable serial numbers, only valid for numeric ranges. * `profile` - A format of acceptable serial numbers. |

`SerialNumberInfo` has the following elements:

| Element | Description |
| --- | --- |
| `SerialNumber` | List of serial numbers. Required when `SerialNumberInfo@type` is `"list"`. |
| `PropertyValue` | When `SerialNumberInfo@type` is `"range"`, minimum and maximum acceptable limits should be provided in the `PropertyValue` element. In this case, `PropertyValue@name` should be `"range"` and `PropertyValue@Characteristic` should provide the minimum and maximum values in the `Characteristic@value` attribute with `"minimum"` and `"maximum"` as domains in the `Characteristic@domain` attribute.  When `SerialNumberInfo@type` is `"profile"`, a serial number format should be provided in the `PropertyValue` element. In this case, `PropertyValue@name` should be `"profile"` and `PropertyValue@Characteristic` should provide the format. `Characteristic@domain` supports `"type"`, `"minLength"`, and `"maxLength"` as domains to provide these values in `Characteristic@value` attribute.  When `Characteristic@domain` is `"type"`, `Characteristic@value` supports `"numeric"`, `"text"`, and `"numericAndText"` to provide the serial number format.  When `Characteristic@domain` is `"minLength"`, `Characteristic@value` provides the minimum acceptable length of the serial number.  When `Characteristic@domain` is `"maxLength"`, `Characteristic@value` provides the maximum acceptable length of the serial number. |

### ShipNoticeItem Element

The following element was added or updated:

| Element | Description |
| --- | --- |
| `Batch` | `SupplierBatchID` | You can specify multiple optional `Batch` or `SupplierBatchID` elements to identify the batch of goods. |
| `Comments` | Contains the ship notice item-specific comments. Could be used to attach quality certificates that were required in `OrderRequest`. In this case, a comment is provided by attachment, and the certificate type is provided by the `Comments@type` attribute. |

### TimeSeriesAmount Element

This is a new element. It contains the generic value associated with the timeseries. This can be used for amount- or
price-based values.

`TimeSeriesAmount` has the following element:

| Element | Description |
| --- | --- |
| `Money` (required) | Monetary amount for the timeseries. |

### TimeSeriesDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `TimeSeriesAmount` | See [TimeSeriesAmount Element](#TimeSeriesAmount). |

## 1.2.036

---

### Batch Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `shelfLife` | Duration that a product is expected to remain within its approved product specification after production date. This attribute is used for information purposes only. The lexical representation for duration is the ISO 8601 extended format `PnYn MnDTnH nMnS`, where `nY` represents the number of years, `nM` the number of months, `nD` the number of days, `T` the date/time separator, `nH` the number of hours, `nM` the number of minutes and `nS` the number of seconds. For example, to indicate a duration of 60 days, one would write: `P0Y0M60D`. |

### ItemIn Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `itemCategory` | Specifies how a component or material is procured. Possible values:   * `subcontract` - Procuring a material by providing component information to a   contract manufacturer that makes the finished product. * `consignment` - Managing a material through a special process where the payment   to supplier is withheld until the material or service is consumed by the buyer. * `thirdParty` - Procuring a material from a third-party vendor. |

### ProductActivityDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `UnitPrice` | Price per unit of the item. |

### ProductReplenishmentDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `UnitPrice` | Price per unit of the item. |

### ReceiptItem Element

The following element was added:

| Element | Description |
| --- | --- |
| `Classification` | Classification for the receipt, for instance, Receipt Item Movement Type or Stock Type. Can occur more than once to support multiple classifications. |

### TimeSeriesDetails Element

The following element was *removed*:

| Element | Description |
| --- | --- |
| `Priority` | Priority for the given time series. |

The following element was added:

| Element | Description |
| --- | --- |
| `TimeSeriesValue` | See [TimeSeriesValue Element](#TimeSeriesValue). |

### TimeSeriesValue Element

This is a new element. It contains a generic value associated with the timeseries. This can be used for non-numeric values like priority.
It is tightly coupled with the keyfigure specified in the `TimeSeries.type` attribute.

`TimeSeriesValue` has the following attribute:

| Attribute | Description |
| --- | --- |
| `value` (required) | String value associated with the timeseries. |

`TimeSeriesValue` has the following element:

| Element | Description |
| --- | --- |
| `Description` | Description of the value. |

## 1.2.035

---

### Attachment Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `visibility` | Indicates the visibility level of the attachment. Specify the value `"internal"` to indicate that the attachment is for internal purposes only and should not be visible to suppliers. |

### DateInfo Element

The `type` attribute was updated with two new values, `confirmedShipDate` and `confirmedDeliveryDate`:

| Attribute | Description |
| --- | --- |
| `type` | Date type. Possible values:   * `expectedShipmentDate` - expected ship date for the material is   used to determine when the supplier is expected to ship the material   from their location. * `productionStartDate` - Production start date. * `productionFinishDate` - Production finish date. * `requestedPickUpDate` - Pick up date as requested by   the party arranging the transport. * `expectedPickUpDate` - Date when the logistic provider   expects to pick up the materials. * `actualPickUpDate` - Actual pick up date, as it has occurred. * `requestedDeliveryDate` - Delivery date as requested by the   party arranging the transport. * `expectedDeliveryDate` - Expected delivery date for the material   to be received at the partner location. * `actualDeliveryDate` - Actual delivery date of the goods. * `confirmedShipDate` - Shipment date confirmed by the supplier. * `confirmedDeliveryDate` - Delivery date confirmed by the supplier. |

### ExpectedResult Element

The following element was added:

| Element | Description |
| --- | --- |
| `PropertyValue` | Contains values for a property. Used to send the expected result for qualitative valuation. |

### ItemIn Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `openQuantity` | The quantity pending to be fulfilled by the supplier to ship to the buyer. Example: If the order quantity is 100 and 40 were delivered, the open quantity is 60. The quantity is recorded as the undelivered quantity by the buyer. |
| `promisedQuantity` | The quantity that has been promised by the supplier. The promised quantity, also called confirmed quantity, is computed in the supplier's backend system based on "Available To Promise" (ATP) functionality. ATP is a function that enables customers' orders to be confirmed based on available inventory or based on incoming commitments from the suppliers. |

The following elements were added:

| Element | Description |
| --- | --- |
| `ScheduleLine` | Contains information related to delivery schedules for a line item. |
| `Batch` | Captures batch information of the customer and supplier for this line item. |
| `DateInfo` | Contains dates applicable for this line item. |
| `Extrinsic` | Contains any additional information related to this line item. |

### OrderStatusRequestItem Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `rescheduleRequest` | Information derived from Materials Requirements Planning (MRP) to suggest possible changes to the delivery date. Possible values:   * `in` - MRP proposal to reschedule the delivery date earlier than the current delivery date. * `out` - MRP proposal to reschedule the delivery date later than the current delivery date. * `cancel` - MRP proposal to cancel the PO line item. |
| `rescheduleDate` | MRP proposed rescheduled delivery date. |

The following element was added:

| Element | Description |
| --- | --- |
| `Priority` | Priority indicator, used to drive the priority of the orders for the suppliers. Indicates the current build priority associated with the PO line item. This value does not update the priority in the PO. |

### QualityInfo Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `requiresQualityProcess` | Set to `yes` to indicate that this item requires a quality process. |

### QualityInspectionCharacteristic Element

The following attribute was updated:

| Attribute | Description |
| --- | --- |
| `operationNumber` (required) | Inspection operation. The combination of this attribute with `characteristicID` should be unique. |

### QualityInspectionDecisionDetail Element

The following elements were added:

| Element | Description |
| --- | --- |
| `QualityInspectionRequestReference` | Reference to the quality inspection request. The reference can contain the `payloadId` or `DocumentNumber` and `DocumentDate` of the quality inspection request. |
| `ShipNoticeReference` | Reference to the ship notice request. The reference can contain the `payloadId` or `DocumentNumber` and `DocumentDate` of the ship notice request. |
| `ReceiptReference` | Reference to the receipt request. The reference can contain the `payloadId` or `DocumentNumber` and `DocumentDate` of the receipt request. |

### QualityInspectionRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `QualityInfo` | The representation of the quality information of a line item. |

### QualityInspectionResultRequestHeader Element

This element now supports multiple `Batch` and `Comments` elements.

### QualityInspectionValuation Element

The following attributes were added or updated:

| Attribute | Description |
| --- | --- |
| `characteristicID` (required) | Characteristic ID number. The combination of this attribute with `operationNumber` should be unique. |
| `operationNumber` (required) | Inspection operation number. The combination of this attribute with `characteristicID` should be unique. |
| `workCenter` | Work center number. |

The `QualityInspectionValuation` element now supports multiple `QualitySampleResult`
and `ValueGroup` elements.

### QualityNotificationRequestHeader Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `minimumRequiredCauses` | Number of minimum required causes to complete a defect. It is evaluated only when this attribute is not present at the defect level. |

### QualitySampleResult Element

The following element was added:

| Element | Description |
| --- | --- |
| `PropertyValue` | Result of the valuation when `AllowedValues@type` is `"choice"` in `QualityInspectionCharacteristic`. |

### ReceiptItemReference Element

The following element was added:

| Element | Description |
| --- | --- |
| `ShipNoticeLineItemReference` | Provides a reference to the line item in a prior `ShipNoticeRequest` document. |

### TimeSeriesDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `Priority` | Priority for the given time series. |

## 1.2.034

---

### AllowedValues Element

This is a new element. It contains values allowed during the valuation of an inspection characteristic.

`AllowedValues` has the following attribute:

| Attribute | Description |
| --- | --- |
| `type` | Type of values. Possible values:   * `numeric` * `decision` * `choice` |

`AllowedValues` has the following element:

| Element | Description |
| --- | --- |
| `PropertyValue` | Contains values for valuating a property. |

### ComparatorInfo Element

This is a new element. It contains information related to a minimum or maximum accepted value.

`ComparatorInfo` has the following attributes:

| Attribute | Description |
| --- | --- |
| `comparatorType` (required) | Specify one of the following comparator type values:   * `greater` * `less` * `greaterOrEqual` * `lessOrEqual` |
| `comparatorValue` (required) | Reference value to make the comparison. |

### ComponentConsumptionItem Element

The following element was added:

| Element | Description |
| --- | --- |
| `ScrapQuantity` | The quantity represents the Scrap of a material that is expected to occur during production if the material is a component. This element has a `quantity` attribute and a `UnitOfMeasure` element. |

### ContractItemIn Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `operation` | Operation to be performed. Possible values:   * `new` - Represents a new contract line item sent to the external system. * `update` - Represents an update to an existing contract line item. * `delete` - Represents an instruction to delete this contract line item in the external system. |

### ExemptReason Element

This is a new element. It specifies the exemption reason for zero tax.

`ExemptReason` is not related to the `TaxDetail@exemptDetail` attribute.

`ExemptReason` has the following attribute:

| Attribute | Description |
| --- | --- |
| `xml:lang` (required) | The language or locale in which the exemption reason is written. |

### ExpectedLimit Element

This is a new element. It contains a value that the unplanned services (or the material)
covered by this item are not expected to exceed. `ExpectedLimit` captures the
planned or expected value and is mainly used for analysis purposes and for determining the total
value of the item. The buyer assumes that `ExpectedLimit` is the final amount payable.
`ExpectedLimit` is specified only for a top-level service item.

The `ExpectedLimit` is generally less than the specified `OverallLimit`.
However, `ExpectedLimit` can also be higher than `OverallLimit` if
the buyer determines that the total sum payable is made available at the start of the
procurement project, but initially only services worth a value of up to the `OverallLimit`
may be performed. Further work can only be carried out if the buyer increases the `OverallLimit`.
This enables progressive allotment of the budget to different phases of the project.

`ExpectedLimit` has the following element:

| Element | Description |
| --- | --- |
| `Money` (required) | Monetary amount for the expected limit. |

### ExpectedResult Element

This is a new element. It contains the expected result for a measurement.

`ExpectedResult` has the following attributes:

| Attribute | Description |
| --- | --- |
| `targetValue` | Target value for the measurement. |
| `valuePrecision` | Integer specifying the number of decimal places to include in the result. |
| `qualitativeValue` | A non-numerical value (a string) to send the expected result for qualitative valuation. |

`ExpectedResult` has the following elements:

| Element | Description |
| --- | --- |
| `MinimumLimit` | Minimum acceptable value. |
| `MaximumLimit` | Maximum acceptable value. |

### InvoiceDetailItem Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `isAdHoc` | Indicates the item does not exist in the reference document or contract master agreement. |

### InvoiceDetailLineIndicator Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `isPriceAdjustmentInLine` | Set to `yes` if a line-item credit memo or debit memo has a price adjustment. |

### InvoiceDetailRequestHeader Element

The following attribute was updated, adding support for `lineLevelDebitMemo`:

| Attribute | Description |
| --- | --- |
| `purpose` | Purpose of the invoice. Possible values:   * `standard` - (default) A standard billing   statement from the supplier to the buying organization. * `creditMemo` - A credit memo for issuing credit   to the buying organization. `isHeaderInvoice`   must be yes. Also, the element `InvoiceDetailSummary`/`DueAmount`   must be a negative amount. * `debitMemo` - A debit memo for billing a balance owed by the buying   organization. `isHeaderInvoice` must be yes. Also, the element   `InvoiceDetailSummary`/`DueAmount` must be a positive amount. * `lineLevelCreditMemo` - A line-item credit memo for issuing credit   to the buying organization. `isHeaderInvoice` must be false (not   specified). Also, the element `InvoiceDetailSummary`/`DueAmount`   must be a negative amount. * `lineLevelDebitMemo` - A line-item debit memo billing a balance owed by   the buyer to the supplier. `isHeaderInvoice` must be false (not   specified). Also, the element `InvoiceDetailSummary`/`DueAmount`   must be a positive amount. |

### InvoiceDetailServiceItem Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `isAdHoc` | Indicates the item does not exist in the reference document or contract master agreement. |

### ItemDetail Element

The following elements were added:

| Element | Description |
| --- | --- |
| `OverallLimit` | See [OverallLimit Element](#OverallLimit). |
| `ExpectedLimit` | See [ExpectedLimit Element](#ExpectedLimit). |

### ItemOut Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `subcontractingType` | The buyer's ERP system determines the subcontracting type based on the material provision indicator determined to support the regular subcontracting refurbishments or replacements scenarios. Possible values:   * `regular` - Standard subcontracting scenario. * `refurbWithoutChange` - Refurbishment without changed material. * `refurbWithChange` - Refurbishment with changed material. * `replacement` - Replacement of the materials. |

### ItemOutIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `QualityInfo` | See [QualityInfo Element](#QualityInfo). |

### ItemStatus Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `parentLineNumber` | The line number of the corresponding parent line item to identify this item's hierarchical parent item in a response message. |

### MaximumLimit Element

This is a new element. It contains the maximum acceptable value for the expected result of a measurement.

`MaximumLimit` has the following element:

| Element | Description |
| --- | --- |
| `ComparatorInfo` (required) | See [ComparatorInfo Element](#ComparatorInfo). |

### MinimumLimit Element

This is a new element. It contains the minimum acceptable value for the expected result of a measurement.

`MinimumLimit` has the following element:

| Element | Description |
| --- | --- |
| `ComparatorInfo` (required) | See [ComparatorInfo Element](#ComparatorInfo). |

### NewMaterialQuantity Element

This is a new element. It represents the quantity of stock to post as new material.

`NewMaterialQuantity` has the following attribute:

| Attribute | Description |
| --- | --- |
| `quantity` | The quantity to post as new material stock. |

`NewMaterialQuantity` has the following element:

| Element | Description |
| --- | --- |
| `UnitOfMeasure` | The unit of measure for the quantity. It must conform with UN/CEFACT Unit of Measure Common Codes. |

### OverallLimit Element

This is a new element. It contains the maximum value that the total of all unplanned services
(or the value of the material) covered by this item may not exceed. This limit represents a budget
for unplanned services, and it must not be exceeded. This limit can be used in service lines and
the items of blanket purchase orders. At service outline level (top-level service item), this field
captures limit for the total of all unplanned services (or the value of the material). At service
item level, it captures the sub-limits (the budget for that item).

`OverallLimit` has the following element:

| Element | Description |
| --- | --- |
| `Money` (required) | Monetary amount for the overall limit. |

### PaymentProposalRequest Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `companyCode` | The buyer's paying company code for this payment proposal. |

### QualityInfo Element

This is a new element. It represents the quality information requirements for a line item.

`QualityInfo` has the following element:

| Element | Description |
| --- | --- |
| `IdReference` | Contains quality material control code and inspection certificate type information for the line item. For quality material control code, the `domain` is "`controlCode`". For inspection certificate type, the `domain` is "`certificateType`". |

### QualityInspectionCharacteristic Element

This is a new element. It represents an inspection characteristic that describes what should be inspected.

`QualityInspectionCharacteristic` has the following attributes:

| Attribute | Description |
| --- | --- |
| `characteristicID` (required) | Characteristic ID number. |
| `operationNumber` | Inspection operation number. |
| `workCenter` | Work center number. |
| `procedure` | A text value that specifies how the sample size is calculated and how the inspection characteristic is assigned values. |
| `isLocked` | Set to `yes` to indicate that a characteristic is locked and no further valuations are allowed. |
| `allowDefectRecording` | Set to `yes` to indicate that defect recording is allowed. If an inspectionÂ characteristic is rejected during results recording, the function for recording defects for a characteristic is automatically invoked. |
| `characteristicType` | You use inspection characteristics to describe the inspection criteria for materials, parts, and products. This allows you to plan inspections systematically, uniformly, and economically. An inspection request can contain different type of characteristics some required, optional, or conditional.  Specify one of the following values:   * `required` - The inspection of this characteristic is required to create an inspection decision. * `optional` - The inspection of this characteristic is not required to create an inspection decision. * `afterAccept` - This conditional inspection characteristic must be inspected if the previous   required characteristic was accepted. * `afterRejection` - This conditional inspection characteristic must be inspected if the previous   required characteristic was rejected. |
| `isQuantitative` | Set to `yes` if this characteristic uses a numerical measurement. Otherwise, the characteristic uses a non-numerical, qualitative measurement. |
| `recordingType` | Indicates how the valuation will be sent for this characteristic:   * `singleResult` - Single values for each inspection characteristic. * `summarizedRecording` - Summarized values for each inspection characteristic. * `noCharacteristicRecording` - No characteristic record. * `classedRecording` - Classed values for each inspection characteristic. |
| `expirationDate` | Expiration date of the characteristic. |
| `inspectionPoint` | Inspection point types for equipment, functional locations, physical samples, or production. These inspection point types can be assigned individually in the user specifications, if required. |
| `version` | Version of characteristic. If any of the attributes change for the characteristic, the ERP generates another version for it. |

`QualityInspectionCharacteristic` has the following elements:

| Element | Description |
| --- | --- |
| `Description` | Quality inspection request description. |
| `IdReference` | Describes the code and description of the buyer characteristic, supplier characteristic, inspection method and additional information. Possible `domain` values are:   * `buyerInspectionCode` - Customer characteristic * `supplierInspectionCode` - Supplier characteristic * `inspectionMethod` - Inspection method * `additionalInfo` - Additional information |
| `AllowedValues` | Allowed values during the valuation. |
| `ExpectedResult` | Expected result for this characteristic, which is used to calculate the conformance and non-conformance samples by characteristic. |
| `SampleDefinition` | Contains the sample size and sample type. |
| `Comments` | Contains comments associated with this characteristic. |
| `Extrinsic` | Contains any additional information related to this characteristic. |

### QualityInspectionDecisionDetail Element

This is a new element. It contains information from the quality inspection decision, such as the inspection result reference,
quality quantity details, and the usage decision.

`QualityInspectionDecisionDetail` has the following attributes:

| Attribute | Description |
| --- | --- |
| `decisionID` (required) | Network hub document number for the quality inspection decision request. |
| `decisionDate` (required) | Quality inspection decision request date and time. |
| `status` | Usage decision status. Possible values are "`accepted`" and "`rejected`". |
| `qualityScore` | Quality score for this inspection decision. |
| `createdBy` | The user who created the quality inspection decision request. |

`QualityInspectionDecisionDetail` has the following elements:

| Element | Description |
| --- | --- |
| `QualityInspectionResultReference` (required) | Reference to the inspection result to confirm that all physical samples have been assigned values and the inspection has been completed. The reference can contain the `payloadId` or `DocumentNumber` and `DocumentDate` of the inspection result. |
| `QualityInspectionLotStock` (required) | Contains information about what happened to the stock posting. For example, it could include the scrap quantity or the unrestricted use quantity from the ERP. |
| `ValueGroup` | Structure to support codes and code groups for this inspection decision. |
| `Description` | Description of the quality inspection decision. |
| `Extrinsic` | Contains any additional information related to this inspection decision. |

### QualityInspectionDecisionRequest Element

This is a new element. It contains a request to confirm that all physical samples have been assigned values and
the inspection has been completed.

`QualityInspectionDecisionRequest` has the following element:

| Element | Description |
| --- | --- |
| `QualityInspectionDecisionDetail` (required) | See [QualityInspectionDecisionDetail Element](#QualityInspectionDecisionDetail). |

### QualityInspectionLotStock Element

This is a new element. It represents the posting of stock quantities from an inspection lotÂ withinÂ theÂ Quality Management
module. An inspection lotÂ is a formal request to examine a specific quantity of materials at a plant.

`QualityInspectionLotStock` has the following elements:

| Element | Description |
| --- | --- |
| `UnrestrictedUseQuantity` | The quantity of stock to post as unrestricted stock. Unrestricted stock is the physical stock that is always available at a plant/storage location that can be consumed for stock movements and available for material requirements planning. |
| `ScrapQuantity` | The quantity of stock to post as scrap. Scrap of material is expected to occur during production if the material is a component. |
| `SampleUsageQuantity` | The quantity of stock to post as sample usage stock. |
| `BlockedQuantity` | The quantity of stock to post as blocked stock. Blocked stock is not counted as unrestricted stock and is not available for material requirements planning. |
| `NewMaterialQuantity` | The quantity of stock to post as new material. |
| `ReserveQuantity` | The quantity of stock to post as reserve stock. |
| `ReturnQuantity` | The quantity of stock in the inspection lot that was returned. |

### QualityInspectionRequest Element

This is a new element. It represents a request to examine a specific quantity of materials at a plant.

`QualityInspectionRequest` has the following elements:

| Element | Description |
| --- | --- |
| `QualityInspectionRequestHeader` (required) | Contains data that is relevant for the entire quality inspection. This includes data about the partners, locations, reference documents, and item information. |
| `QualityInspectionRequestDetail` (required) | Contains details about the quality inspection request. |

### QualityInspectionRequestDetail Element

This is a new element. It contains details about a quality inspection request.

`QualityInspectionRequestDetail` has the following element:

| Element | Description |
| --- | --- |
| `QualityInspectionCharacteristic` (required) | See [QualityInspectionCharacteristic Element](#QualityInspectionCharacteristic). |

### QualityInspectionRequestHeader Element

This is a new element. It contains common information about the quality inspection request.

`QualityInspectionRespectHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `requestID` (required) | Network hub document number for the quality inspection request. |
| `requestDate` (required) | Quality inspection request date and time. |
| `operation` | Operation to be performed. Possible values:   * `new` (default) - Creates a new quality inspection request. * `update` - Updates an existing quality inspection request. * `delete` - Cancels an existing quality inspection request.   For `update` and `delete` operations, the `DocumentReference` element should indicate the original quality inspection request. |
| `version` | Version number of this document if the current `operation` is `update`. |
| `createdBy` | User who created the quality inspection request. |

`QualityInspectionRespectHeader` has the following elements:

| Element | Description |
| --- | --- |
| `DocumentReference` | Reference to an earlier quality inspection request.  If the `QualityInspectionRequestHeader@operation` is "`update`", the `DocumentReference` is required and it must reference the original `QualityInspectionRequest` document (with value "`new`" for its `QualityInspectionRequest@operation`) during the same quality inspection process.  If the attribute `QualityInspectionRequestHeader@operation` is "`delete`", the `DocumentReference` is required and it must reference the original `QualityInspectionRequest` document (with value "`new`" or "`update`" for its `QualityInspectionRequest@operation`) during the same quality inspection process. |
| `IdReference` | Inspection type specified by code and description. The `domain` should be "`inspectionType`", and the `identifier` should be the code for the inspection type. |
| `ShipTo` | Optional ShipTo address for the item if it is not related to referenced purchase order or goods receipt. |
| `BillTo` | Optional BillTo address for the item if it is not related to referenced purchase order or goods receipt. |
| `Contact` | Related contacts like buyerParty, sellerParty, senderBusinessSystemID, senderParty, receipientParty, or componentSupplier. |
| `Period` | Start and end date of the quality inspection request. |
| `Priority` | Priority of the quality inspection. |
| `ReferenceDocumentInfo` | Reference to the purchase order or goods receipt on which the quality inspection request is reported. A quality inspection request concerns only a single item. |
| `ItemInfo` | Contains information about the goods. |
| `SampleDefinition` | Contains the sample size. |
| `Batch` | Captures batch information of the customer and supplier. |
| `Comments` | Contains comments associated with this quality inspection request. |
| `Extrinsic` | Contains any additional information related to this quality inspection request. |

### QualityInspectionRequestReference Element

This is a new element. It defines the ID of a quality inspection request document.

`QualityInspectionRequestReference` has the following attributes:

| Attribute | Description |
| --- | --- |
| `inspectionID` | ID of a quality inspection request document. |
| `inspectionDate` | Date and time the quality inspection request document was created. |

`QualityInspectionRequestReference` has the following element:

| Element | Description |
| --- | --- |
| `DocumentReference` | Reference to an earlier quality inspection request. |

### QualityInspectionResultReference Element

This is a new element. It defines the ID of a quality inspection result document.

`QualityInspectionResultReference` has the following attributes:

| Attribute | Description |
| --- | --- |
| `inspectionID` | ID of a quality inspection result document. |
| `inspectionDate` | Date and time the quality inspection result document was created. |

`QualityInspectionResultReference` has the following element:

| Element | Description |
| --- | --- |
| `DocumentReference` | Reference to an earlier quality inspection result. |

### QualityInspectionResultRequest Element

This is a new element. It contains the supplier result for a quality inspection request, including
valuations for all characteristics specified in the quality inspection.

`QualityInspectionResultRequest` has the following elements:

| Element | Description |
| --- | --- |
| `QualityInspectionResultRequestHeader` (required) | Contains common information about a quality inspection result. |
| `QualityInspectionResultRequestDetail` (required) | Contains details about a quality inspection result. |

### QualityInspectionResultRequestDetail Element

This is a new element. It contains details about quality inspection result.

`QualityInspectionResultRequestDetail` has the following element:

| Element | Description |
| --- | --- |
| `QualityInspectionValuation` (required) | Contains the valuation of a characteristic of an inspection request. |

### QualityInspectionResultRequestHeader Element

This is a new element. It contains common information about a quality inspection result.

`QualityInspectionResultRequestHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `resultID` (required) | Network hub document number for the quality inspection result. |
| `resultDate` (required) | Quality inspection result date and time. |
| `version` | Version of the document. |
| `createdBy` | User who created the quality inspection result. |

`QualityInspectionResultRequestHeader` has the following elements:

| Element | Description |
| --- | --- |
| `QualityInspectionRequestReference` (required) | Reference to the quality inspection request, which can contain the `payloadId` or the `inspectionID` and `inspectionDate` of the quality inspection request. |
| `Batch` | Captures batch information of the customer and supplier. |
| `Comments` | Contains comments associated with this quality inspection result request. |
| `Extrinsic` | Contains any additional information related to this quality inspection result request. |

### QualityInspectionValuation Element

This is a new element. It contains the valuation of a characteristic specified in an inspection request.

`QualityInspectionValuation` has the following attributes:

| Attribute | Description |
| --- | --- |
| `valuationID` (required) | Number of the valuation. |
| `characteristicID` | Characteristic ID number. |
| `meanValue` | Mean value in the valuation. |
| `aboveTolerance` | Number of samples above tolerance limit. |
| `belowTolerance` | Number of samples below tolerance limit. |
| `inspectedQuantity` | Number of samples inspected. |
| `nonConformance` | Total number of samples above and below tolerance limits. This value is auto-calculated when suppliers specify the `aboveTolerance` or `belowTolerance` values. Otherwise, suppliers can specify the `nonConformance` value. |
| `deviation` | Standard deviation value. |
| `variance` | Variance of valid measured values for this characteristic. Applies to calculated characteristics for which the valuation is based on a formula. |
| `numberOfDefects` | Number of the defects in this valuation. |
| `serialNumber` | Single unit number for the unit to be inspected. |
| `inspectionDate` | Date of the characteristic inspection. |

`QualityInspectionValuation` has the following elements:

| Element | Description |
| --- | --- |
| `QualitySampleResult` (required) | Valuation for each sample inspected. |
| `ValueGroup` (required) | Structure to support codes and code groups for this valuation. |
| `Description` | Valuation description. |
| `Extrinsic` | Contains any additional information related to this valuation. |

### QualitySampleResult Element

This is a new element. It contains the sample result after valuation.

`QualitySampleResult` has the following attributes:

| Attribute | Description |
| --- | --- |
| `sampleID` | Sample number in valuation. |
| `unitValue` | Value of the sample. |
| `physicalSampleNumber` | Unique number for the sample when the sample was taken. |

### QuoteHeaderInfo Element

The following element was added:

| Element | Description |
| --- | --- |
| `DocumentReference` | Contains the payload ID of a previous `QuoteMessage` that was sent in a response. |

### QuoteItemIn Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `parentLineNumber` | Position (counting from 1) of this item's parent in a `QuoteRequest`. Used to maintain a hierarchical reference between items in documents. |
| `itemType` | Specifies whether the line item is a grouped item having child items or an independent line item. Possible values are `"composite"` to identify an item group or `"item"` to identify an independent line item.  This attribute is applicable only for a line item with an item group. |
| `serviceLineType` | Represents the type of the service line. Possible values:   * `standard` - Standard service. * `blanket` - Blanket service for which you don't specify a quantity.   It is settled as a lump sum. * `contingency` - A service that is not absolutely necessary to perform the order. * `openquantity` - A service for which the sold-to party requires that the bidder   offer the quantity for a specific partial service. * `information` - The line type does not describe a service and is for information   purposes only. |

### QuoteItemOut Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `serviceLineType` | See [QuoteItemIn@serviceLineType](#QuoteItemIn_serviceLineType). |
| `parentLineNumber` | See [QuoteItemIn@parentLineNumber](#QuoteItemIn_parentLineNumber). |
| `itemType` | See [QuoteItemIn@itemType](#QuoteItemIn_itemType). |

### ReserveQuantity Element

This is a new element. It represents the quantity of stock to post as reserve stock.

`ReserveQuantity` has the following attribute:

| Attribute | Description |
| --- | --- |
| `quantity` | The quantity to post as reserve stock. |

`ReserveQuantity` has the following element:

| Element | Description |
| --- | --- |
| `UnitOfMeasure` | The unit of measure for the quantity. It must conform with UN/CEFACT Unit of Measure Common Codes. |

### SampleDefinition Element

This is a new element. It defines the sample used for inspection.

`SampleDefinition` has the following attribute:

| Attribute | Description |
| --- | --- |
| `sampleSize` | Number of the samples required. |
| `sampleType` | Sample type. Possible values:   * `samplingProcedure` - A sampling procedure must be assigned when the master   inspection characteristic is used in the task list or in the material specification (optional for an   inspection with a material specification). * `additiveSample` - When samples are calculated, the size of the partial   sample is increased by the quantity that is required for the inspection of this characteristic. * `destructiveSample` - The sample should be destroyed after inspection.   This means that it is no longer available. This quantity is used in the usage decision as the proposed   quantity for the posting to sample. * `spcCharacteristic` - A statistical process control chart should be run. |

### SampleUsageQuantity Element

This is a new element. It represents the quantity of stock to post as sample usage stock.

`SampleUsageQuantity` has the following attribute:

| Attribute | Description |
| --- | --- |
| `quantity` | The quantity to post as sample usage stock. |

`SampleUsageQuantity` has the following element:

| Element | Description |
| --- | --- |
| `UnitOfMeasure` | The unit of measure for the quantity. It must conform with UN/CEFACT Unit of Measure Common Codes. |

### ServiceEntryItem Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `isAdHoc` | Indicates the item does not exist in the reference document or contract master agreement.. |

### SubtractingComponent Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `materialProvisionIndicator` | The material provision indicator used to identify the subcontracting type of a part for the components. Possible values:   * `reworkTo`  - Rework material to subcontractor. * `reworkFrom`  - Rework material from subcontractor. * `regular` - Vendor provides stock. |

### TaxDetail Element

The following element was added:

| Element | Description |
| --- | --- |
| `TaxExemption` | See [TaxExemption Element](#TaxExemption). |

### TaxExemption Element

This is a new element. It contains a tax exemption code and reason, which is
required to claim an exemption from taxes for some tax authorities, such
as Portugal SAF-T.

`TaxExemption` has the following attribute:

| Attribute | Description |
| --- | --- |
| `exemptCode` (required) | Specifies the code against which the tax is exempted. |

`TaxExemption` has the following element:

| Element | Description |
| --- | --- |
| `ExemptReason` | Specifies the exemption reason for zero tax. See [ExemptReason Element](#ExemptReason). |

## 1.2.033

---

### AdditionalQNInfo Element

This is a new element. It provides additional information about a quality notification, such as part
numbers (customer or supplier), batch information, or other information.

`AdditionalQNInfo` has the following attribute:

| Attribute | Description |
| --- | --- |
| `lineNumber` (required) | Represents the `AdditionalQNInfo` line number. |

`AdditionalQNInfo` has the following elements:

| Element | Description |
| --- | --- |
| `ItemID` | Represents the supplier part number and customer part number.  To provide a plant location description, the `domain` attribute of the element `IdReference` should be set to `"buyerLocationID"`, `"supplierLocationID"` or `"storageLocation"` and the `identifier` to the `plantID`. |
| `Batch` | Captures batch information of the customer and supplier. |
| `Extrinsic` | Contains any additional information related to this element. |

### Batch Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `inspectionDate` | Date on which when a batch of material/goods will be inspected. |

### InvoiceInstruction Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `verificationType` | The only supported value is `goodsReceipt`, which indicates that invoice verification for this item is based on the goods receipt. The invoice item can then be matched up uniquely with the goods receipt item. Goods-receipt-based invoice verification makes sense when you expect a delivery to be made and posted in several parts. |

### OwnerInfo Element

This is a new element. It describes the owner information of a defect, task, cause or activity.

`OwnerInfo` has the following attributes:

| Attribute | Description |
| --- | --- |
| `owner` (required) | Owner of the element. This attribute should contain the `userId`. |
| `role` (required) | Role of the owner. Possible values are `customer` or `supplier`. |

### PlanningTimeSeries Element

This is a new element. It contains planning information from buyers ERP system to provide
visibility of critical business information to suppliers and other partners.

`PlanningTimeSeries` has the following attributes:

| Attribute | Description |
| --- | --- |
| `type` (required) | A string value to identify the type time series. Possible values:   * `grossdemand` - Quantity that is considered as demand without taking   inventory and receipts into consideration. * `netdemand` - Quantity determined based on available inventory and   receipts derived based on planning output. * `supplyPlan` - Quantity derived to meet the demand based on supply planning. * `longtermforecast` - Forecast quantity derived based on historical trends. * `constrainedforecast` - Unconstrained forecast when limited by supply constraints results in   constrained forecast. * `custom` - Buyer specific business values could be represented by the `customType` string. |
| `customType` | String to include buyer-defined custom types, for example, "NARegionalForecast". |

`PlanningTimeSeries` has the following element:

| Element | Description |
| --- | --- |
| `TimeSeriesDetails` (required) | Contains product replenishment information regarding the quantity of a product for a specific time period. |

### ProductActivityDetails Element

The following elements were added:

| Element | Description |
| --- | --- |
| `Classification` | Groups items into similar categories. Typically lists the UNSPSC (United Nations Standard Products and Services Code) commodity code for each selected item. These codes are used by back-end systems within buyer and supplier organizations for accounting and report generation. For the list of UNSPSC codes, see www.unspsc.org.  `Classification@domain` can also be used to specify product hierarchy and commodity information used by a back-end system. For instance, the following `domain` values are supported by SAP ERP:   * `MaterialGroup` * `LineOfBusiness` * `ProductFamily` * `ProductSubFamily` * `InternalProgramCode` * `ExternalProgramCode` * `PartCategory` * `PartType`   `Classification` has an optional `code` attribute, which identifies the commodity by its designated code. |
| `PlannedAcceptanceDays` | Number of days the buyer schedules for the inspection of goods after receiving them. |
| `ManufacturerPartID` | ID that the item's manufacturer uses to identify the item. |
| `ReferenceDocumentInfo` | Contains details of a referenced document. |
| `Characteristic` | Contains detailed information about an item that can be used across different industries. Can also be used to send material characteristics to support configurable material process. |
| `PlanningTimeSeries` | Contains planning information from buyers ERP system to provide visibility of critical business information to suppliers and other partners. See [PlanningTimeSeries Element](#PlanningTimeSeries). |

### ProductActivityHeader Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `processType` | Identifies the business process supported by the message. Possible values:   * `SMI` - Supplier-managed inventory * `OEM` - OEM-owned inventory scenarios * `VMI` - Vendor-managed inventory * `3PL` - Third-party logistics inventory scenarios * `ManufacturingVisibility` - Contract manufacturers sharing inventory visibility * `Forecast` - Forecast collaboration * `Consignment` - Consignment material movements * `Sales` - Sales report visibility * `POC` - Purchase order collaboration scenarios * `Other` - Other collaboration scenarios |

### ProductReplenishmentHeader Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `processType` | See [ProductActivityHeader@processType](#processType_attr). |

### ProductReplenishmentDetails Element

The following elements were added:

| Element | Description |
| --- | --- |
| `PlannedAcceptanceDays` | Number of days the buyer schedules for the inspection of goods after receiving them. |
| `ManufacturerPartID` | ID that the item's manufacturer uses to identify the item. |
| `ReferenceDocumentInfo` | Contains details of a referenced document. |

### QualityNotificationActivity Element

The following elements were added:

| Element | Description |
| --- | --- |
| `OwnerInfo` | Contains information about the owner of this activity. |
| `Extrinsic` | Contains additional information related to this activity. |

### QualityNotificationCause Element

The following elements were added:

| Element | Description |
| --- | --- |
| `OwnerInfo` | Contains information about the owner of this cause. |
| `Extrinsic` | Contains additional information related to this cause. |

### QualityNotificationRequestHeader Element

The following attributes were added or updated:

| Attribute | Description |
| --- | --- |
| `status` | Current status of the document. Possible values: `draft`, `new` (default), `in-process`, `completed`, `postponed`, `canceled` and `closed`. The `canceled` status value was added for 1.2.033. |
| `minimumRequiredTasks` | Number of minimum required tasks to close this quality notification. Evaluated only when the `status` is `"closed"`. |
| `minimumRequiredActivities` | Number of minimum required activities to close this quality notification. Evaluated only when the `status` is `"closed"`. |

The following element was added:

| Element | Description |
| --- | --- |
| `Extrinsic` | Contains additional information related to this document. |

### QualityNotificationRequestItem Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `minimumRequiredTasks` | Number of minimum required tasks to complete this defect. Evaluated only when `isCompleted` attribute is true. |
| `minimumRequiredActivities` | Number of minimum required activities to complete this defect. Evaluated only when `isCompleted` attribute is true. |
| `minimumRequiredCauses` | Number of minimum required causes to complete this defect. Evaluated only when `isCompleted` attribute is true. |

The following elements were added:

| Element | Description |
| --- | --- |
| `OwnerInfo` | Contains information about the owner of this defect. |
| `AdditionalQNInfo` | See [AdditionalQNInfo Element](#AdditionalQNInfo). |
| `Extrinsic` | Contains additional information related to this defect. |

### QualityNotificationTask Element

The following elements were added:

| Element | Description |
| --- | --- |
| `OwnerInfo` | Contains information about the owner of this task. |
| `Extrinsic` | Contains additional information related to this task. |

### ReplenishmentTimeSeries Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `customType` | String to include buyer-defined custom types, for example, "BuildQuantity". |

### ScheduleLineReleaseInfo Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `receivedQuantity` | Quantity received against the Schedule line of the order or the Scheduling Agreement line item based on the Goods Receipt posted in an external system, such as an ERP. The quantity is informational only and is used as visibility for suppliers. It is not validated for invoice or shipment processing. |

### TaxDetail Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `basePercentageRate` | The base tax rate in number of percentage. For some `Tax` categories (for example, ICMS for Brazil) `TaxAmount` is calculated considering the `basePercentageRate` along with `percentageRate`.  `TaxAmount` = `TaxableAmount` \* `percentageRate` \* `basePercentageRate`  Used only in Quote messages. |
| `isIncludedInPrice` | Set to `"yes"` (true) if the `TaxAmount` is included in the price. The default is `"no"` (false). Used only in Quote messages. |

## 1.2.032

---

### AdjustmentAmount Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `type` | Type of adjustment amount, for example, `"withholdingTax"`. |

### ApprovalItem Element

This is a new element. A approval request can contain one or more approval items. A approval item provides details about a specific approval of a line item.

`ApprovalItem` has the following attributes:

| Attribute | Description |
| --- | --- |
| `lineNumber` (required) | Number of the line item. |
| `quantity` (required) | Cumulative confirmed quantity of all elements of the same line item in the corresponding order confirmation. |
| `approvalStatus` (required) | Approval status of the line item. Possible values:   * `approved` * `awaitingApproval` * `reject` * `approvedAndUpdatePO` |
| `reason` | Reason why the line item is out of tolerance. Possible values:   * `quantityDeviation` * `dateDeviation` * `quantityAndDateDeviation` |
| `startDate` | Reserved for future use. |
| `endDate` | Reserved for future use. |
| `deviatedDate` | First delivery date of all confirmed elements of the same line item that is out of tolerance. |

`ApprovalItem` has the following elements:

| Element | Description |
| --- | --- |
| `UnitOfMeasure` (required) | Unit of measure to specify the quantity. |
| `Comments` | Contains comments associated with this approval item. |

### ApprovalRequest Element

This is a new element. It defines an approval notification for an order confirmation that contains out of tolerance line items.

`ApprovalRequest` has the following elements:

| Element | Description |
| --- | --- |
| `ApprovalRequestHeader` (required) | Contains data that is relevant for the entire approval request. This includes data about type of approval, date, reference documents. |
| `ApprovalItem` | A approval request can contain one or more approval items. A approval item provides details about a specific approval of a line item. |

### ApprovalRequestHeader Element

This is a new element. It contains data that is relevant for the entire approval request. This includes data about type of approval, date, reference documents.

`ApprovalRequestHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `approvalStatus` | Approval status of the request. Possible values:   * `approved` * `awaitingApproval` * `reject` * `approvedAndUpdatePO` |
| `type` | The type of document needing approval. The only possible value is `"orderConfirmation"`. |
| `creationDate` | Date and time when the document was created. |
| `approvalStartDate` | Reserved for future use. The date and time on which the approval is allowed to start. |
| `approvalEndDate` | Reserved for future use. The date and time on which the approval is allowed to end. |

`ApprovalRequestHeader` has the following elements:

| Element | Description |
| --- | --- |
| `DocumentReference` (required) | Contains the `payloadId` of the underlying document to be approved (for example, the order confirmation). |
| `cXMLAttachment` (required) | Contains the original cXML `ConfirmationRequest` document to be approved. |
| `Contact` | Contact information for the document partners. |
| `Comments` | Contains comments associated with this approval request. |

### ComplainQuantity Element

This is a new element. It specifies the quantity subject to complaints.

`ComplainQuantity` has the following attribute:

| Attribute | Description |
| --- | --- |
| `quantity` | The quantity of the item subject to complaint. |

`ComplainQuantity` has the following element:

| Element | Description |
| --- | --- |
| `UnitOfMeasure` (required) | The unit of measure for the quantity. It must conform with UN/CEFACT Unit of Measure Common Codes. |

### ComponentConsumptionDetails Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `usage` | Specifies whether the supplier uses a component listed in the order. Used only when confirming an order. Possible values are `yes` (or not specified) or `no`. In other contexts, `usage` is not used. For example, when reporting component consumption use `type` instead. |

### ConfirmationStatus Element

The following element was added:

| Element | Description |
| --- | --- |
| `ComponentConsumptionDetails` | Contains detailed information about consumption of components in the manufacturing of final product. |

### ExternalDocumentType Element

This is a new element. It contains information about a document managed in an external system, such as an ERP. It can be sent with an order
to distinguish different business transactions uniquely.

`ExternalDocumentType` has the following attribute:

| Attribute | Description |
| --- | --- |
| `documentType` (required) | A string specifying the document type from the external system. |

`ExternalDocumentType` has the following element:

| Element | Description |
| --- | --- |
| `Description` | Provides an optional description of the document type. |

### FollowUpDocument Element

This is a new element. It provides a hint about the way to follow up on a `QuoteMessage` response.
The type and category could be set to anything. But, they should be well known strings that can be understood by
the ERP system. For example, the type could be set to "Contract" and the category could be set to "WK". This
would give a hint to the ERP system that the next step should be to create a WK Contract. This element can
also be specified in the header section, which can affect the user interface of the sourcing solution
appropriately.

`FollowUpDocument` has the following attributes:

| Attribute | Description |
| --- | --- |
| `type` | Follow up type, for example, "Contract". |
| `category` | Follow up category, for example, "WK". |

### Forecast Element

The following element was added:

| Element | Description |
| --- | --- |
| `UnitPrice` | Price per unit of the forecast quantity. |

### ForecastDetails Element

This is a new element. It defines the start and end dates for the accumulation of the forecast for a part.

`ForecastDetails` has the following attributes:

| Attribute | Description |
| --- | --- |
| `cumulativeStartDate` | The start date at which the cumulative values for forecast and commit will be calculated. If not provided, the accumulation of the forecast for a part will start on the earliest date for which there is forecast data. |
| `cumulativeEndDate` | The end date till which the cumulative values for forecast and commit will be calculated. |

### ItemOutIndustry Element

The `planningType` attribute was updated with `ATO` and `CTO` values:

| Attribute | Description |
| --- | --- |
| `planningType` | Specifies the planning strategy. Possible values:   * `MTO` - Make to Order * `MTS` - Make to Stock * `ATO` - Assemble to Order * `CTO` - Configure to Order |

### MalfunctionPeriod Element

This is a new element. It specifies the time period during which the item presented this defect.

`MalfunctionPeriod` has the following element:

| Element | Description |
| --- | --- |
| `Period` (required) | Defines a start date and end date for this malfunction. |

### OrderRequestHeaderIndustry Element

The following element was added:

| Element | Description |
| --- | --- |
| `ExternalDocumentType` | See [ExternalDocumentType Element](#ExternalDocumentType). |

### PaymentProposalRequest Element

This element can now have multiple `AdjustmentAmount` elements, including
one for withholding tax (`type="withholdingTax"`).

### ProductActivityDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `ForecastDetails` | See [ForecastDetails Element](#ForecastDetails). |

### ProductReplenishmentDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `Characteristic` | Specifies detailed information about an item that can be used across several different industries. |

### QNCode Element

This is a new element. It contains quality notification codes and their descriptions in different domains.

`QNCode` has the following attributes:

| Attribute | Description |
| --- | --- |
| `domain` (required) | Domain in which this value has meaning. Recognized domains include:   * `type` - Quality notification type, does not have a code group. * `subject` - Quality notification subject (category). * `reason` - Reason of defect. * `task` - Quality notification task. * `activity` - Quality notification activity. * `defect` - Quality notification defect. * `cause` - Quality notification cause. * `revision` - Quality notification revision. |
| `codeGroup` | Name of the code group. |
| `codeGroupDescription` | Description of the code group. |
| `code` (required) | Quality notification code. |
| `codeDescription` (required) | Description of the quality notification code. |

### QNNotes Element

This is a new element. It defines subject code, description, and attachments of a quality notification.

`QNNotes` has the following attributes:

| Attribute | Description |
| --- | --- |
| `user` (required) | User name or user id of who created message. |
| `createDate` (required) | Timestamp of the message. |

`QNNotes` has the following elements:

| Element | Description |
| --- | --- |
| `QNCode` | Code identifying the type of message. Its `domain` is "subject". |
| `Description` (required) | Provides a description of the quality notification. |
| `Attachment` | Files attached to this message. |

### QualityNotificationActivity Element

This is a new element. It defines a quality notification activity.

`QualityNotificationActivity` has the following attributes:

| Attribute | Description |
| --- | --- |
| `activityId` (required) | Number of the activity. |
| `isCompleted` | Set to `yes` if the activity was completed. |

`QualityNotificationActivity` has the following elements:

| Element | Description |
| --- | --- |
| `QNCode` | Group and code defining the type of activity. |
| `Description` | Text describing this activity. |
| `Period` | Start and end time for the activity. |

### QualityNotificationCause Element

This is a new element. It defines the cause of a quality notification.

`QualityNotificationCause` has the following attribute:

| Attribute | Description |
| --- | --- |
| `causeId` (required) | Number of the cause. |

`QualityNotificationCause` has the following elements:

| Element | Description |
| --- | --- |
| `QNCode` | Group and code defining the type of cause. |
| `Description` | Text describing this cause. |

### QualityNotificationRequest Element

This is a new element. It defines a quality notification for one or more defects associated with a line item
on a purchase order or a ship notice. You use a code to classify each item according to the type of problem or
defect. The details of the problem or defect can contain causes, tasks, activities, codes, code groups, and
descriptions.

`QualityNotificationRequest` has the following elements:

| Element | Description |
| --- | --- |
| `QualityNotificationRequestHeader` (required) | Contains information about this quality notification request that is common to all contained defect items. |
| `QualityNotificationRequestItem` | Contains defect item detail. |

### QualityNotificationRequestHeader Element

This is a new element. It contains information about this quality notification request that is common to all contained defect items.

`QualityNoficiationRequestHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `requestID` (required) | The network hub document number for the quality notification. |
| `externalRequestID` | ERP document number for the quality notification. |
| `requestDate` (required) | Quality notification request date and time. |
| `requestVersion` | Version number of this document if the current `operation` is "update". |
| `operation` | Operation to be performed. Possible values:   * `new` - Creates a new quality notification. * `update` - Updates an existing quality notification. The `DocumentReference`   element references the original quality notification. |
| `status` | Current status of the document. Possible values: `draft`, `new` (default), `in-process`, `completed`, `postponed` and `closed`. |
| `discoveryDate` | Date and time when the defect was discovered. |
| `serialNumber` | Serial number of the defective goods. |
| `returnDate` | Date on which the defective goods were returned. |
| `returnAuthorizationNumber` | Return Authorization Number information for a line item. |
| `itemCategory` | Set to `subcontract` if the defect originated with a subcontract supplier. |

`QualityNoficiationRequestHeader` has the following elements:

| Element | Description |
| --- | --- |
| `DocumentReference` | Reference to an earlier `QualityNotificationRequest`. If `operation` is "update", the `DocumentReference` is required and it must reference the original `QualityNotificationRequest`. |
| `QNCode` | Defines the quality notification in one of the following domains:   * "type" of quality notification without code group. * "subject" (category) group and code. * "reason" of this quality notification. * "revision" of this quality notification (if `operation`="update") |
| `ShipTo` | ShipTo address related to the item if different from the referenced order or ship notice. |
| `BillTo` | BillTo address related to the item if different from the referenced order or ship notice. |
| `Shipping` | Shipping address related to the item if different from the referenced order or ship notice. |
| `Contact` | Related contacts like buyerParty, sellerParty, senderBusinessSystemID, senderParty, receipientParty or componentSupplier. |
| `QNNotes` (required) | Defines comments and attachments for the quality notification. |
| `Priority` (required) | Priority for the quality notification. |
| `RequestedProcessingPeriod` | The time period during which the processing is required. |
| `MalfunctionPeriod` | The time period during which item presented this defect. |
| `ReferenceDocumentInfo` | Reference to purchase order or ship notice on which the quality notification is reported. Notifications are only addressed to a single item. You can send a quality notification without a referenced document and instead include relevant information in the other elements. |
| `ItemInfo (required)` | Contains information about the goods. |
| `Batch` | Contains batch information for material or goods produced in a single manufacturing run. |
| `ComplainQuantity` | Contains the quantity that was complained. |
| `ReturnQuantity` | Contains the quantity that was returned. |
| `QualityNotificationTask` | Contains task detail information for the quality notification. |
| `QualityNotificationActivity` | Contains activity detail information for the quality notification. |

### QualityNotificationRequestItem Element

This is a new element. It contains defect item detail for a quality notification.

`QualityNotificationRequestItem` has the following attributes:

| Attribute | Description |
| --- | --- |
| `defectId` (required) | Number of the defect. |
| `defectCount` | Quantity of defects in this quality notification item. |
| `isCompleted` | Set to `yes` if all activities and tasks were completed. |
| `completedDate` | Date and time when quality notification item was completed. |

`QualityNotificationRequestItem` has the following elements:

| Element | Description |
| --- | --- |
| `QNCode` | Code with `domain` "defect". |
| `Description` | Text describing this defect. |
| `Period` | Planned start and end time for processing this defect. |
| `QualityNotificationTask` | Tasks required to process this item. |
| `QualityNotificationActivity` | Activities required to process this item. |
| `QualityNotificationCause` (required) | Causes of the defects contained in this item. |

### QualityNotificationTask Element

This is a new element. It defines a task associated with a quality notification.

`QualityNotificationTask` has the following attributes:

| Attribute | Description |
| --- | --- |
| `taskId` (required) | Number of the task. |
| `status` | Current state of execution of this task. Possible values:   * `new` (default) * `in-process` * `complete` |
| `completedDate` | Date and time when the task was completed. |
| `completedBy` | User ID of the person who completed this task. |
| `processorId` | The ID of the person or organization responsible for this task. In the case of a supplier, can be the user ID or the network hub ID. |
| `processorName` | The name of the person or organization responsible for this task. In the case of a supplier, can be the user name or company name. |
| `processorType` | Type of processor. Possible values:   * `customer` * `supplier` * `customerUser` |

`QualityNotificationTask` has the following elements:

| Element | Description |
| --- | --- |
| `QNCode` | Codes with `domain` "task". |
| `Description` | Text describing this task. |
| `Period` | Planned start and end time for processing this task. |

### QuoteHeaderInfo Element

This is a new element. It represents quote items associated with the header.

`QuoteHeaderInfo` has the following elements:

| Element | Description |
| --- | --- |
| `LegalEntity` | A legal entity in the external system. It has an IdReference element. |
| `OrganizationalUnit` | Identifies the Purchase Unit or Purchase group in the external system. It has an IdReference element. |
| `PaymentTerms` | Defines the payment terms in a PaymentProposalRequest document. |
| `FollowUpDocument` | Provides a hint about the way to follow up on a `QuoteMessage` response. |
| `Extrinsic` | Contains any additional information related to this object. |

### QuoteItemIn Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `itemClassification` | Specifies whether the current line item is `"material"` or `"service"`. |

The following elements were added:

| Element | Description |
| --- | --- |
| `TermsOfDelivery` | Optional shipping terms (incoTerms) as defined by the International Chamber of Commerce. |
| `ReferenceDocumentInfo` | Contains information about a referenced document. |

### QuoteItemOut Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `itemClassification` | Specifies whether the current line item is `"material"` or `"service"`. |

The following elements were added:

| Element | Description |
| --- | --- |
| `TermsOfDelivery` | Optional shipping terms (incoTerms) as defined by the International Chamber of Commerce. |
| `ReferenceDocumentInfo` | Contains information about a referenced document. |

### QuoteMessage Element

The `QuoteItemIn` element is now optional. It can occur zero or more times.

### QuoteMessageHeader Element

The optional [QuoteHeaderInfo](#QuoteHeaderInfo) element was added.

### QuoteRequestHeader Element

The optional [QuoteHeaderInfo](#QuoteHeaderInfo) element was added.

### RemittanceDetail Element

This element can now have multiple `AdjustmentAmount` elements, including
one for withholding tax (`type="withholdingTax"`).

### RequestedProcessingPeriod Element

This is a new element. It represents the time period for processing this defect.

`RequestedProcessingPeriod` has the following element:

| Element | Description |
| --- | --- |
| `Period` (required) | Start and end time for processing the defect. |

### ScheduleLine Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `originalRequestedDeliveryDate` | The original date that the specified quantity is expected to be delivered. This date is not subject to changes. |

### TaxDetail Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `isWithholdingTax` | Set to `yes` if the tax is a withholding tax. |
| `taxRateType` | Specifies the tax rate type (a string) that corresponds to a specific tax type. For example, in Germany the tax rate of 19% for value-added tax (VAT) corresponds to the "Standard" tax rate type. In different EU member states, different VAT rates are allowed. The tax rate type makes it easy for the back-end system to handle different rates that result from changes in tax law. |

## 1.2.031

---

### cxml.requests Entity

The [`PaymentBatchRequest`](#PaymentBatchRequest) element was added to `cxml.requests`.

### cxml.statuses Entity

The [`IntegrationStatus`](#IntegrationStatus) element was added to `cxml.statuses`.

### ComponentConsumptionItem Element

For consistency with other cXML elements, the optional `BuyerBatchID` and `SupplierBatchID` elements have been replaced with the
`UnitOfMeasure` and `Batch` elements.

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `quantity` | The quantity of component that is consumed. |

### ControlKeys Element

The following element was added:

| Element | Description |
| --- | --- |
| `SESInstruction` | See [SESInstruction Element](#SESInstruction). |

### ControlSum Element

This is a new element. It contains the total net payment amount without currency in the batch.

### IntegrationMessage Element

This is a new element. It indicates the type/result of the message received by external parties.

`IntegrationMessage` has the following attributes:

| Attribute | Description |
| --- | --- |
| `isSuccessful` (required) | Indicates whether the message result is positive (`yes`) or negative (`no`). |
| `type` (required) | Indicates the message type, for example, 997/824/MDN. |

### IntegrationStatus Element

This is a new element. It is used to allow external parties to provide document status visibility
after the document is processed and delivered by the network hub.

`IntegrationStatus` has the following attribute:

| Attribute | Description |
| --- | --- |
| `documentStatus` (required) | Indicates document status and could be one of the following values:   * `deliverySuccessful` - The document was successfully delivered to the customer (but no   processing confirmation has been issued yet). * `deliveryDelayed` - The document is experiencing delays while trying to reach the customer. * `deliveryFailed` - The document couldn't be sent to the customer due to a failure between   the gateway and the customer. * `deliveryReady` - When sending to the buyer, the document has been queued and is ready for pick-up. * `customerConfirmed` - The customer has confirmed that the document has been processed successfully. * `customerReceived` - The customer has confirmed that the document has been received successfully. * `customerFailed` - The customer has received the document and is reporting a failure in the content. |

`IntegrationStatus` has the following element:

| Element | Description |
| --- | --- |
| `IntegrationMessage` | See [IntegrationMessage Element](#IntegrationMessage). |

### InvoiceDetailHeaderIndicator Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `priceBasedLineLevelCreditMemo` | Set to `yes` to indicate that the invoice is a price-based, line-level credit memo for an early payment discount granted after the original invoice was issued. |

### InvoiceDetailRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `PaymentProposalIDInfo` | See [PaymentProposalIDInfo Element](#PaymentProposalIDInfo). |

### InvoiceInstruction Element

The `value` attribute is now optional, and it supports the following new values:

* `allowed` - allows someone to create an invoice item for this line item, regardless of current rule settings.
* `notAllowed` - does not allow someone to create an invoice item for this line item, regardless of current rule settings.

The following element was added:

| Element | Description |
| --- | --- |
| `TemporaryPrice` | See [TemporaryPrice Element](#TemporaryPrice). |

### ItemDetail Element

The following element was added:

| Element | Description |
| --- | --- |
| `PlannedAcceptanceDays` | See [PlannedAcceptanceDays Element](#PlannedAcceptanceDays). |

### ItemOut Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `isDeliveryCompleted` | Set to `yes` to indicate that this item is considered closed, and no more deliveries are expected for it. This flag is set by the buyer for informative purposes. |

### NumberOfPayments Element

This is a new element. It contains the number of payment remittances in the batch.

### PaymentBatchRequest Element

This is a new element. It specifies a payment batch and the payment remittances included in the batch.

`PaymentBatchRequest` has the following elements:

| Element | Description |
| --- | --- |
| `PaymentBatchRequestHeader` (required) | The header information of this request. |
| `PaymentBatchSummary` (required) | The summary information of this request. |
| `PaymentRemittanceRequest` (required) | A payment remittance that contains the details of a payment from a buyer to a supplier. |

### PaymentBatchRequestHeader Element

This is a new element. It defines the header information of a `PaymentBatchRequest`.

`PaymentBatchRequestHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `batchID` (required) | Unique identifier of a batch. |
| `paymentDate` (required) | The date that the network hub should initiate payment. This date has impact only if buyer is configured to hold payments for the automated payment method. If not, payment is initiated right away. |
| `creationDate` (required) | Date and time this payment batch was created. |

`PaymentBatchRequestHeader` has the following elements:

| Element | Description |
| --- | --- |
| `PaymentMethod` | Payment method of the batch. If exists, the payment method at each individual payment remittance will be ignored. |
| `Extrinsic` | Contains any additional information related to this object. |

### PaymentBatchSummary Element

This is a new element. It contains the summary information of a `PaymentBatchRequest`.

`PaymentBatchSummary` has the following elements:

| Element | Description |
| --- | --- |
| `ControlSum` (required) | See [ControlSum Element](#ControlSum). |
| `NumberOfPayments` (required) | See [NumberOfPayments Element](#NumberOfPayments). |

### PaymentProposalIDInfo Element

This is a new element. It defines the ID of a `PaymentProposalRequest` known to the supplier and buyer system.

`PaymentProposalIDInfo` has the following attribute:

| Attribute | Description |
| --- | --- |
| `paymentProposalID` (required) | The ID of a `PaymentProposalRequest` known to the buyer and supplier system. |

### PaymentProposalRequest Element

The following element was added:

| Element | Description |
| --- | --- |
| `PaymentTerms` | See [PaymentTerms Element](#PaymentTerms). |

### PaymentRemittanceRequestHeader Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `status` | Status of the payment remittance. Possible values are `new` (default) or `void`. |
| `companyCode` | Company code of the buyer. |

### PaymentTerms Element

This is a new element. It defines the payment terms in a `PaymentProposalRequest` document.

`PaymentTerms` has the following attribute:

| Attribute | Description |
| --- | --- |
| `paymentTermCode` (required) | The payment term code defined in the buyer's system. |

`PaymentTerms` has the following elements:

| Element | Description |
| --- | --- |
| `PaymentTerm` | Defines a payment term in an invoice or order. Payment term can be the net term (without discount) or discount term (with discount). |
| `Description` | Contains a description of the payment terms. |
| `Extrinsic` | Contains any additional information related to this object. |

### PlannedAcceptanceDays Element

This is a new element. It specifies the number of days the buyer schedules for the inspection of goods after receiving them.

### Priority Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `sequence` | A unique secondary order number for prioritizing items with the same priority level. Two items with the same priority level are not allowed to have the same sequence number. |
| `inventory_level` | Shows the percent inventory (buffer) level with respect to the target, specified as a decimal value from 0.00 to 100.00. |

### ReceiptItem Element

The following element was added:

| Element | Description |
| --- | --- |
| `Batch` | An element carrying batch information for material or goods produced in a single manufacturing run. |

### ReceiptRequestHeader Element

The `operation` attribute supports a new value: `"delete"`. If `operation` is set
to `"delete"`, the existing receipt specified by the `DocumentReference` element is
canceled. The `"delete"` `operation` is supported only for component receipts. The default
value for `operation` is `"new"`.

The following element was added:

| Element | Description |
| --- | --- |
| `DocumentReference` | Reference to an earlier `ReceiptRequest`. If the attribute `ReceiptRequestHeader@operation` is `"delete"`, the `DocumentReference` element is required and it must reference the original `ReceiptRequest` document during the same receipt process. |

### ReleaseInfo Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `releaseNumber` | A string indicating the release number. |

### RemittanceDetail Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `referenceDocumentNumber` | Any external document number (a string) for the remittance detail. |
| `paymentProposalID` | The payment proposal identifier (a string) that's associated with this invoice. |

### SESInstruction Element

This is a new element. It indicates whether a service sheet is allowed for this line item,
regardless of the default business rules configured in the network hub.

`SESInstruction` has the following attribute:

| Attribute | Description |
| --- | --- |
| `value` (required) | Value indicating whether a service sheet is allowed. Possible values are `"allowed"` or `"notAllowed"`. |

### ShipNoticeHeader Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `reason` | The reason for the ship notice. The only possible value for `reason` is `"return"`, which means the shipment contains items that are being returned from the buyer to the supplier for some reason. For example, the items could be damaged or defective. |

### StatusUpdateRequest Element

The following element was added:

| Element | Description |
| --- | --- |
| `IntegrationStatus` | See [IntegrationStatus Element](#IntegrationStatus). |

### TemporaryPrice Element

This is a new element. It indicates if pricing information is temporary or final. It can be set at the order header or item level.
If set to `yes` at the order item level, pricing for the item is considered temporary
and the supplier cannot invoice the line item. If set to `yes` at the order header level,
pricing is considered temporary for the entire purchase order and the supplier cannot invoice against
any item on the order.

`TemporaryPrice` has the following attribute:

| Attribute | Description |
| --- | --- |
| `value` (required) | Set to `yes` to indicate that the price is temporary, or `no` to indicate that the price is final. |

### TradeItem Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `maturityDate` | The maturity date of the payment proposal of the trade item. |

## 1.2.030

---

### AttachmentReference Element

The following optional attribute was added:

| Attribute | Description |
| --- | --- |
| `version` | Specifies the version of the external source. Examples: "1.0", "2.4.10" "Beta", "V-2". |

The following optional element was added:

| Element | Description |
| --- | --- |
| `URL` | A link to a referenced source on the buyer's system. |

### CommercialTerms Element

This is a new element. It defines the commercial terms of goods.

`CommercialTerms` has the following attribute:

| Attribute | Description |
| --- | --- |
| `incoterms` (required) | Contains the three-letter Incoterms 2010 edition code, in lower case, as defined by the International Chamber of Commerce (ICC). Possible values:   * `cfr` - Cost And Freight * `cif` - Cost Insurance And Freight * `cip` - Carriage And Insurance Paid * `cpt` - Carriage Paid * `daf` - Delivered At Frontier * `ddp` - Delivered Duty Paid * `ddu` - Delivered Duty Unpaid * `deq` - Delivered Ex Quay * `des` - Delivered Ex Ship * `exw` - Ex Works * `fas` - Free Alongside Ship * `fca` - Free Carrier * `fob` - Free On Board |

### Consignment Element

This is a new element. It describes a consignment, which is a collection of packages going from a single originating party
to a single destination party.

`Consignment` has one required attribute:

| Attribute | Description |
| --- | --- |
| `consignmentID` (required) | Identifier for this consignment. |

`Consignment` has the following elements:

| Element | Description |
| --- | --- |
| `ConsignmentHeader` (required) | See [ConsignmentHeader Element](#ConsignmentHeader). |
| `ConsignmentLineDetail` (required) | See [ConsignmentLineDetail Element](#ConsignmentLineDetail). |
| `TransportEquipment` | See [TransportEquipment Element](#TransportEquipment). |

### ConsignmentConfirmation Element

This is a new element. It represents an update made to a previously existing consignment from the referenced
`TransportRequest`.

`ConsignmentConfirmation` has the following attributes:

| Attribute | Description |
| --- | --- |
| `consignmentID` (required) | Identifier for this consignment. |
| `consignmentStatus` (required) | The new status for this consignment. Possible values:   * `accepted` * `collected` * `rejected` * `cancelled` |
| `rejectionReason` | If the `consignmentStatus` is "rejected", then a reason must be provided in this attribute. |

`ConsignmentConfirmation` has the following elements:

| Element | Description |
| --- | --- |
| `ConsignmentConfirmationHeader` (required) | See [ConsignmentConfirmationHeader Element](#ConsignmentConfirmationHeader). |
| `TransportEquipment` | See [TransportEquipment Element](#TransportEquipment). |

### ConsignmentConfirmationHeader Element

This is a new element. It contains common information for this consignment confirmation.

`ConsignmentConfirmationHeader` has the following optional attribute:

| Attribute | Description |
| --- | --- |
| `numberOfPackages` | The updated package count, only if it needs to be updated. |

`ConsignmentConfirmationHeader` has the following elements:

| Element | Description |
| --- | --- |
| `Hazard` | Provides a textual description and optional codes about hazards inherent in both an item and an overall shipment. |
| `Dimension` | Specifies a single dimension for the packaging of the item. |
| `ReferenceDocumentInfo` | Contains information about a referenced document. |
| `ShipmentIdentifier` | A tracking number defined by the carrier that appears on the shipment that can be used to obtain additional detail about the shipment. |
| `OriginConfirmation` | See [OriginConfirmation Element](#OriginConfirmation). |
| `DestinationConfirmation` | See [DestinationConfirmation Element](#DestinationConfirmation). |
| `Comments` | Contains comments associated with this object. |
| `Extrinsic` | Contains any additional information related to this object. |

### ConsignmentHeader Element

This is a new element. It contains common information for all the packages of this consignment.

`ConsignmentHeader` has the following optional attribute:

| Attribute | Description |
| --- | --- |
| `numberOfPackages` | Total number of physical packages of this consignment. |

`ConsignmentHeader` has the following elements:

| Element | Description |
| --- | --- |
| `TransportPartner` | See [TransportPartner Element](#TransportPartner). |
| `Dimension` | Specifies a single dimension for the packaging of the item. |
| `CommercialTerms` | See [CommercialTerms Element](#CommercialTerms). |
| `NetAmount` | Total value of the goods in this consignment. |
| `ReferenceDocumentInfo` | Reference to legal documents related to this consignment. |
| `ShipmentIdentifier` | Identifier for this consignment as assigned by the carrier (if known). |
| `TransportRequirements` | See [TransportRequirements Element](#TransportRequirements). |
| `Origin` (required) | See [Origin Element](#Origin). |
| `Destination` (required) | See [Destination Element](#Destination). |
| `Route` | Indicates the transport mode (method) and means for this consignment. No other `Route` data is needed for this context. See [Route Element](#Route). |
| `TransportCondition` | See [TransportCondition Element](#TransportCondition). |
| `Comments` | Contains comments associated with this object. |
| `Extrinsic` | Contains any additional information related to this object. |

### ConsignmentLineDetail Element

This is a new element. It contains a group of packages of a consignment. Each package may contain a single item on it.

`ConsignmentLineDetail` has the following attributes:

| Attribute | Description |
| --- | --- |
| `lineNumber` (required) | A sequential number for this line that is unique for this consignment. |
| `numberOfPackages` (required) | Total number of physical packages of this consignment. |

`ConsignmentLineDetail` has the following elements:

| Element | Description |
| --- | --- |
| `TransportPackage` | See [TransportPackage Element](#TransportPackage). |
| `TransportRequirements` | See [TransportRequirements](#TransportRequirements). |
| `TransportPlacement` | See [TransportPlacement Element](#TransportPlacement). |
| `ReferenceDocumentInfo` | Reference to external documents. |
| `Comments` | Contains comments associated with this object. |
| `Extrinsic` | Contains any additional information related to this object. |

### DateInfo Element

The following attribute was updated:

| Attribute | Description |
| --- | --- |
| `type` | Date type. Possible values:   * `expectedShipmentDate` - expected ship date for the material is   used to determine when the supplier is expected to ship the material   from their location. * `productionStartDate` - production start date. * `productionFinishDate` - production finish date. * `requestedPickUpDate` - pick up date as requested by   the party arranging the transport. * `expectedPickUpDate` - date when the logistic provider   expects to pick up the materials. * `actualPickUpDate` - actual pick up date, as it has occurred. * `requestedDeliveryDate` - delivery date as requested by the   party arranging the transport. * `expectedDeliveryDate` - expected delivery date for the material   to be received at the partner location. * `actualDeliveryDate` - actual delivery date of the goods. |

### Destination Element

This is a new element. It describes the destination location for the goods.

`Destination` has the following elements:

| Element | Description |
| --- | --- |
| `Address` (required) | Contains the address of this location. |
| `DateInfo` | Contains dates applicable for this location. |
| `Extrinsic` | Contains any additional information related to this object. |

### DestinationConfirmation Element

This is a new element. It specifies additional dates to the destination location specified in the
referenced `TransportRequest`.

`DestinationConfirmation` has the following elements:

| Element | Description |
| --- | --- |
| `DateInfo` | Contains date information associated with a document or item. |
| `Extrinsic` | Contains any additional information related to this object. |

### DiscountBasis Element

This is a new element. It defines the discount basis for the payable.

`DiscountBasis` has one required element:

| Element | Description |
| --- | --- |
| `Money` (required) | Monetary amount for the discount basis. |

### FreightChargesAmount Element

This is a new element. It contains the total of freight charges.

`FreightChargesAmount` has one required element:

| Element | Description |
| --- | --- |
| `Money` (required) | Monetary amount of the freight charges. |

### InsuranceValue Element

This is a new element. It contains the declared value of the goods for insurance purposes.

`InsuranceValue` has one required element:

| Element | Description |
| --- | --- |
| `Money` (required) | Monetary amount of the declared value of the goods. |

### InventoryTimeSeries Element

This is a new element. It provides inventory data in time intervals to support the transfer of projected stock, safety stock, and target stock
levels generated by the buyer's planning system.

`InventoryTimeSeries` has one required attribute:

| Attribute | Description |
| --- | --- |
| `type` (required) | Type of inventory. Possible values:   * `targetStock` * `projectedStock` * `safetyStock` |

`InventoryTimeSeries` has one required element:

| Element | Description |
| --- | --- |
| `TimeSeriesDetails` (required) | Contains product replenishment information regarding the quantity of a product for a specific time period. |

### InvoiceDetailDiscount Element

The following optional element was added:

| Element | Description |
| --- | --- |
| `Distribution` | Represents the breakdown of one overall amount into sub-amounts. It is the the combination of a `Charge` against an `Accounting` element. |

### InvoiceDetailItem Element

The following optional attribute was added:

| Attribute | Description |
| --- | --- |
| `reason` | Specifies the reason for a line-item credit memo. The only possible value for reason is "return", which means the credit memo is for a return item. |

### ItemDetail Element

The following optional element was added:

| Element | Description |
| --- | --- |
| `AttachmentReference` | Reference to a remote attachment. |

### ItemDetailIndustry Element

The following optional attribute was added:

| Attribute | Description |
| --- | --- |
| `isConfigurableMaterial` | Set to "yes" to indicate that the item is defined as a configurable material and therefore has product characteristics. |

### InvoiceDetailLineSpecialHandling Element

The following optional element was added:

| Element | Description |
| --- | --- |
| `Distribution` | Represents the breakdown of one overall amount into sub-amounts. It is the the combination of a `Charge` against an `Accounting` element. |

### InvoiceDetailLineShipping Element

The following optional element was added:

| Element | Description |
| --- | --- |
| `Distribution` | Represents the breakdown of one overall amount into sub-amounts. It is the the combination of a `Charge` against an `Accounting` element. |

### ItemInfo Element

This is a new element. It references a specific item and its relationship with a Purchase Order, Invoice, and Ship Notice.

`ItemInfo` has one required attribute:

| Attribute | Description |
| --- | --- |
| `quantity` (required) | The quantity included in the document. |

`ItemInfo` has the following elements:

| Element | Description |
| --- | --- |
| `ItemID` | Provides unique identification of an item. |
| `Description` | Contains a string that describes something. |
| `Classification` | Contains the recommended commodity classification code for the line item. |
| `ManufacturerPartID` | ID with which the item's manufacturer identifies the item. |
| `ManufacturerName` | Name of the item's manufacturer. |
| `Country` | The country of origin of the product listed in the line item. |
| `SupplierBatchID` | Specifies the batch number for goods made or manufactured at the same time. |
| `ReferenceDocumentInfo` | Contains information about a referenced document. |
| `UnitOfMeasure` (required) | Describes how the product is packaged or shipped. It must conform with UN/CEFACT Unit of Measure Common Codes. |
| `Extrinsic` | Contains any additional information related to this object. |

### ItemOut Element

The following optional attributes were added:

| Attribute | Description |
| --- | --- |
| `isReturn` | Set to "yes" (true) to indicate that the item is a return item. |
| `returnAuthorizationNumber` | Return authorization number for a line item. |

### Origin Element

This is a new element. It describes the origin location for the goods.

`Origin` has the following elements:

| Element | Description |
| --- | --- |
| `Address` (required) | Contains the address of this location. |
| `DateInfo` | Contains dates applicable for this location. |
| `Extrinsic` | Contains any additional information related to this object. |

### OriginConfirmation Element

This is a new element. It specifies additional dates to the origin location specified in the referenced `TransportRequest`.

`OriginConfirmation` has the following elements:

| Element | Description |
| --- | --- |
| `DateInfo` | Contains date information associated with a document or item. |
| `Extrinsic` | Contains any additional information related to this object. |

### PaymentProposalRequest Element

The following optional child elements were added:

| Element | Description |
| --- | --- |
| `DiscountBasis` | See [DiscountBasis Element](#DiscountBasis). |
| `Tax` | Defines the tax for the payable. |
| `TaxAdjustment` | See [TaxAdjustment Element](#TaxAdjustment). |

### ProductActivityDetails Element

The following optional attribute was added:

| Attribute | Description |
| --- | --- |
| `status` | Indicates whether the material used in the planning process is "active", "inactive", or "deleted". |

The following optional child element was added:

| Element | Description |
| --- | --- |
| `InventoryTimeSeries` | See [InventoryTimeSeries Element](#InventoryTimeSeries). |

### ReceiptRequestHeader Element

The following optional child element was added:

| Element | Description |
| --- | --- |
| `ShipNoticeIDInfo` | Contains the Delivery Note of the buyer's goods receipt, which defaults to the supplier's ship notice ID. |

### RegistrationNumber Element

This is a new element. It contains the registration number of an entity, such as a vehicle.

### Route Element

The element was updated to contain an optional PCDATA string or a `Contact` element.

The followed attributes were updated or added:

| Attribute | Description |
| --- | --- |
| `method` (required) | Qualifier identifying the transportation type code. Possible values are:   * `ship` - transportation by boat (ocean). * `rail` - transportation by rail. * `motor` - transportation by land motor craft   (common carrier). * `air` - transportation by flight. * `mail` - provided for practical reasons,   despite the fact that mail is not a genuine mode of   transport. In many countries, the value of merchandise   exported and imported by mail is considerable, but the   exporter or importer concerned would be unable to state by   which mode postal items had passed the national border. * `multimodal` - provided for practical   reasons, despite the fact that multimodal transport is not a   genuine mode of transport. It can be used when goods are   carried by at least two different modes from a place at   which the goods are taken in charge by a transport operator   to a place designated for delivery, on the basis of one   transport contract. (Operations of pick-up and delivery of   goods carried out in the performance of a unimodal   transport, as defined in such a contract, shall not be   considered as multimodal transport.) * `fixedTransport` - applies to installations   for continuous transport such as pipelines, ropeways and   electric power lines. * `inlandWater` - Used only in such cases where   the application of waterborne transport is reported   separately than maritime transport. * `unknown` - can be used when the mode is not   known or when information on it is not available at the time   of issuing the document concerned. |
| `means` | Particular vessel, vehicle or other device used for transport of goods. The value of means depends on the value of method.  When the value of `method` is "ship", the possible values of `means` are:   * `cargoVessel` - Vessel designed to carry   general cargo. * `unitCarrier` - Vessel designed to carry unit   loads. * `bulkCarrier` - Vessel designed to carry bulk   cargo. * `tanker` - Vessel solely equipped with tanks   to carry cargo. * `liquefiedGasTanker` - Tanker designed to   carry liquefied gas. * `otherSpecialTanker` - Tanker designed to   carry other special liquids. * `cargoAndPassengerVessel` - Vessel designed   to carry cargo and passengers. * `otherVessel` - Sea-going vessel, not   otherwise specified. * `fishingBoat` - Vessel designed for   fishing. * `floatingStructure` - Any floating   structure.   When the value of `method` is "rail", the possible values of `means` are:   * `train` - One or more rail wagons pulled or   pushed by one or more locomotive units, or self-propelled,   that move over rail tracks. * `freightTrain` - Train for carrying   freight.   When the value of `method` is "motor", the possible values of `means` are:   * `truck` - Automotive vehicle designed for   hauling loads. * `tractor` - Automotive vehicle with an engine   designed for pulling. * `van` - Closed automotive vehicle designed   for carrying freight. * `carCarrier` - Automotive vehicle designed   for carrying motorcars. * `shovelLoader` - Automotive vehicle designed   for shovelling sand and other bulk material. * `straddleCarrier` - Automotive vehicle   designed for lifting and transporting containers. * `mobileCrane` - Automotive vehicle with cargo   crane. * `bus` - Automotive vehicle designed for   carrying more than 8 passengers including the driver. * `car` - Automotive vehicle designed to carry   a small number of passengers. * `taxi` - Automotive vehicle licensed to ply   for hire.   When the value of `method` is "air, the values for `means` are specified in the IATA (International Air Transport Association) publication Standard Schedules Information Manual (SSIM) under the section "ATA/IATA Aircraft Types". The referenced codes cover all aircraft that are flown, or are soon to be flown, for commercial scheduled or chartered services only, or have been announced by the manufacturer and for which airline orders have been placed.  When the value of `method` is "multimodal", this means there are multiple segments, and each may have different mode and means. Therefore, the only possible value for `means` is "unknown".  When the value of `method` is "fixedTransport", the possible values of `means` are:   * `unknown` - Fixed transport installation of   unknown type. * `pipeline` - A line of one or more pipes for   continuous transport of liquid or gas commodity. * `powerline` - A line of one or more cables or   wires for continuous transport of electricity.   When the value of `method` is "inlandWater", the possible values of `means` are:   * `unknownVessel` - Vessel of unknown   type. * `motorFreighter` - Motorized vessel designed   for carrying general cargo. * `motorTanker` - Motorized vessel designed for   carrying liquid cargo. * `containerVessel` - Vessel designed for   carrying containers. * `gasTanker` - Vessel with tanks designed for   carrying gas. * `tug` - Vessel designed to push or pull   another vessel. * `barge` - Lighter designed for carrying   general cargo. * `pushTow` - Vessel designed for   pushing/towing, facilitating the movement of one or more   cargo barges. * `fishingBoat` - Vessel designed for   fishing. * `bunkerShip` - Vessel designed for carrying   and delivering bunkers.   When the value of `method` is either "mail" or "unknown", there are no specific values of `means`defined. |

### ShippingAmount Element

The following optional element was added:

| Element | Description |
| --- | --- |
| `Distribution` | Represents the breakdown of one overall amount into sub-amounts. It is the the combination of a `Charge` against an `Accounting` element. |

### SpecialHandlingAmount Element

The following optional element was added:

| Element | Description |
| --- | --- |
| `Distribution` | Represents the breakdown of one overall amount into sub-amounts. It is the the combination of a `Charge` against an `Accounting` element. |

### Tax Element

The following optional element was added:

| Element | Description |
| --- | --- |
| `Distribution` | Represents the breakdown of one overall amount into sub-amounts. It is the the combination of a `Charge` against an `Accounting` element. |

### TaxAdjustment Element

This is a new element. It defines the tax adjustment for the payable.

`TaxAdjustment` has the following elements:

| Element | Description |
| --- | --- |
| `Money` (required) | Describes the total tax adjustment given on the payable. |
| `TaxAdjustmentDetail` | See [TaxAdjustmentDetail Element](#TaxAdjustmentDetail). |

### TaxAdjustmentDetail Element

This is a new element. It defines the details of adjustments given over category and region.

`TaxAdjustmentDetail` has the following attributes:

| Attribute | Description |
| --- | --- |
| `category` (required) | String describing the tax adjustment category. |
| `region` | String describing the region where the tax adjustment occurred. |

`TaxAdjustmentDetail` has the following element:

| Element | Description |
| --- | --- |
| `Money` (required) | Monetary amount of tax adjustment given on the payable for a particular category or region. |

### TradeItem Element

A new optional `lineNumber` attribute was added to keep track of line items.

The `GrossAmount` child element is now called `OriginalAmount`. The `NetAmount` child element is now called `Amount`.

### TradeRequestHeader Element

Several attribute names were changed:

* `tradeReferenceNumber` is now called `tradeID`.
* `tradeCreatedDate` is now called `tradeDate`.
* `projectedSettlementDate` is now called `settlementDate`.

### TradeRequestSummary Element

The `GrossAmount` child element is now called `OriginalAmount`. The `NetAmount` child element is now called `Amount`.

The following optional element was added:

| Element | Description |
| --- | --- |
| `CreditApplied` | The total amount of all credit memos in the trade. |

### TransportCondition Element

This is a new element. It contains required conditions for the transport.

`TransportCondition` has the following elements:

| Element | Description |
| --- | --- |
| `Priority` | Priority indicator representing the "speed" of the service. The highest priority is an express service, while the lowest one is a mail service. |
| `Extrinsic` | Contains any additional information related to this object. |

### TransportConfirmation Element

This is a new element. It contains a message sent from a logistics provider to an interested party
(for example, the party requesting the transport), containing updates on the process for a transportation
request.

`TransportConfirmation` has the following elements:

| Element | Description |
| --- | --- |
| `TransportConfirmationHeader` | See [TransportConfirmationHeader ELement](#TransportConfirmationHeader). |
| `TransportReference` | See [TransportReference Element](#TransportReference). |
| `ConsignmentConfirmation` (required) | See [ConsignmentConfirmation Element](#ConsignmentConfirmation). |

### TransportConfirmationHeader Element

This is a new element. It contains common information that applies to the whole confirmation message.

`TransportConfirmationHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `operation` | Operation to perform. Currently, only "new" (the default) is supported, which creates a new confirmation. |
| `confirmationID` | User-supplied identifier for this confirmation. |
| `confirmationDate` | User-supplied date for this confirmation. |

`TransportConfirmationHeader` has the following elements:

| Element | Description |
| --- | --- |
| `TransportPartner` | See [TransportPartner Element](#TransportPartner). |
| `Extrinsic` | Contains any additional information related to this object. |

### TransportEquipment Element

This is a new element. It defines a piece of transport equipment needed for this consignment.

`TransportEquipment` has the following attributes:

| Attribute | Description |
| --- | --- |
| `equipmentID` (required) | The identifier of this equipment. Must be unique for this consignment. |
| `type` | Type of this equipment. Possible values:   * `dimeCoatedTank` - A tank coated with dime. * `epoxyCoatedTank` - A tank coated with epoxy. * `pressurizedTank` - A tank capable of holding pressurized goods. * `refrigeratedTank` - A tank capable of keeping goods refrigerated. * `stainlessSteelTank` - A tank made of stainless steel. * `nonWorking40ftReeferContainer` - A 40 foot refrigerated container   that is not actively controlling temperature of the product. * `euroPallet` - 80 x 120 cm. * `scandinavianPallet` - 100 x 120 cm. * `trailer` - Non self-propelled vehicle designed for the carriage   of cargo so that it can be towed by a motor vehicle. * `nonWorking20ftReeferContainer` - A 20 foot refrigerated container   that is not actively controlling temperature of the product. * `nonWorking30ftReeferContainer` - A 30 foot refrigerated container   that is not actively controlling temperature of the product. * `nonWorking40ftReeferContainer` - A 40 foot refrigerated container   that is not actively controlling temperature of the product. * `exchangeablePallet` - Standard pallet exchangeable following   international convention. * `semiTrailer` - Non self-propelled vehicle without front wheels   designed for the carriage of cargo and provided with a kingpin. * `tankContainer20ft` - A tank container with a length of 20 feet. * `tankContainer30ft` - A tank container with a length of 30 feet. * `tankContainer40ft` - A tank container with a length of 40 feet. * `refrigeratedTank20ft` - A refrigerated tank with a length of 20 feet. * `refrigeratedTank30ft` - A refrigerated tank with a length of 30 feet. * `refrigeratedTank40ft` - A refrigerated tank with a length of 40 feet. * `temperatureControllerContainer20ft` - Temperature-controlled   container measuring 20 feet. * `temperatureControllerContainer30ft` - -Temperature-controlled   container measuring 30 feet. * `temperatureControllerContainer40ft` - Temperature-controlled   container measuring 40 feet. * `totebin` - A steel open top unit of about 1,5 \* 1,5 \* 2,5 meters   for road transport of bulk cargo. * `dualTrailers` - Two trailers linked together one behind another and   pulled by one tractor. |
| `numberOfEquipments` | The number of equipment units available. |
| `providedBy` | Indicates who provides this equipment. Possible values:   * `sender` * `receiver` * `carrier` * `other` |
| `status` | Indicates the status of the equipment after loading this consignment. Possible values:   * `full` * `empty` |

`TransportEquipment` has the following elements:

| Element | Description |
| --- | --- |
| `VehicleRegistration` | See [VehicleRegistration Element](#VehicleRegistration). |
| `Extrinsic` | Contains any additional information related to this object. |

### TransportIDInfo Element

This is a new element. It defines the ID of a transport request known to the system
of the party that created it.

`TransportIDInfo` has the following optional attributes:

| Attribute | Description |
| --- | --- |
| `requestID` | The ID of a transport request known to the system of the party that created it. |
| `requestDate` | The date and time the transport request was created. |

`TransportIDInfo` has the following element:

| Element | Description |
| --- | --- |
| `IdReference` | Defines an ID reference. The identifier/domain pair should be unique within each trading partner relationship (a buying organization and a supplier). |

### TransportPackage Element

This is a new element. It describes the material items contained within a package.

`TransportPackage` has the following elements:

| Element | Description |
| --- | --- |
| `Packaging` | Contains details about the packaging of this line item. |
| `ItemInfo` | See [ItemInfo Element](#ItemInfo). |

### TransportPartner Element

This is a new element. It represents a party, or company, of the transport service.

`TransportPartner` has the following attribute:

| Attribute | Description |
| --- | --- |
| `role` (required) | The role of the transport partner. Possible values:   * `shipFrom` - The originating party for this consignment. * `shipTo` - The destination party for this consignment. * `carrier` - The party in charge of carrying the goods. |

`TransportPartner` has the following elements:

| Element | Description |
| --- | --- |
| `Contact` (required) | Supplies additional Address or Location information for the requesting company. |
| `Extrinsic` | Contains any additional information related to this object. |

### TransportPlacement Element

This is a new element. It describes how the packages are placed into transport equipment.

`TransportPlacement` has the following attributes:

| Attribute | Description |
| --- | --- |
| `equipmentID` (required) | ID of the transport equipment. |
| `numberOfPackages` (required) | The quantity of packages placed into the equipment. |

### TransportReference Element

This is a new element. It defines a reference to an earlier `TransportRequest` document.

`TransportReference` has the following optional attributes:

| Attribute | Description |
| --- | --- |
| `requestID` | The ID of a transport request known to the system of the party that created the `TransportRequest`. |
| `requestDate` | The date and time the transport request was created. |

`TransportReference` has the following element:

| Element | Description |
| --- | --- |
| `DocumentReference` (required) | References an earlier document. |

### TransportRequest Element

This is a new element. It is a request made from one originating party to a logistics provider to
arrange delivery for consignments.

`TransportRequest` has the following elements:

| Element | Description |
| --- | --- |
| `TransportRequestHeader` | See [TranportRequestHeader Element](#TransportRequestHeader) |
| `Consignment` | See [Consignment Element](#Consignment) |
| `TransportSummary` | See [TransportSummary Element](#TransportSummary) |

### TransportRequestHeader Element

This is a new element. It is the header element for the transport request and
contains common information for all consignments.

`TransportRequestHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `operation` | Operation to perform. Currently, only "new" (the default) is supported, which creates a new transport request. |
| `requestID` | A user-supplied identifier for this transport request. |
| `requestDate` | User-supplied date and time when this document was created. |

`TransportRequestHeader` has the following elements:

| Element | Description |
| --- | --- |
| `TransportPartner` | See [TranportPartner Element](#TransportPartner). |
| `Comments` | Contains comments associated with this object. |
| `Extrinsic` | Contains any additional information related to this object. |

### TransportRequirements Element

This is a new element. It contains information about the transport service that is requested from the
logistics provider.

`TransportRequirements` has the following elements:

| Element | Description |
| --- | --- |
| `Hazard` | Provides a textual description and optional codes about hazards inherent in both an item and an overall shipment. |
| `TransportTemperature` | Contains a temperature or temperature range that must be observed during transportation. |
| `Classification` | Classification of the goods carried. |
| `Extrinsic` | Contains any additional information related to this object. |

### TransportSummary Element

This is a new element. It contains a summary of the data contained in all the consignments of this document.

`TransportSummary` has the following attribute:

| Attribute | Description |
| --- | --- |
| `numberOfPackages` (required) | Total number of physical packages in this transport request. |

`TransportSummary` has the following elements:

| Element | Description |
| --- | --- |
| `FreightChargesAmount` | See [FreightChargesAmount Element](#FreightChargesAmount). |
| `SubtotalAmount` | Taxable amount for the freight charges. |
| `InsuranceValue` | See [InsuranceValue Element](#InsuranceValue). |
| `Dimension` | Total dimensions for the packages of all consignments. |
| `Extrinsic` | Contains any additional information related to this object. |

### TransportTemperature Element

This is a new element. It contains a temperature or temperature range that must be observed during
transportation.

`TransportTemperature` has the following optional attributes:

| Attribute | Description |
| --- | --- |
| `temperature` | The temperature to be observed if a range is not specified. |
| `maximum` | The upper limit to observe in a range. |
| `minimum` | The lower limit to observe in a range. |

`TransportTemperature` has the following element:

| Element | Description |
| --- | --- |
| `UnitOfMeasure` (required) | The unit of measure for the temperature. For example, "CEL" (degree Celsius), "FAH" (degree Fahrenheit), "KEL" (kelvin), or "A48" (degree Rankin). |

### VehicleRegistration Element

This is a new element. It contains the registration number of a vehicle and its country.

`VehicleRegistration` has the following elements:

| Element | Description |
| --- | --- |
| `RegistrationNumber` (required) | The vehicle registration number can be one of the following numbers:   * License plate for cars and trucks. * Registration number for airplanes. * IMO number for ships. |
| `Country` | The country for the registration number. |

## 1.2.029

---

### ASNInstruction Element

This is a new element. It indicates whether a ship notice is allowed for this order or line item, regardless of the default business
rules configured in the network hub.

`ASNInstruction` has the following attribute:

| Attribute | Description |
| --- | --- |
| `value` | Value indicating whether a ship notice is allowed. Possible values are "`allowed`" or "`notAllowed`". |

`ASNInstruction` has the following elements:

| Element | Description |
| --- | --- |
| `Lower` | See [Lower Element](#Lower). |
| `Upper` | See [Upper Element](#Upper). |

### Classification Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `code` | Identification code for a classification. |

The `domain` attribute for `Classification` can be "`MaterialGroup`", which refers to a grouping of materials and
services according to their characteristics in SAP ERP.

### ComponentConsumptionDetails Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `type` | Type of inventory movement that could cause the suppliers to not consume the material. Possible values:   * `blocked` - this inventory is not assigned a value and cannot be consumed. * `qualityRestricted` - this inventory is not qualified for unrestricted use and cannot be consumed in production. * `scrapped` - this inventory is out of date or material has been destroyed during logistics operation. |

The following element was added:

| Element | Description |
| --- | --- |
| `ReferenceDocumentInfo` | See [ReferenceDocumentInfo Element](#ReferenceDocumentInfo). |

### ConfirmationHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `IdReference` | Defines an ID reference. The identifier/domain pair should be unique within each trading partner relationship (a buying organization and a supplier). |

### ContractIDInfo Element

This is a new element. It contains the ID of a contract known to the source buyer system.

`ContractIDInfo` has the following attributes:

| Attribute | Description |
| --- | --- |
| `contractID` (required) | The ID of a contract known to the source buyer system. |
| `contractDate` | The date and time the contract request was created or updated. |
| `contractType` | The type of the contract being referenced, for example `scheduling_agreement`. |

`ContractIDInfo` has the following element:

| Element | Description |
| --- | --- |
| `IdReference` | Defines an ID reference. The identifier/domain pair should be unique within each trading partner relationship (a buying organization and a supplier). |

### ContractItemIn Element

This is a new element. It represents a contract line item to be sent to an external system.

`ContractItemIn` has the following elements:

| Element | Description |
| --- | --- |
| `MaxAmount` | Maximum amount. |
| `MinAmount` | Minimum amount. |
| `MaxReleaseAmount` | Contractual maximum amount per release of this Master Agreement. |
| `MinReleaseAmount` | Contractual minimum amount per release of this Master Agreement. |
| `MaxQuantity` | Maximum quantity. |
| `MinQuantity` | Minimum quantity. |
| `MaxReleaseQuantity` | Contractual maximum quantity per release of a contract. |
| `MinReleaseQuantity` | Contractual minimum quantity per release of a contract. |
| `TermsOfDelivery` | Optional shipping terms (incoTerms) as defined by the International Chamber of Commerce. |
| `ItemIn` | Represents a line item to send to a buyer. |
| `ReferenceDocumentInfo` | Optional reference document info (for example, the requisition or RFQ in the external system) for this line item. |

### ContractItemStatus Element

This is a new element. It represents a line item in a contract status update request.

`ContractItemStatus` has the following elements:

| Element | Description |
| --- | --- |
| `ItemStatus` | Detailed status information about the line item. |
| `IdReference` | Reference to a line item of the contract in the external system.. |
| `Comments` | Contains comments associated with this object. |

### ContractRequest Element

This is a new element. It contains the definition of a contract sent from the buyer to an external buyer system.

`ContractRequest` has the following elements:

| Element | Description |
| --- | --- |
| `ContractRequestHeader` | See [ContractRequestHeader Element](#ContractRequestHeader). |
| `ContractItemIn` | See [ContractItemIn Element](#ContractItemIn). |

### ContractRequestHeader Element

This is a new element. It represents the header of a contract.

`ContractRequestHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `contractID` (required) | Contract ID in the source buyer system for this request. |
| `type` | Identifies whether the contract is value-based or quantity-based. Possible values are "`value`" or "`quantity`". |
| `createDate` | The date and time the contract was created or published. |
| `agreementDate` | The date and time the contract was created. This is different from the contract's effective date and expiry date. |
| `effectiveDate` (required) | Date the contract is available for ordering or releases. |
| `expirationDate` | Date the contract is no longer available. |
| `xml:lang` (required) | The language or locale in which the `ContractRequest` content is written. |
| `operation` | The operational mode of the `ContractRequest`. Possible values:   * `new` - Identifies a new contract transaction. * `update` - Identifies an update to an existing transaction. The `DocumentInfo` element   can be used to indicate the contract in the external system. * `delete` - Cancels an existing contract. The delete request should be an exact duplicate of the original request. |

`ContractRequestHeader` has the following elements:

| Element | Description |
| --- | --- |
| `LegalEntity` | Legal entity defined in the external system. |
| `OrganizationID` | Organization ID. |
| `OrganizationalUnit` | Purchase Unit or Purchase group defined in the external system. |
| `PaymentTerm` | Defines a payment term in an invoice or order. |
| `QuoteRequestReference` | Optional request ID and request date if the contract references a `QuoteRequest` originated from the external system. |
| `MaxAmount` | Maximum amount. |
| `MinAmount` | Minimum amount. |
| `MaxReleaseAmount` | Contractual maximum amount per release of this Master Agreement. |
| `MinReleaseAmount` | Contractual minimum amount per release of this Master Agreement. |
| `Contact` | Supplies additional Address or Location information for the requesting company. |
| `Comments` | Contains comments associated with this object. |
| `DocumentInfo` | ID of a document known to the system. |
| `ParentContractInfo` | See [ParentContractInfo Element](#ParentContractInfo). |
| `TermsOfDelivery` | Optional shipping terms (incoTerms) as defined by the International Chamber of Commerce. |
| `Extrinsic` | Contains any additional information about the contract header. |

### ContractStatus Element

This is a new element. It contains item-level status updates for a contract.

`ContractStatus` has the following attribute:

| Attribute | Description |
| --- | --- |
| `type` | Type of the contract status, for example, "`created`". |

`ContractStatus` has the following elements:

| Element | Description |
| --- | --- |
| `ContractIDInfo` | See [ContractIDInfo Element](#ContractIDInfo). |
| `ContractItemStatus` | See [ContractItemStatus Element](#ContractItemStatus). |
| `Comments` | Contains comments associated with this object. |
| `Extrinsic` | Contains any additional information related to this object. |

### ContractStatusUpdateRequest Element

This is a new element. It contains the status update for a contract, including whether the contract was created or updated successfully.

`ContractStatusUpdateRequest` has the following elements:

| Element | Description |
| --- | --- |
| `Status` | Status of a `Response` or `Message`. |
| `ContractStatus` | See [ContractStatus Element](#ContractStatus). |
| `Extrinsic` | Contains any additional information related to this object. |

### ControlKeys Element

This is a new element. It provides elements that allow you to override default business rules for order confirmations, ship notices, and invoices.

`ControlKeys` has the following elements:

| Element | Description |
| --- | --- |
| `OCInstruction` | See [OCInstruction Element](#OCInstruction). |
| `ASNInstruction` | See [ASNInstruction Element](#ASNInstruction). |
| `InvoiceInstruction` | See [InvoiceInstruction Element](#InvoiceInstruction). |

### CopyRequest Element

The `CopyRequest@processingMode` attribute supports an additional value, `copy`, which indicates
that the document is a copy of the original document.

### DateInfo Element

This is a new element. It contains date information associated with a document or item.

`DateInfo` has the following attributes:

| Attribute | Description |
| --- | --- |
| `type` (required) | Date type. Possible values:   * `expectedDeliveryDate` - Expected delivery date for the material to be received at the partner location. * `expectedShipmentDate` - Expected ship date for the material from the supplier's location. * `productionStartDate` - Production start date. * `productionFinishDate` - Production finish date. |
| `date` (required) | Date value. |

`DateInfo` has the following element:

| Element | Description |
| --- | --- |
| `Extrinsic` | Contains any additional information about the contract header. |

### DaysPaidEarly Element

This is a new element. It is the number of days that the supplier is paid early.

### DocumentStatus Element

The following element was added:

| Element | Description |
| --- | --- |
| `ItemStatus` | See [ItemStatus Element](#ItemStatus). |

### Fee Element

This is a new element. It represents different types of individual fees. It has a required `Money` element.

The optional `type` attribute for `Fee` can have the following values:

* `serviceProvider`
* `community`
* `funder`

### FeeAmount Element

The following element was added:

| Element | Description |
| --- | --- |
| `Fee` | See [Fee Element](#Fee). |

### InvoiceDetailRequestHeader Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `isERS` | Indicates whether the order is flagged for Evaluated Receipt Settlement (ERS) at the header level. The only possible value is `"yes"` (true). If not specified, an invoice can be created for all line items. |

The following element was added:

| Element | Description |
| --- | --- |
| `IdReference` | Defines an ID reference. The identifier/domain pair should be unique within each trading partner relationship (a buying organization and a supplier). |

### InvoiceInstruction Element

This is a new element. It indicates whether an invoice is allowed for this order or line item,
regardless of the default business rules configured in the network hub.

`InvoiceInstruction` has the following attribute:

| Attribute | Description |
| --- | --- |
| `value` (required) | Value indicating whether an order or line item is flagged for Evaluated Receipt Settlement (ERS). Possible values are "isERS" or "isNotERS". |

### ItemIn Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `itemClassification` | Specifies whether the current line item is material or service. Possible values:   * `material` * `service` |

### ItemOut Element

The following attributes were added or updated:

| Attribute | Description |
| --- | --- |
| `requestedShipmentDate` | The ship date requested by the buyer for the item. |
| `itemCategory` | In addition to "`subcontract`" and "`consignment`" values, a new "`thirdParty`" value is supported. It refers to a vendor from which a material is ordered. |

The following element was added:

| Element | Description |
| --- | --- |
| `ControlKeys` | See [ControlKeys Element](#ControlKeys). |

### ItemOutIndustry Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `planningType` | Specifies the planning strategy. Possible values:   * `MTO` - Make to Order * `MTS` - Make to Stock |

The following elements were added:

| Element | Description |
| --- | --- |
| `Priority` | See [Priority Element](#Priority). |
| `ReferenceDocumentInfo` | See [ReferenceDocumentInfo Element](#ReferenceDocumentInfo). |

### ItemStatus Element

This is a new element. It contains detailed information about an item when a buyer sends a `StatusUpdateRequest` in response to a `ConfirmationRequest`.
For example, it could contain information from a back-end procurement system.

`ItemStatus` has the following attributes:

| Attribute | Description |
| --- | --- |
| `type` (required) | Specifies the item status. Possible values:   * `rejected` - The item was rejected. * `accepted` - The item was accepted. |
| `code` | Optional code for the item status from the back-end system. |

`ItemStatus` has the following elements:

| Element | Description |
| --- | --- |
| `ReferenceDocumentInfo` | See [ReferenceDocumentInfo Element](#ReferenceDocumentInfo). |
| `Comments` | Contains comments associated with this object. |

### LegalEntity Element

This is a new element. It identifies a legal entity in the external system, and it has the following element:

| Element | Description |
| --- | --- |
| `IdReference` | Defines an ID reference. The identifier/domain pair should be unique within each trading partner relationship (a buying organization and a supplier). |

### Lower Element

This is a new element. It specifies tolerances that define a lower limit.

`Lower` has the following element:

| Element | Description |
| --- | --- |
| `Tolerances` | Tolerances for price, quantity, delivery date. |

### MaxReleaseQuantity Element

This is a new element. It represents the contractual maximum quantity per release of a contract.

### MinReleaseQuantity Element

This is a new element. It represents the contractual minimum quantity per release of a contract.

### ModificationDetail Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `code` | Service code that identifies the allowance or charge. |

### OCInstruction Element

This is a new element. It indicates whether an order confirmation is allowed for this order or line item, regardless of the default business rules configured in the network hub.

`OCInstruction` has the following attribute:

| Attribute | Description |
| --- | --- |
| `value` (required) | Value indicating whether an order confirmation is allowed. Possible values are "`allowed`", "`notAllowed`", or "`requiredBeforeASN`". |

`OCInstruction` has the following elements:

| Element | Description |
| --- | --- |
| `Lower` | See [Lower Element](#Lower). |
| `Upper` | See [Upper Element](#Upper). |

### OrderRequestHeader Element

The following elements were added:

| Element | Description |
| --- | --- |
| `ControlKeys` | See [ControlKeys Element](#ControlKeys). |
| `OrderRequestHeaderIndustry` | See [OrderRequestHeaderIndustry Element](#OrderRequestHeaderIndustry). |

### OrderRequestHeaderIndustry Element

This is a new element. It contains industry-specific information for an order.

`OrderRequestHeaderIndustry` has the following elements:

| Element | Description |
| --- | --- |
| `ReferenceDocumentInfo` | See [ReferenceDocumentInfo Element](#ReferenceDocumentInfo). |
| `Priority` | See [Priority Element](#Priority). |

### OrganizationalUnit Element

This is a new element. It identifies the Purchase Unit or Purchase group in the external system, and it has the following element:

| Element | Description |
| --- | --- |
| `IdReference` | Organizational unit ID. The (identifier, domain) pair should be unique. |

### ParentContractInfo Element

This is a new element. It identifies the parent contract ID if the current contract is part of a hierarchy. It has the following element:

| Element | Description |
| --- | --- |
| `DocumentInfo` | ID of a document known to the system. |

### Priority Element

This is a new element. It indicates the priority of orders for the suppliers. It has a `Description` element, which describes the
priority. The `level` attribute specifies the priority level, an integer from 1 to 5.

### ProductActivityDetails Element

The following element was added:

| Element | Description |
| --- | --- |
| `SalesReport` | See [SalesReport Element](#SalesReport). |

### ProductReplenishmentDetails Element

This is a new element. It contains product replenishment information for the product.

`ProductReplishmentDetails` has the following elements:

| Element | Description |
| --- | --- |
| `ItemID` | A unique identification of a component item in the supplier back-end system or the buyer back-end system. |
| `Description` | Textual description of the component. |
| `LeadTime` | Optional number of days needed for the buyer to receive the product. |
| `Batch` | An element carrying a batch information for material or goods produced in a single manufacturing run, such as buyer/supplier batch ID, production date, and property valuation. |
| `Contact` | The Contact information for the supplier. You can specify more than one `Contact` element. This is an optional field. |
| `Inventory` | Inventory that is in the possession of the buyer and is owned and managed by the buyer. |
| `ConsignmentInventory` | Inventory that is in the possession of the buyer but is owned by the supplier. |
| `ReplenishmentTimeSeries` | The product replenishment quantity of a product for a specific time period. |
| `Comments` | Contains comments associated with this object. |
| `Extrinsic` | Contains any additional information related to this object. |

### ProductReplenishmentHeader Element

This is a new element. It contains the product replenishment header. It has one required attribute, `messageID`,
and an optional `creationDate` attribute.

### ProductReplenishmentMessage Element

This is a new element. It communicates the following types of messages to buyers:

* Manufacturing and planning-related information, including the processes for outsourced manufacturing
* Inventory details, including the processes for outsourced manufacturing and supplier-managed inventory
* Forecast confirmations, including critical information about the supplier's constraints

`ProductReplenishmentMessage` has the following elements:

| Element | Description |
| --- | --- |
| `ProductReplenishmentHeader` | See [ProductReplenishmentHeader Element](#ProductReplenishmentHeader). |
| `ProductReplenishmentDetails` | See [ProductReplenishmentDetails Element](#ProductReplenishmentDetails). |
| `Extrinsic` | Contains any additional information related to this object. |

### ReferenceDocumentInfo Element

This is a new element. It contains information about a referenced document.

`ReferenceDocumentInfo` has the following optional attributes:

| Attribute | Description |
| --- | --- |
| `lineNumber` | Line number of an item in the referenced document. |
| `status` | Status used to refer to the referenced document. Possible values:   * `created` * `released` * `open` * `completed` * `closed` * `cancelled` |

`ReferenceDocumentInfo` has the following elements:

| Element | Description |
| --- | --- |
| `DocumentInfo | DocumentReference` | `DocumentInfo` provides information about a document, such as ID, type, and date. Possible `type` values are:  * `salesOrder` - refers to sales order triggering the PO. * `customerOrder` - refers to the customer order maintained in sales order. * `freightOrder` - refers to order for transportation. * `productionOrder` - refers to order that specifies which material is to be produced,   where it is to be produced, which operations are required to do this and on which date production   is to take place. It also defines how the order costs are to be settled.   `DocumentReference` references an earlier document (for example, `OrderRequest`). |
| `DateInfo` | See [DateInfo Element](#DateInfo). |
| `Contact` | Contact information for the supplier. You can specify more than one `Contact` element. This is an optional field. |
| `Extrinsic` | Contains any additional information related to this object. |

### ReplenishmentTimeSeries Element

This is a new element. It contains information about the replenishment time series.

`ReplenishmentTimeSeries` has one required `type`
attribute, which can be one of the following values:

* `manufacturingOrder`
* `purchaseOrder`
* `supplierForecast`
* `shipment`
* `projectedStock`
* `firmReceipt`
* `plannedReceipt`
* `forecastConfirmation`

`ReplenishmentTimeSeries` has the following element:

| Element | Description |
| --- | --- |
| `TimeSeriesDetails` | See [TimeSeriesDetails Element](#TimeSeriesDetails). |

### ReturnQuantity Element

This is a new element. It contains the quantity from a sales report that was returned. It has
a `UnitOfMeasure` element and one required attribute, `quantity`.

### SalesQuantity Element

This is a new element. It contains the quantity of an item that was sold. It has
a `UnitOfMeasure` element and one required attribute, `quantity`.

### SalesReport Element

This is a new element. It contains information about a sales report at the item level.

`SalesReport` has the following elements:

| Element | Description |
| --- | --- |
| `Period` | Item sales start and end date. |
| `SalesQuantity` | See [SalesQuantity Element](#SalesQuantity). |
| `ReturnQuantity` | See [ReturnQuantity Element](#ReturnQuantity). |
| `Total` | Sales report total for the line item. |
| `PromotionVariantID` | Specifies a specific ID if only one or some variants of an article are promoted. Product variant is a specific code that specifies the characteristic of an product (color, shape, and so on). |
| `Comments` | Contains comments associated with this object. |

### ScheduleLine Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `requestedShipmentDate` | The ship date requested by the buyer for the schedule line. |

### ServiceEntryRequestHeader Element

The following element was added:

| Element | Description |
| --- | --- |
| `IdReference` | Defines an ID reference. The identifier/domain pair should be unique within each trading partner relationship (a buying organization and a supplier). |

### ShipmentIdentifier Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `trackingURL` | Carrier URL that can be used to track the shipment in conjunction with the tracking number. |

### TimeSeriesDetails Element

This is a new element. It contains product replenishment information regarding the quantity of a product for a specific time period.

`TimeSeriesDetails` has the following elements:

| Element | Description |
| --- | --- |
| `Period` | The start date and end date for the forecast response. |
| `TimeSeriesQuantity` | See [TimeSeriesQuantity Element](#TimeSeriesQuantity). |
| `UpsideQuantity` | See [UpsideQuantity Element](#UpsideQuantity). |
| `IdReference` | Defines an ID reference. The identifier/domain pair should be unique within each trading partner relationship (a buying organization and a supplier). |
| `Extrinsic` | Contains any additional information related to this object. |

### TimeSeriesQuantity Element

This is a new element. It contains the quantity associated with the given type of replenishment time series. It has
a `UnitOfMeasure` element and one required attribute, `quantity`.

### TimeTolerance Element

This is a new element. It defines a certain amount of time used to check if a concrete
delivery date is within the tolerance regarding the requested delivery date.

`TimeTolerance` has the following attributes:

| Attribute | Description |
| --- | --- |
| `limit` | Specifies the time tolerance limit. |
| `type` | Specifies the type of time limit. Possible values:   * `minutes` * `hours` * `days` (default) * `weeks` |

### Tolerances Element

The following element was added:

| Element | Description |
| --- | --- |
| `TimeTolerance` | See [TimeTolerance Element](#TimeTolerance). |

### TradeItem Element

This is a new element. It contains trading information about a payment proposal or a credit memo.

`TradeItem` has the following attribute:

| Attribute | Description |
| --- | --- |
| `paymentProposalID` (required) | Original payment proposal number. |

`TradeItem` has the following elements:

| Element | Description |
| --- | --- |
| `PayableInfo` | A reference to the payable document, such as an invoice, order, or master agreement. |
| `GrossAmount` | Original amount for this payable. This amount is negative for credit memo items. |
| `AdjustmentAmount` | Adjustment amount applied to the `GrossAmount`. The only adjustment that can be applied is a credit memo, which has an `AdditionalDeduction` with `type` "creditMemoApplied". |
| `DaysPaidEarly` | See [DaysPaidEarly Element](#DaysPaidEarly). |
| `NetAmount` | Net value of this trade item. This amount is always zero for credit memo items. The value should satisfy the following equation:  `NetAmount = GrossAmount - FeeAmount - AdjustmentAmount` |
| `FeeAmount` | Contains various fees that occur during a trade, for example, service provider fee, funder fee, and community fee. Can contain the following `Fee` types: `serviceProvider`, `community`, `funder`. |
| `Extrinsic` | Contains any additional information related to this object. |

### TradeRequest Element

This is a new element. It is a request to create or update one or more supply chain finance `TradeItem` objects.

`TradeRequest` documents are associated with `PaymentProposalRequest` documents that are traded on the trading
platform of the supply chain financing provider. Payment proposals can be traded automatically or manually as indicated by the
`autoTrade` attribute of the `TradeRequestHeader`. `TradeRequest` documents travel from the supply
chain financing provider to the network hub. Updated `PaymentProposalRequest` documents are then generated by the network
hub and sent to the buyer and supplier as needed.

`TradeRequest` has the following elements:

| Element | Description |
| --- | --- |
| `TradeRequestHeader` | See [TradeRequestHeader Element](#TradeRequestHeader). |
| `TradeRequestSummary` | See [TradeRequestSummary Element](#TradeRequestSummary). |
| `TradeItem` | See [TradeItem Element](#TradeItem). |

### TradeRequestHeader Element

This is a new element. It contains header information for a `TradeRequest` object.

`TradeRequestHeader` has the following attributes:

| Attribute | Description |
| --- | --- |
| `operation` (required) | The operational mode of the trade document. Possible values are "`new`" or "`update`". |
| `status` (required) | The status of the `TradeRequest`. Possible values:   * `accepted` - The funder has accepted the trade request. * `rejected` - The funder has rejected the trade request. The funder may update the status to "`accepted`" later. |
| `tradeReferenceNumber` (required) | ID of a trade transaction in the Supply Chain Financing provider's system. |
| `tradeCreatedDate` | The date and time the trade was created. |
| `projectedSettlementDate` | The date and time that the payment will be paid in supplier's bank account. |
| `autoTrade` | Indicates whether it's an automatic trade ("`yes`" or "`no`"). |

`TradeRequestHeader` has the following elements:

| Element | Description |
| --- | --- |
| `PaymentPartner` | Contains payer and payee information. Funder (payer) is required. |
| `Contact` | The supplier user who created the trade request. |
| `Comments` | Contains comments associated with this object. |
| `Extrinsic` | Contains any additional information related to this object. |

### TradeRequestSummary Element

This is a new element. It contains summary information for a `TradeRequest` object.

`TradeRequestSummary` has the following elements:

| Element | Description |
| --- | --- |
| `GrossAmount` | Total original net payment amount. All amounts for all `TradeItem` objects should add up to the total in `TradeRequestSummary`. |
| `FeeAmount` | Fee that supplier pays to receive this early payment. It should be equal to the sum of `FeeAmount` values in `TradeItem` objects. |
| `NetAmount` | Total net value of the trade. This is the projected value to be paid to the supplier. It should be equal to the sum of `NetAmount` values for `TradeItem` objects, and its value should satisfy the following equation:  `NetAmount = GrossAmount - FeeAmount` |

### Upper Element

This is a new element. It specifies tolerances that define an upper limit.

`Upper` has the following element:

| Element | Description |
| --- | --- |
| `Tolerances` | Tolerances for price, quantity, delivery date. |

### UpsideQuantity Element

This is a new element. It is the quantity of inventory that the supplier can provide above and beyond the request demand.
`UpsideQuantity` has a `UnitOfMeasure` element and a `quantity` attribute.

## 1.2.028

---

### Batch Element

This is a new element. It holds batch information for material or goods produced in a single manufacturing run,
such as buyer/supplier batch ID, production date, and property valuation.

`Batch` has the following elements:

| Element | Description |
| --- | --- |
| `BuyerBatchID` | An identifier from the buyer to identify the material/goods produced in a single manufacturing run. |
| `SupplierBatchID` | An identifier from the supplier to identify the material/goods produced in a single manufacturing run. |
| `PropertyValuation` | The property and its associated values. It has `PropertyReference` and `ValueGroup` elements. |

### BuyerBatchID Element

This is a new element. See [Batch Element](#Batch).

### Characteristic Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `code` | Code associated with a characteristic, such as a currency code or unit of measure. |

### ComponentConsumptionRequest Element

This is a new element. It holds data sent by a supplier to the buyer to report the consumption of
components during the manufacturing of an ordered item.

`ComponentConsumptionRequest` has the following new elements:

| Element | Contained In | Description |
| --- | --- | --- |
| `ComponentConsumptionHeader` | `ComponentConsumptionRequest` | Contains data pertinent to all portions of the component consumption. |
| `ComponentConsumptionPortion` | `ComponentConsumptionRequest` | Contains details of all component consumptions for a particular `OrderRequest`. |
| `ComponentConsumptionItem` | `ComponentConsumptionPortion` | Contains purchase order details for the components consumed. |
| `ComponentConsumptionDetails` | `ComponentConsumptionItem` | Contains details about component consumption. |

### ComponentID Element

This is a new element. It holds an identifier for a subcontracting component within the procurement process.

### ConfirmationItem Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `compositeItemType` | Specifies whether a parent item uses group-level pricing. Possible values are "groupLevel" and "itemLevel". |

### ConsignmentMovement Element

See [ProductActivityMessage Element](#ProductActivityMessage).

### Contact Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `role` | The position of this person within the procurement process. |

The following element was added:

| Element | Description |
| --- | --- |
| `IdReference` | Defines an ID reference. The identifier/domain pair should be unique within each trading partner relationship (a buying organization and a supplier). |

### Forecast Element

See [ProductActivityMessage Element](#ProductActivityMessage).

### ForecastQuantity Element

See [ProductActivityMessage Element](#ProductActivityMessage).

### Inventory Element

This is a new element. It represents inventory that is in the possession of the buyer,
and is owned and managed by the buyer.

`Inventory` has the following elements:

| Element | Description |
| --- | --- |
| `SubcontractingStockInTransferQuantity` | The quantity of inventory of stock that has been transferred to a vendor of type subcontracting using a special movement type. |
| `UnrestrictedUseQuantity` | The quantity of inventory that is unrestricted stock, which is the physical stock that is always available at a plant/storage location that can be consumed for stock movements and available for material requirements planning. |
| `BlockedQuantity` | The quantity of inventory that is blocked stock, which is not counted as unrestricted stock. |
| `QualityInspectionQuantity` | The quantity of inventory that is under quality inspection. |
| `PromotionQuantity` | The quantity of inventory that is reserved for promotions. |
| `StockInTransferQuantity` | The quantity of inventory that is moving between plants or from one company code to another. |
| `IncrementQuantity` | The quantity used to increment (add to) stock. |
| `RequiredMinimumQuantity` | Minimum stock level at which the stock must be maintained. |
| `RequiredMaximumQuantity` | Maximum stock level at which the stock must be maintained. |

### InvoiceDetailItem Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `compositeItemType` | Specifies whether a parent item uses group-level pricing. Possible values are "groupLevel" and "itemLevel". |

The following elements were added:

| Element | Description |
| --- | --- |
| `ReceiptLineItemReference` | Reference to the receipt line related to this line item. It has one attribute, `receiptLineNumber`, which specifies the receipt line number of the current line item, copied from `ReceiptRequest`. |
| `ShipNoticeLineItemReference` | Reference to the ship notice line related to this line item. It has one attribute, `shipNoticeLineNumber`, which specifies the ship notice line number of the current line item, copied from `ShipNoticeRequest`. |

### InvoiceDetailOrder Element

The following elements were added:

| Element | Description |
| --- | --- |
| `InvoiceDetailReceiptInfo` | Reference information of the receipt. |
| `InvoiceDetailShipNoticeInfo` | Reference information of the ship notice. |

### InvoiceDetailReceiptInfo Element

This is a new element. It contains reference information of the receipt.

`InvoiceDetailReceiptInfo` has the following elements:

| Element | Description |
| --- | --- |
| `ReceiptReference` | Reference to the receipt being invoiced. |
| `ReceiptIDInfo` | Buyer system receipt ID. |

### InvoiceDetailShipNoticeInfo Element

This is a new element. It contains reference information of the ship notice.

`InvoiceDetailShipNoticeInfo` has the following elements:

| Element | Description |
| --- | --- |
| `ShipNoticeReference` | Reference to the ship notice being invoiced. |
| `ShipNoticeIDInfo` | Buyer system ship notice ID. |

### InvoiceDetailShipping Element

The following element was changed:

| Element | Description |
| --- | --- |
| `ShipmentIdentifier` | Multiple identifiers can now be added for this element, and an attribute `domain` was added to the DTD to allow differentiation between identifiers. |

### ItemID Element

The following element was added:

| Element | Description |
| --- | --- |
| `IdReference` | Contains a group of values pertaining to a property. `IdRReference` was added to `ItemID` to refer to additional identifiers. |

### ItemIn Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `compositeItemType` | Specifies whether a parent item uses group-level pricing. Possible values are "groupLevel" and "itemLevel". |

### ItemOut Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `compositeItemType` | Specifies whether a parent item uses group-level pricing. Possible values are "groupLevel" and "itemLevel". |
| `itemCategory` | Specifies how a component or material is procured. Possible values are "subcontract" and "consignment". |

The following element was added:

| Element | Description |
| --- | --- |
| `Batch` | Contains batch information for material or goods produced in a single manufacturing run. |

### Modification Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `level` | Represents the level of the modification (in the case of cascading modifications). For example:   * **Charge 1 (Level 1):** Original Price $10 Charge: $1 * **Charge 2 (Level 1):** Original Price $10 Charge: $1 * **Charge 3 (Level 2):** Original Price $8 Charge: $1 * **Charge 4 (Level 3):** Original Price $7 Charge: $1 |

### ParentID Element

This is a new element. See [ValueGroup Element](#ValueGroup).

### Product Element

This is a new element. It contains product information of a subcontracting component, such as buyer
product ID, supplier product ID, standard product ID, internal product ID,
and so on.

`Product` has the following elements:

| Element | Description |
| --- | --- |
| `SupplierPartID` | Represents a product in the supplier system. This identifier is specified by the supplier. |
| `SupplierPartAuxiliaryID` | If `SupplierPartID` does not provide a unique key to identify the item, then the supplier should generate a key that identifies the product uniquely when combined with the `SupplierID` and `SupplierPartID`. |
| `BuyerPartID` | Represents a product in the buyer system. This identifier is specified by the buyer. |
| `Batch` | Contains batch information for material or goods produced in a single manufacturing run. |
| `IdReference` | Defines an ID reference within the application context (for example, standard ID for a product). The (identifier, domain) pair should be unique. ||

### ProductActivityDetails Element

See [ProductActivityMessage Element](#ProductActivityMessage).

### ProductActivityHeader Element

See [ProductActivityMessage Element](#ProductActivityMessage).

### ProductActivityMessage Element

This is a new element. It transmits component inventory, consignment movement, and forecast information from the buyer's ERP system.
The buyer-provided inventory summary view includes the components issued to the supplier. The information provided
gives a snapshot of the component inventory and forecast situation at a certain point in time.

`ProductActivityMessage` has the following elements:

| Element | Contained In | Description |
| --- | --- | --- |
| `ProductActivityHeader` | `ProductActivityMessage` | Contains information about a single component inventory, the product forecast details, or a consignment movement for the product. |
| `ProductActivityDetails` | `ProductActivityMessage` | Contains the details about a product activity. |
| `ItemID` | `ProductActivityDetails` | Contains identifying information for the item. |
| `Batch` | `ProductActivityDetails` | Contains batch information for material or goods produced in a single manufacturing run. |
| `Contact` | `ProductActivityDetails` | The location from and to the product activity taking place.  The only `Contact` roles (Contact@role attribute value) likely to be sensible in this element are "`locationFrom`" and "`locationTo`".  To provide a plant location description, the domain attribute of the element `IdReference` should be set to "`buyerLocationID`", "`supplierLocationID`" or "`storageLocation`" and the identifier for the "`plantID`". |
| `Inventory` | `ProductActivityDetails` | Inventory that is in the possession of the buyer, and is owned and managed by the buyer |
| `ConsignmentInventory` | `ProductActivityDetails` | Inventory that is in the possession of the buyer, but is owned by the supplier. |
| `ConsignmentMovement` | `ProductActivityDetails` | The consignment information represents the movement of material from the consignment inventory to the buyer inventory. |
| `Description` | `ProductActivityDetails` | To use `IdReference` to pass plant information, set plant name in the description. |
| `TimeSeries` | `ProductActivityDetails` | Contains the elements for period and quantity. |
| `Forecast` | `TimeSeries` | Contains the period and forecast quantity of a product for a specific time period. |
| `ForecastQuantity` | `Forecast` | Contains the forecast quantity of a product for a specific time period. |
| `ProductMovementItemIDInfo` | `ConsignmentMovement` | A reference to the line item in a movement document. |
| `InvoiceItemIDInfo` | `ConsignmentMovement` | Line item of an invoice created by the buyer against the movement item. |

### ProductRevisionID Element

This is a new element. It contains a sequential number that is assigned when changes are made to component.

### PropertyReference Element

This is a new element. See [PropertyValuation Element](#PropertyValuation).

### PropertyValuation Element

This is a new element. It consists of the property and its associated values.

`PropertyValuation` has the following elements:

| Element | Description |
| --- | --- |
| `PropertyReference` | A reference to the property being assigned values. |
| `ValueGroup` | Contains a group of values for a property. |

### PropertyValue Element

This is a new element. It consists of values for valuating a property. It has a `name` attribute
and a `Characteristic` element.

### ReceiptItem Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `compositeItemType` | Specifies whether a parent item uses group-level pricing. Possible values are "groupLevel" and "itemLevel". |

### ReceiptItemReference Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `lineNumber` | In the scenario where the `OrderRequest` is blank, the line number refers to the `shipNoticeLineNumber` of the Component Ship Notice, that is, the ship notice referenced in the `ShipNoticeReference`. |

### ScheduleLine Element

The following element was added:

| Element | Description |
| --- | --- |
| `SubcontractingComponent` | Information about a subcontracting component which is used to manufacture finished goods. |

### ServiceEntryDetailShipping Element

The following element was changed:

| Element | Description |
| --- | --- |
| `ShipmentIdentifier` | Multiple identifiers can now be added for this element, and an attribute `domain` was added to the DTD to allow differentiation between identifiers. |

### ServiceEntryItem Element

The following attributes were added:

| Attribute | Description |
| --- | --- |
| `referenceDate` | The reference date for the blanket order or contract item. The usage of this attribute is optional in most cases and must be defined by the trading partners involved in the transaction. Procurement software might use this date in reconciling an invoice against a blanket order or contract. |
| `inspectionDate` | The date when the transfer of goods or the delivery of services occurs according to legal tax definitions. The usage of this attribute is optional in most cases, and must be defined by the trading partners involved in the transaction. |

The following elements were added:

| Element | Description |
| --- | --- |
| `Tax` | The tax information for this line item. It is ignored if `isTaxInLine` is false. |
| `GrossAmount` | The `SubtotalAmount` plus taxes, shipping, and special handling charges. |
| `ServiceEntryDetailLineSpecialHandling` | The special handling information for this line item. It is ignored if `isSpecialHandlingInLine` is false. |
| `ServiceEntryDetailLineShipping` | The shipping information for this line item. It is ignored if `isShippingInLine` is false. |
| `ShipNoticeIDInfo` | References shipment related document identifiers. |
| `ServiceEntryDetailDiscount` | The discount information for this line item. It is ignored if `isDiscountInLine` is false. |
| `ServiceEntryItemModifications` | Additional charges, allowances and their taxes that are incurred for the total landed cost of the goods and service contained in this service sheet item. |
| `TotalCharges` | Total sum of all the charges applied on the goods and services at the line item level in a service sheet. |
| `TotalAllowances` | Total sum of all the allowances applied on the goods and services at the line item level in a service sheet. |
| `TotalAmountWithoutTax` | Total sum of the subtotal, charges (including special handling charges and shipping charges), allowances (including discounts) applied at the line item level in a service sheet. This does not include taxes. |
| `NetAmount` | The `GrossAmount` minus discount amount. |
| `PriceBasisQuantity` | The quantity the price is quoted on. |

### ServiceEntryRequestHeader Element

The following elements were added:

| Element | Description |
| --- | --- |
| `ServiceEntryDetailLineIndicator` | Header-level indicators indicating certain information is provided at service sheet line level (in `ServiceEntryItem`). |
| `ServiceEntryDetailShipping` | Shipping details related to the auto-generated service sheet. It is ignored if `isShippingInLine` is true. |
| `ShipNoticeIDInfo` | References shipment related document identifiers. |
| `PaymentTerm` | Defines the payment terms for this invoice. |

### ServiceEntrySummary Element

The following elements were added:

| Element | Description |
| --- | --- |
| `Tax` | Tax information. |
| `SpecialHandlingAmount` | Special handling charge. |
| `ShippingAmount` | Shipping charge. |
| `GrossAmount` | Sum of subtotal, taxes, special handling charges, and shipping charges, before discounts. |
| `ServiceEntryDetailDiscount` | The total discount applied in this `ServiceEntryRequest`. Its contained `percentageRate` attribute is ignored if `isDiscountInLine` is true. |
| `ServiceEntryHeaderModifications` | The additional charges, allowances and their taxes that are incurred for the total landed cost of the goods and services within the service sheet header. This value specified at the header-level is not the aggregated value towards the charges or allowances available for the line items. |
| `ServiceEntrySummaryLineItemModifications` | Summary of all modifications applied on the goods and services at the line item level in a service entry. |
| `TotalCharges` | The total sum of all the charges applied on the goods and services at the header-level and line item level in a service sheet. |
| `TotalAllowances` | The total sum of all the allowances applied on the goods and services at the header-level and line item level in a service sheet. |
| `TotalAmountWithoutTax` | The total sum of the subtotal, charges (including special handling charges and shipping charges), allowances (including discounts) applied at the header-level and line item level in a service sheet. This does not include taxes. |
| `NetAmount` | Gross amount minus discounts. |
| `DepositAmount` | Total deposit or prepayment amount. |
| `DueAmount` | Total amount due and payable. It equals `NetAmount` minus `DepositAmount`. If `ServiceEntryRequest@purpose` is "creditMemo" or "lineLevelCreditMemo", this amount must be negative. If `ServiceEntryRequest@purpose` is "debitMemo", this amount must be positive. |

### ShipControl Element

The following element was changed:

| Element | Description |
| --- | --- |
| `ShipmentIdentifier` | Multiple identifiers can now be added for this element, and an attribute `domain` was added to the DTD to allow differentiation between identifiers. |

### ShipmentIdentifier Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `domain` | Used to differentiate identifiers that are included in the `ShipmentIdentifier` element. The value of `domain` can depend on requirements. For example, it might be "trackingNumber" (default value) or "billOfLading". |

### ShipNoticeItem Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `compositeItemType` | Specifies whether a parent item uses group-level pricing. Possible values are "groupLevel" and "itemLevel". |

The following elements were added:

| Element | Description |
| --- | --- |
| `Batch` | An element carrying batch information for material or goods produced in a single manufacturing run. |
| `ComponentConsumptionDetails` | Contains information about component consumption. |

### ShipTo Element

The following element was changed:

| Element | Description |
| --- | --- |
| `CarrierIdentifier` | This element was previously defined as `CarrierIdentifier?` (one or none occurrence). It can now occur zero or more times. |

### SubcontractingComponent Element

This is a new element contained in `ScheduleLine`. It contains a buyer's detailed information about a subcontracting component
that is used to manufacture finished goods.

`SubcontractingComponent` has the following elements:

| Element | Contained In | Description |
| --- | --- | --- |
| `ComponentID` | `SubcontractingComponent` | An element carrying a buyer's identifier for a subcontracting component within the procurement process. |
| `UnitOfMeasure` | `SubcontractingComponent` | Unit of measure code. |
| `Description` | `SubcontractingComponent` | Description of subcontracting component. |
| `Product` | `SubcontractingComponent` | An element containing product information for a subcontracting component, such as a buyer product ID, supplier product ID, standard product ID, or internal product ID. |
| `ProductRevisionID` | `SubcontractingComponent` | An element carrying an identifier for a specific change made to a component. This is a sequential number that is assigned when changes are made to an object. |
| `Batch` | `SubcontractingComponent` `ItemOut` | An element carrying batch information for material or goods produced in a single manufacturing run. For example, `Batch` can include ID, characteristic, or date. |

### SupplierPartID Element

The following attribute was added:

| Attribute | Description |
| --- | --- |
| `revisionID` | An attribute that specifies the material revision level of an item. |

### TimeSeries Element

See [ProductActivityMessage Element](#ProductActivityMessage).

### ValueGroup Element

This is a new element. It contains a group of values for a property being assigned values.

`ValueGroup` has the following elements:

| Element | Description |
| --- | --- |
| `IdReference` | Defines an ID reference. The identifier/domain pair should be unique within each trading partner relationship (a buying organization and a supplier). |
| `ParentID` | An identifier of the parent. |
| `PropertyValue` | Properties for valuating a property. |

## 1.2.026

---

### OrderRequesttHeader Element Enhancements

The `OrderRequestHeader` element now has a new attribute, `isSchedulingAgreementRelease` that indicates if the type of purchase order is a scheduling agreement release.

### ReleaseInfo Element

The `ReleaseInfo` element stores the release information for a line item in the scheduling agreement release. This optional element has been added to the `ItemOut` element.

The `ReleaseInfo` contains the following elements:

* `ShipNoticeReleaseInfo`
  
* `UnitofMeasure`
  
* `Extrinsic`
  

This element has the following attributes:

* `releaseType`
  
* `cumulativeReceivedQuantity`
  
* `productionGoAheadEndDate`
  
* `materialGoAheadEndDate`
  

### ScheduleLineReleaseInfo Element

`ScheduleLineReleaseInfo` stores details about a specific release of items or materials for a schedule line. This element has been added to the `ScheduleLine` element.

`ScheduleLineReleaseInfo` contains the following attributes:

* `commitmentCode`
  
* `cumulativeScheduledQuantity`
  

### MasterAgreementIDInfo and MasterAgreementReference Element Enhancements

A new attribute, `agreementType`, has been added to the `MasterAgreementIDInfo` element and `MasterAgreementReference` element to indicate whether the referenced agreement is a scheduling agreement release.

### ShipNoticePortion Element Enhancement

This element can now contain one of the following optional elements:

* `MasterAgreementReference`
  
* `MasterAgreementIDInfo`
  

These optional elements are used in a ship notice for a scheduling agreement release.

## 1.2.025

---

### OrderStatusRequest Document

The `OrderStatusRequest` document allows buyers to request information from suppliers on the status of the purchase order. This document contains the following elements:

* `OrderStatusRequestHeader`
  
* `OrderStatusRequestItem`
  

The `OrderStatusRequestHeader` has the following elements:

* `OrderReference or OrderIDInfo`
  
* `Contact`
  
* `Comments`
  
* `Extrinsic`
  

The `OrderStatusRequestHeader` element has the following attributes:

* `orderStatusRequestID`
  
* `orderStatusRequestDate`
  

This `OrderStatusRequestItem` element contains the following elements:

* `ItemReference`
  
* `Comments`
  

The `ItemReference` element has the `lineNumber` attribute.

The `ConfirmationRequest` can include the `OrderStatusRequestReference` and `OrderStatusRequestIDInfo` as optional elements to explicitly reference the `OrderStatusRequest` associated to the `ConfirmationRequest`.

### QuoteRequestHeader Element Enhancements

The `QuoteRequestHeader` element now has the following attributes:

* `currency`
  
* `xml:lang`
  
* `quoteReceivingPreference`
  

The `QuoteRequestHeader` element no longer supports the `requestVersion` attribute.

### SupplierInvitation Element Enhancements

The `SupplierSelector` element now contains the `SupplierInvitation` element to define how the supplier was invited for a `QuoteRequest`.

The `SupplierInvitation` element has the following elements:

* `OrganizationID`
  
* `Correspondent`
  
* `MasterAgreementIDinfo`
  
* `Extrinsic`
  

The `SupplierInvitation` element has the following attribute:

* `supplierStatus`
  

This attribute can have the following values:

* `approved`
  
* `contracted`
  

### QuoteItemOut Element Enhancements

The `QuoteItemOut` element now contains the `Total` element.

### QuoteMessage Element Enhancements

The `QuoteMessageHeader` element now has the following attributes:

* `Currency`
  
* `xml:lang`
  

The `QuoteMessageHeader` element now has the following elements:

* `OrganizationID`
  

### Tolerances Element Enhancement

This element included in the `ItemOut` element now supports tolerances in invoices.

### PostalAddress Element

The `PostalAddress` element now stores the one or many Extrinsic elements to support additional information on the postal address. Extrinsics can be added for PO Box, House Number, Building, and so on.

### BillFrom Element

The `InvoiceDetailRequest` document also stores the `Contact role=billFrom`.

### TaxRegime Element

This element is included in the `TaxDetail` element and allows you to specify the tax classification related to the type of supplier activities and commodities in invoices. Suppliers pay taxes based on the tax regime.

Tax Regime is the governing organization for a tax category.

### Municipality Element

This element specifies the name of the municipality for a division of the state in an Address' location.

### withholdingTaxType Extrinsic

This extrinsic is used to specify if the tax category has the withholding tax. This extrinsic is added as part of the `TaxDetail` element for the `TaxDetail category="withholdingTax"`.

### InvoiceItemModification Element

The `InvoiceDetailItem` element now stores the `InvoiceItemModification` element. This element specifies the additional Charges, Allowances, and their taxes that are incurred for the total landed cost of the goods and service for an invoice item. This elements is also available in the `InvoiceDetailIServicetem` element.

### Total Charges Element

This new element is now available in the `InvoiceDetailItem` element and specifies the total sum of all the charges applied on the goods and services. This elements is also available in the `InvoiceDetailIServicetem` element.

### TotalAllowances Elements

This element specifies the total sum of all the allowances applied on the goods and services. This elements is also available in the `InvoiceDetailIServicetem` element.

### InvoiceHeaderModifications Element

This element specifies the additional Charges, Allowances, and their taxes that are incurred for the total landed cost of the goods and services at the invoice header-level. The `InvoiceDetailSummary` element also stores the `TotalCharges` and `TotalAllowances` elements.

### Tax Element Enhancement

The `tax` element now includes the taxes on allowances and charges.

### ServiceEntryRequest Document

The new `ServiceEntryRequest` document allows suppliers to respond to orders for services by describing the services they provided in detail.

The `ServiceEntryRequest` document has the following main elements:

* `ServiceEntryRequestHeader`
  
* `ServiceEntryOrder`
  
* `ServiceEntrySummary`
  

### requiresServiceEntry Attribute

This attribute is added to the `ItemOut` element in `OrderRequest` documents and specifies whether a purchase order item requires a service sheet to describe services provided.

### ServiceEntryRequest documentType

The `documentType` attribute of the `DocumentInfo` element accepts the new valid `ServiceEntryRequest` value for `StatusUpdateRequest` documents for service sheets.

### ServiceEntryItemReference Element

This element is added to the `InvoiceDetailItem`  and `InvoiceDetailServiceItem` elements in InvoiceDetailRequest. It explicitly references the service sheet and service sheet line on which the invoice line is based. It contains a `Document` element with a `payloadID` attribute that defines a `ServiceOrderReques>` document.

### ServiceEntryItemIDInfo

This element is added to the `InvoiceDetailItem` and `InvoiceDetailServiceItem` elements in InvoiceDetailRequest. It references the service sheet on which the invoice line is based. It contains an IdReference element that defines an identifier and domain pair.

### SupplierBatchID Element

This element is included in the following elements:

* `ConfirmationStatus`
  
* `ShipNoticeItem`
  
* `InvoiceDetailItemReference`
  

`SupplierBatchID` is the batch ID provided by the supplier at the line item quantity level to identify the batch in which the item or the product was produced. `SupplierBatchID` helps trace items to their batches.

### ScheduleLine Element

This element is included in the `ItemOut` element and specifies information related to delivery schedules for a line item. This element stores the `UnitOfMeasure` element and has the following attributes:

* `quantity`
  
* `requestedDeliveryDate`
  
* `deliveryWindow`
  
* `lineNumber`
  

### shipNoticeLineNumber Attribute

This attribute is included in the `ShipNoticeItem` element and specifies the ship notice line numbers.

### pickUpDate Attribute

This attribute is included in the `OrderRequestHeader` element and specifies the date when the order should be ready for pickup and delivery.

### requestedDeliveryDate Attribute

This attribute is included in the `OrderRequestHeader` element and specifies the essential date information for the supplier as well as for the freight forwarder.

### DeliveryPeriod Element

This element is included in the `OrderRequestHeader` element and specifies the earliest date and latest date when either the supplier can deliver the goods or when the receiver is able to handle incoming shipments.

This element contains the `Period` element and the following attributes:

* `startDate`
* `endDate`

### IdReference Element Enhancement

The `IdReference` element is now available in the following elements:

* `OrderRequestHeader Element`
* `Contact`
* `ShipNoticeIDInfo`
* `ShipTo/BillTo`
* `MasterAgreementIDInfo`

### addressIDDomain Attribute

This attribute is included in the `Contact` and `Address` elements to specify the code that represents the agency or organization responsible for the `addressID` numbering.

### Extrinsic Element

This element is now included in the `Contact` element.

### ItemOutIndustry Element

This element is added to the `ItemOut` element and contains the industry-specific information.

### ItemOutRetail Element

This element is included in the `ItemOutIndustry` element to specify industry-specific information for line items. This element has the following elements:

* `PromotionalVariantID`
* `PromotionalDealID`

### ItemDetailIndustry Element

This element is included in the `ItemDetail` element and specifies industry-specific information.

### ItemDetailRetail Element

This element is included in the `ItemDetailIndustry` element and contains item-specific information for the retail industry. This element has the following elements:

* `EANID`
* `EuropeanWasteCatalogID`
* `Characteristic`

### Packaging Element

This element is included in the `ItemDetail` element and specifies the packaging information for line items. This element has the following elements:

* `PackagingCode`
* `Dimension`
* `Description`
* `PackagingLevelCode`
* `PackageTypeCodeIdentifierCode`
* `ShippingContainerSerialCode`
* `ShippingContainerSerialCodeReference`
* `PackageID`
* `ShippingMark`
* `OrderedQuantity`
* `DispatchQuantity`
* `FreeGoodsQuantity`
* `QuantityVarianceNote`
* `BestBeforeDate`
* `Extrinsic`

### BuyerPartID Element

This element is now included in the following elements:

* `OrderRequestHeader Element`
* `ShipNoticeItem Element`
* `InvoiceDetailItemReference`

### InvoiceDetailItemRetail Element

This element is added to the `InvoiceDetailItemIndustry` element and specifies information about the retail industry. This element has the following elements:

* `AdditionalPrices`
* `TotalRetailAmount`
* `ItemIndicator`
* `PromotionDealID`
* `PromotionVariantID`

### InvoiceDetailItemReferenceIndustry Element

This element is included in the `InvoiceDetailItemReference` element and defines the references related to an invoice line item.

### InvoiceDetailItemReferenceRetail Element

This element is included in the `InvoiceDetailItemReferenceIndustry` element and specifies details for the retail industry. This element has the following elements:

* `EANID`
* `EuropeanWasteCatalogID`
* `Characteristic`

### Dimension Element Enhancements

The `Dimension` element is included in the following elements:

* `Packaging`
* `ItemDetail`
* `TermsOfTransport`

The `type` attribute for the `Dimension` element now supports the following new values:

* `stackHeight`
* `grossWeight`
* `grossVolume`
* `unitGrossWeight`
* `unitNetWeight`

### TermsOfTransport Element

This element is included in the `ShipNoticeHeader` element and specifies the shipping terms regarding the transportation of the goods. This element has the following elements:

* `SealID`
* `SealingPartyCode`
* `EquipmentIdentificationCode`
* `TransportTerms`
* `Dimension`
* `Extrinsic`

### Description Element Enhancement

The `Description` element in the `ItemDetail` now includes the `type` attribute.

### ShipNoticeIDInfo Element This element is now included in the `InvoiceDetailItem` element and specifies additional reference IDs for shipment related IDs. This element has the `IdReference` element and the following attributes: * `shipNoticeID` * `shipNoticeDate` InvoiceDetailSummaryIndustry Element

This element is included in the `InvoiceDetailSummary` element and specifies the summary-level information for the industry information.

### InvoiceDetailSummaryIndustry Element

This element is included in the `InvoiceDetailSummary` element and specifies the summary-level information for the industry information.

### PaymentRemittanceStatus type Attribute Enhancement

The `type` attribute in the `PaymentRemittanceStatus` element now supports an additional status "paying" type. The new "paying" type specifies that the payment transaction is in progress.

## 1.2.024

---

### Tolerances Element

The `ItemOut` elem

The `ItemOut` element now includes the `Tolerances`
element to specify tolerances in purchase orders. This element allows buyers to specify line item quantity tolerance for individual purchase orders or different line items in a purchase order they send from their order management system. The tolerances specified in the purchase order are applied when a supplier creates ship notices against the purchase order. The `Tolerances` element contains the
`QuantityTolerance` and `PriceTolerance`  elements.

### TransportInformation Element

The `ShipTo` element now includes the `TransportInformation`
element to specify the transport information in purchase orders or ship notices. The `TransportInformation`  element contains the `Route method`, `ShippingContractNumber`, and `ShippingInstruction`  elements.

### TermsofDelivery Element

The `OrderRequestHeader` and `ShipNoticeHeader elements` now include the
`TermsofDelivery` element to send delivery information at the header level in purchase orders or ship notices.

This element can also be added in the `ItemOut` element or the `ShipNoticeItem` element to send a purchase order or ship notice with delivery information at the line-item level.

The `TermsofDelivery` element has the following elements:

* `TermsOfDeliveryCode`
  
* `ShippingPaymentMethod`
  
* `TransportTerms`
  
* `Address`
  
* `Comments`
  

### shipmentType Attribute

The `ShipNoticeHeader` element now includes a new `shipmentType` attribute to specify if the type of ship notice is actual or estimated.

### IdReference and Comments Elements

The `ShipNoticeHeader` element now includes the `IdReference` and `Comments` elements
to specify additional information in the ship notices.

### trackingNumberDate Attribute

The `ShipmentIdentifier` element now includes the `trackingNumberDate` attribute that can store the tracking date provided by your carrier.

### Modifications Element

The `Total`  element now includes the `Modifications` element to store any modification to the original price or shipping price of the item at the header level. This element can store a set of one or more `Modification` elements and contains the following elements:

* `OriginalPrice`
  
* `AdditionalDeduction`
  
* `AdditionalCost`
  
* `ModificationDetail`
  

The `Modification` element is also included in the `ItemDetail`, `ConfirmationHeader`, and `ConfirmationStatus` elements.

### QuoteRequest Element

The `QuoteRequest` element now includes details on the requests for quotations sent by the buyer to the sourcing application.

  

The `QuoteRequestHeader` element has the following attributes:

* `requestID`
  
* `requestDate`
  
* `requestVersion`
  
* `type`
  
* `openDate`
  
* `closeDate`
  
* `previewDate`
  
* `templateName`
  

The `QuoteRequestHeader` element has the following elements:

* `Name`
  
* `MasterAgreementIDInfo`
  
* `SupplierSelector`
  
* `Total`
  
* `Description`
  
* `ShipTo`
  
* `Contact`
  
* `Extrinsic`
  

### QuoteItemOut Element

The `QuoteItemOut` element stores details on the line items sent in a QuoteRequest element.

  

The `QuoteItemOut` element has the following attributes:

* `Quantity`
  
* `lineNumber`
  
* `requestedDeliveryDate`
  

The `QuoteItemOut` element has the following elements:

* `ItemID`
  
* `ItemDetail`
  
* `ShipTo`
  
* `Shipping`
  
* `Tax`
  
* `SpendDetail`
  
* `Contact`
  
* `Comments`
  

### QuoteMessage Element

The `QuoteMessage` element is used by the sourcing application to send quotes to the buyer.

  

The `QuoteMessageHeader` element has the following attributes:

* `type`
  
* `quoteID`
  
* `quoteDate`
  

The `QuoteMessageHeader` element has the following elements:

* `SupplierID`
  
* `Total`
  
* `ShipTo`
  
* `Contact`
  
* `QuoteRequestReference`
  
* `Comments`
  
* `Extrinsic`
  

### QuoteItemIn Element

The `QuoteItemIn` element stores details on the line items in a `QuoteMessage` element.

  

This element has the following attributes:

* `type`
  
* `Quantity`
  
* `lineNumber`
  
* `requestedDeliveryDate`
  
* `rank`
  

The `QuoteItemIn` has the following elements:

* `ItemID`
  
* `ItemDetail`
  
* `ShipTo`
  
* `Shipping`
  
* `Tax`
  
* `SpendDetail`
  
* `Contact`
  
* `Comments`

## 1.2.023

---

### PriceBasisQuantity Element

The `PriceBasisQuantity` element is included in the `ItemDetail`
element in purchase orders, blanket purchase orders, and order confirmations and in the `InvoiceDetailtem`
and `InvoiceDetailServiceItem` elements in invoices.

### itemType and parentLineNumber Attributes

The `itemType` and `parentLineNumber` attributes are now included in the following elements:

* `ItemIn`
  
* `ItemOut`
  
* `ConfirmationItem`
  
* `ShipNoticeItem`
  
* `InvoiceDetailItem`
  
* `InvoiceDetailServiceItem`
  

`InvoiceDetailItem` and `InvoiceDetailServiceItem` contains `parentInvoiceLineNumber` attributes.

## 1.2.021

---

### TaxDetail Element

The `TaxDetail` element now includes
an `Extrinsic` element so additional tax-related
information can be included. `TaxDetail` also includes a
new attribute, exemptDetail.
The `exemptDetail` attribute allows specification of why
an item has no tax.

### Tax Element

The `Tax` element now includes an `Extrinsic`
element for additional tax-related information.

### StatusUpdateRequest

The `StatusUpdateRequest` element now includes
an `Extrinsic` element. This can be used for additional
information about the status of the document being updated.

## 1.2.020

---

### SubscriptionStatusUpdateRequest Documents

A new transaction, `SubscriptionStatusUpdateRequest`, is now included in Catalog Subscriptions.

### invoiceOrigin Attribute

The `InvoiceDetailRequestHeader` element now includes the `invoiceOrigin` attribute for invoice categorization purposes.

## 1.2.019

---

### Expense Extrinsics for TimeCards

The `TimeCard` element now includes expense extrinsics. This allows contractors to include expense information in time cards and submit them to their customers for verification.

### Organization Data Requests

Buying organizations can now use the `OrganizationDataRequest` transaction to
receive supplier profile information and updates from the Ariba Supplier Network.

### PaymentRemittanceStatusUpdateRequest Extrinsics

The `PaymentRemittanceStatusUpdateRequest` element now supports extrinsics. The `OriginalSupplierAccountNumber, CorrectedSupplierAccountNumber,
OriginalSupplierBankAbaNumber,` and `CorrectedSupplierBankAbaNumber` extrinsics allow buyers to validate bank account information entered by suppliers.

## 1.2.018

---

### Asset Information in Ship Notices

Serial numbers, asset tags, and extrinsics are now allowed within `ShipNoticeItem` elements.
This allows suppliers to provide product serial numbers and asset information to their customers for verification.

### Blanket Purchase Orders

The `OrderRequest` element now supports blanket purchase orders, a type of purchase order that specifies
a blanket amount committed to be spent without requiring all the details when the purchase order is created.

### Line-Item Credit Memos

The `InvoiceDetailRequestHeader` element now allows suppliers to send line-item credit memos to
provide buyers with detailed information on credits and to comply with EU requirements. This allows suppliers
to create a new credit memo type in addition to the header level credit memo.

### Level 2 PunchOut Enhancements

The `PunchoutDetail` element now allows suppliers to provide more catalog details on products:
the unit price, lead time, and unit of measure. Procurement applications can use this information to enhance
the search experience.

### LaborDetail Extrinsics

The `LaborDetail` element, which describes temporary labor in the `SpendDetail` element,
now supports extrinsics. Buyers might want to send their own extrinsics to the supplier, such as the region in
which the work is done.

## 1.2.017

---

### Multiple Signature Support

Multiple independent digital signatures on a document may be required. cXML 1.2.017 now allows multiple
occurrences of the `ds:Signature` element in a cXML document. This may be useful in some situations,
such as cross-border trade that must conform to VAT invoicing rules.

### XAdES 1.3.2 Support

cXML 1.2.017 now supports XAdES 1.3.2. XAdES 1.1.1 is no longer supported. Documents conforming to the
cXML 1.2.017 DTD that need to use XAdES must use XAdES version 1.3.2.

## 1.2.016

---

### New Correspondent Element in Headers

cXML documents can identify unknown sending or receiving organizations with a
new `Correspondent` element. This element can appear in the
`To` or `From` elements in the cXML header. It
identifies organizations that are not known to one of the parties involved
in the transaction.

### New punchoutLevel Attribute

cXML PunchOut index catalog items can use a new `punchoutLevel` attribute
to specify the type of PunchOut available: `store`, `aisle`,
`shelf`, or `product`. Procurement applications can display
these items differently to indicate the type of PunchOut available.

## 1.2.014

---

### Scheduled Payment Document

Scheduled payment (`PaymentProposalRequest`) documents
allow buying organizations to inform their suppliers about planned payments.
They list future payment dates and discounts and can be for information only
or for triggering payment.

### InvoiceIDInfo Added to StatusUpdateRequest

Buying organizations can now use the new `InvoiceIDInfo`
element to identify invoices in `StatusUpdateRequest` documents. This element
identifies invoices by `invoiceID` and `invoiceDate`. Previously, buying organizations
could identify invoices only by `payloadID`.

## 1.2.013

---

### New Data Download Transaction

The data download transaction (`DataRequest`
and `DataResponse` documents) allow cXML clients to download
waiting documents that reside on cXML servers. Clients use the get pending
transaction to poll for waiting documents. The server returns a `DataAvailableMessage` element
to indicate that there are waiting documents. Clients then use the data download
transaction to download those documents. The server returns waiting documents
in a Multipurpose Internet Mail Extensions (MIME) envelope.

### PCard Element Added to Payment Remittance Document

The `PCard` element has been added to the `PaymentPartner`
element within payment
remittance documents. Buying organizations can use this element to charge purchasing
cards after they approve invoices.

### remitTo Role Added to PaymentPartner Contact

`remitTo` has been added as a possible value for the role attribute
in `Contact` elements within the `PaymentPartner` element.
Buying organizations can use this value to specify suppliers’ remittance
addresses in
`PaymentRemittanceRequest` documents.

## 1.2.012

---

### New Description Element Added to Invoice SpecialHandlingAmount

The invoice `SpecialHandlingAmount` element has a new
`Description` element. Suppliers can use this element to describe
the reason for the special handling charge.

## 1.2.011

---

### CopyRequest Enhancement

Buyer and supplier organizations should now use attachments to
fulfill copy requests. In cXML 1.2.011, the use of the `cXML` element
as a child of `CopyRequest` is deprecated. Instead, use the `cXMLAttachment`
element to attach another cXML document, whether or not it contains attachments
itself.

### New PaymentRemittance Transaction

`PaymentRemittanceRequest` and `PaymentRemittanceStatusUpdateRequest` documents
allow buying organizations to pay suppliers for
provided products or services. These documents
allow buyers to specify payment schedules, specify discounts,
and send payments regardless of where payments are made, and to ensure that
payments have been received.

The PaymentRemittance transaction supports payment transaction details
for a wide variety of business scenarios, including standard invoices, credit
memos, and debit memos.

Procurement applications send `PaymentRemittanceRequest` documents
and suppliers respond with generic response documents. When payment transaction
status levels are updated, procurement applications send `PaymentRemittanceStatusUpdateRequest`
documents.

### InvoiceDetailPaymentTerm Deprecated

`InvoiceDetailPaymentTerm` is deprecated in cXML 1.2.011,
in favor of `PaymentTerm` (described below). cXML implementations
for payment should use `PaymentTerm`.

### New PaymentTerm Element

Defines the payment term in orders and invoices. This deprecates
the `InvoiceDetailPaymentTerm` previously defined. `PaymentTerm`
defines either the net term (without discount) or the discount term (with discount).

### Digital Signature Support

Any cXML `Request`, `Response`, or `Message`
can now be signed using W3C XML Digital Signatures. Support for the XAdES (XML
Advanced Electronic Signature) standard is also included. A valid cXML signature
is an XML signature with certain properties, so additional signature elements
now appear in all DTD files.

### New SpendDetail Element

The new `SpendDetail` element enables buyers and suppliers
to automate the transaction process for spend in three new categories: travel,
fees, and labor. There are three new elements within `SpendDetail`:
`TravelDetail`, `FeeDetail`, and `LaborDetail`,
in addition to the `Extrinsic` element.

> #### TravelDetail Element
>
> `TravelDetail` contains information about travel
> line items for air, car rental, hotel, and rail in `ItemIn` and
> `ItemOut` elements. In addition, cXML 1.2.011 supports the use
> of `Extrinsic` elements in `SpendDetail`, to enable
> buyer-supplier pairs to convey detailed information on spend that is not yet
> explicitly defined in cXML.
>
> With cXML 1.2.011, users can access a travel booking provider's
> website and make travel reservations. To meet the particular requirements
> of the travel industry, `TravelDetail` supports an `OrderRequest`
> of type `"delete"`, which can be sent to a travel booking
> provider after `PunchOut` to cancel an existing reservation. This
> also enables suppliers to cancel a leg of an air trip, for example, while
> replacing it with a new air leg. New transactions are in cXML.dtd.
>
> #### FeeDetail Element
>
> The new `FeeDetail` element of `SpendDetail`
> conveys information about one-time or recurring fees that are not explicitly
> defined elsewhere in cXML. For example, a one-time fee for furniture rental
> would not fall into any category defined in `TravelDetail` or `LaborDetail`,
> but could be described in `FeeDetail`.
>
> #### LaborDetail Element
>
> `LaborDetail` contains information about an item
> related to temporary labor.
>
> #### Extrinsic
>
> The use of `Extrinsic` details is now supported in
> `SpendDetail`, enabling buyer-supplier pairs to convey detailed
> information on spend that does not fit within `TravelDetail`, `FeeDetail`,
> or `LaborDetail`. Extrinsic elements are intended to provide additional
> machine-readable information. They extend the cXML protocol to support features
> not required by all implementations. The cXML specification does not define
> the content of `Extrinsic` elements. Each buyer-supplier pair must
> agree on and implement their definitions of `Extrinsic` elements.

### New TimeCard Element

Timecards for temporary employees can now be transmitted by cXML.
The `TimeCard` element documents hours worked, dates worked, and
pay rates. Two new requests contain the `TimeCard` element: `TimeCardInfoRequest`,
which allows buyers to send time cards to suppliers or staffing agencies, and
`TimeCardRequest`, which allows suppliers and staffing agencies to
send timecards to buyers.

### New LeadTime Element

`ItemDetail` now contains an optional `LeadTime`
element which describes the number of days needed for the buyer to receive the
product in question. In an `IndexItemAdd` element, duplicate `LeadTime`
information might come from both `ItemDetail`, where it is optional,
and `IndexItemDetail`, where it is mandatory. If `LeadTime`
elements are defined in both cases, then they should be identical.

### Limited Changes in Use of UnitOfMeasure and UnitRate

In the context of an `InvoiceDetailServiceItem` element
or a `LaborDetail` element, `UnitOfMeasure` and `UnitPrice`
are deprecated in cXML 1.2.011, and should not be used. Use `UnitRate`
instead, because it includes the rate code. For some services, such as temporary
labor, `UnitRate` is required.

`UnitRate` represents the amount to be paid per unit of time (or of
some other measure). In the case of multiple `UnitRates`, each `UnitRate`
should include a `TermReference` to distinguish it from others. `TermReference`
is a generic base element that identifies the definition of the `UnitRate`
in question.

### New preferredLang Attribute

The `Email` element now contains an optional `preferredLang`
attribute. This attribute allows optional language information to be associated
with email addresses so that email messages are constructed in the preferred
language.

### SearchDataElement Change

A change to `SearchDataElement` allows suppliers producing
catalog content to specify the searchable type name without being forced to
specify additional searchable information about the item. Formerly, it was `<!ELEMENT
SearchGroupData (Name, SearchDataElement+)>`. Now, it is `<!ELEMENT
SearchGroupData (Name, SearchDataElement*)>`.

### New inspectionDate Attribute

You can now specify inspection dates for invoice lines using a
new optional attribute called `inspectionDate`, which has been added
to the `InvoiceDetailItem`, `InvoiceDetailServiceItem`,
and `InvoiceDetailOrderSummary` elements. The `inspectionDate`
attribute represents the date when the transfer of goods or the delivery of
services occurs according to legal tax definitions. In most locations, use of
this attribute is optional.

### Followup Element Deprecated

As of cXML 1.2.011, the use of the `Followup` element
is strongly discouraged. In early implementations, `Followup` was
used to specify the URL to which future `StatusUpdateRequest` documents
should be posted.

All cXML implementations should use the more robust Profile transaction
to retrieve and convey information about server capabilities, including supported
cXML version, supported transactions, and options to those transactions. See
“Profile Transaction” on page 24 for more information.

## 1.2.009

---

### Better Support for Change Orders

Previously, there was no uniform way to denote the version of change orders. Some implementations added a version number to the order number, such as -V2.

Now, cXML has better support for change orders through two new `OrderRequestHeader` attributes.

| Attribute | Description |
| --- | --- |
| `orderVersion` (optional) | Specifies the order version number of change orders, starting with "1" for the original order. |
| `isInternalVersion` (optional) | Indicates whether the order includes changes that are relevant only within the buying organization. For example, a minor change was made that does not affect information used by the supplier. Suppliers might not see internal order versions, depending on their customers' configuration. |

### New SerialNumber Element in Invoices

The invoice `InvoiceDetailItemReference` `serialNumber`
attribute has been deprecated and replaced with a repeating `SerialNumber`
element.

This change enables suppliers to uniquely identify multiple items with serial
numbers per invoice line item. The number of `SerialNumber` elements
should match the invoice quantity.

### New isRequiredForOrdering Attribute

Catalog type definition `TypeAttribute` elements can use a new attribute named `isRequiredForOrdering`:

| Attribute | Description |
| --- | --- |
| `isRequiredForOrdering` | Specifies the order version number of change orders, starting with "1" for the original order. |

Catalog fields with this attribute cause procurement applications to require
requisitioners to enter a value for the field before allowing the item into
requisitions.

### New Elements for Service Invoices

`InvoiceDetailRequest` documents now have better support for invoicing
for supplied services. Previously, invoices did not capture all of the information
mandated by the diverse requirements of service invoicing.

* `InvoiceDetailServiceItem`  
  Describes a service being invoiced at a detailed level. Includes `InvoiceDetailServiceItemReference`,
  which identifies the master agreement that defines the service.
* `Period`  
  A new element available within `InvoiceDetailRequestHeader` and
  `InvoiceDetailOrderSummary` that specifies the period during which
  the invoiced service was rendered.

### Enhanced VAT Support in Invoices

`InvoiceDetailRequest` documents now have better support for specifying
VAT (value added tax) information mandated by some European countries. The following
new VAT features can be specified within `TaxDetail` elements at
either the invoice header level or the line-item level.

* `isTriangularTransaction`  
  Indicates that a transaction occurs between three parties in three different
  countries when the movement of goods does not follow the invoicing route.
* `taxPointDate`  
  Specifies the date on which VAT becomes due.
* `paymentDate`  
  Specifies the date on which payment must be made (used only for transactions
  in France).
* `TriangularTransactionLawReference`  
  Specifies the relevant EU law covering the transaction VAT.

In addition, `subsequentBuyer` is a new `Contact` role
that allows for identifying subsequent buying organizations in triangular transactions.

### Direct PunchOut

Direct PunchOut is a new cXML capability that can reduce the time it takes
clients to display the first page of a PunchOut site during PunchOut session
initiation.

It enables clients to send cXML `PunchOutSetupRequest` documents
directly to PunchOut sites for authentication, without first going through a
network hub for authentication and forwarding.

#### New Authentication Methods

> Direct PunchOut is made possible by two new authentication methods available
> in cXML:
>
> * **MAC Authentication** — The server interprets a Message Authentication
>   Code (MAC) in the Sender credential in `PunchOutSetupRequest`
>   documents.
> * **Auth Transaction** — The server asks a network hub
>   to authenticate the client’s digital certificate and caches the response
>   for subsequent PunchOut requests.
>
> Servers indicate which authentication method they support through their cXML
> Profile.

#### New ProfileResponse PunchOutSetupRequest options

> Servers indicate that they support direct PunchOut and specify the authentication
> methods they support by including the following new options for `PunchOutSetupRequest`
> in `ProfileResponse` documents.
>
> `<Transaction requestName="PunchOutSetupRequest">  
>    <URL>https://service.ariba.com/AN/cxml</URL>  
>    <Option name="Direct.URL">https://bigsupplier.com/punchout</Option>  
>    <Option name="Direct.AuthenticationMethod.CredentialMac">Yes</Option>  
>    <Option name="Direct.AuthenticationMethod.Certificate">Yes</Option>`

### New MAC Authentication Method

A new document authentication method uses Message Authentication Codes (MACs)
to allow the authentication of documents sent directly from a client to a server
without passing through a trusted third party (such as a commerce network hub).
These documents contain a credential with an authentication code that can be
interpreted only by the trusted third party and the receiving server, not by
the sender.

A MAC conveys a receiver’s shared secret without revealing it to senders
by encoding it through a hash.

MACs combine specific data with the receiver’s shared secret and they
are computed with the HMAC-SHA1 algorithm described in IETF RFC 2104, “HMAC:
Keyed-Hashing for Message Authentication”.

Direct PunchOut is a transaction that relies on MAC authentication.

#### New ProfileResponse Options

> To support the communication of MACs from trusted third parties (such as
> commerce network hubs) to clients, there are new options for the `ProfileResponse`
> document:
>
> `<ProfileResponse>  
>    <Option name="CredentialMac.type">FromSenderCredentials</Option>  
>    <Option name="CredentialMac.algorithm">HMAC-SHA1-96</Option>  
>    <Option name="CredentialMac.creationDate">2003-01-15T08:42:46-0800</Option>  
>    <Option name="CredentialMac.expirationDate">2003-01-15T11:42:46-0800</Option>  
>    <Option name="CredentialMac.value">cR6Jpz58nriXERDN</Option>`

#### New CredentialMac Element

To support the communication of MACs from senders to receivers, a new `CredentialMac`
element has been added to the `Credential` element:

`<Sender>  
   <Credential domain=”NetworkId”>  
      <Identity>AN9900000100</Identity>  
      <CredentialMac type=”FromSenderCredentials”  
            algorithm=”HMAC-SHA1-96”  
            creationDate=”2003-01-15T08:42:46-0800”  
            expirationDate=”2003-01-15T11:42:46-0800”>  
         cR6Jpz58nriXERDN  
      </CredentialMac>  
      <UserAgent>Procurement System 2.0</UserAgent>  
   </Credential>  
</Sender>`

### New Auth Transaction

The Auth transaction is a new method for validating organizations’ credentials
through a mutually trusted third party. It should be used to authenticate
received documents that do not contain either a cXML shared secret or a MAC.
The receiver encloses the credential of the sender (the principal) in an `AuthRequest`
document and sends it to the trusted third party for validation.

If the principal attempts to authenticate using a client digital certificate,
the receiver includes both the principal’s credential and information
about the principal’s certificate in the `AuthRequest` document.
(The receiver obtains this certificate information from its Web server or
SSL/TLS implementation.)

If the credential (and optional certificate) authenticates, the trusted third
party responds with a positive `AuthResponse` that contains the validated credential.

The receiver can cache the results of the Auth transaction until the expiration
date indicated in the `AuthResponse`. During this period, if the
principal presents the same credential and certificate, the receiver need not
send another `AuthRequest`.

### Status Code Clarification

Response status codes 200 and 201 have changed slightly and two new codes,
280 and 281, are introduced:

* **200** The request has been successfully delivered to the final recipient.
  You will receive no further status updates, unless an error occurs during
  later processing.
* **201** The request has been accepted for forwarding by an intermediate
  hub, or has been accepted by its ultimate destination and not yet been examined.
  You will receive updates on the status of the request, if a mechanism to deliver
  them is available.
* **280** The request has been forwarded by an intermediate hub. You will
  receive at least one more status update. This status could mean that the request
  was delivered to another intermediary or to the final recipient with 201 status,
  or that it was forwarded via a reliable non-cXML transport.
* **281** The request has been forwarded by an intermediate hub using an
  unreliable transport (such as email). You might receive status updates; however,
  if you do not received status updates, there is not necessarily a problem.

## 1.2.008

---

### Added Type Definitions

Type definitions are a new document type used to describe supplemental catalog
attributes and parametric data fields for catalogs. The new `Type`
element replaces the deprecated `SearchGroup` element.

Type definitions provide a richer and more general framework for defining parametric
types, and they allow the definition and standardization of parametric types
from *type provide*r organizations independent of catalog index data in
which `SearchGroup` elements resided.

The `SearchGroupData` and `SearchDataElement` elements
continue to specify the actual parametric data for a given catalog item. `SearchGroupData`
must reference a defined type, and `SearchDataElement` specifies
data for each type attribute within that type.

The `TypeDefinition` document is defined in a new cXML DTD named
`Catalog.dtd`.

### Added Catalog loadmode Attribute

The `Index` element has a new attribute named `loadmode`,
which can be set to either `"Full"` or `"Incremental"`
to indicate whether the catalog should be loaded into the target application
as a complete catalog or an incremental change.

Previously, all cXML catalogs were incremental.

### Added Ad-Hoc Item Flag

The `ItemOut` element in purchase orders has a new attribute named
`isAdHoc`, which indicates that the item is a non-catalog (ad-hoc)
item.

Non-catalog items are items entered manually by requisitioners, not items selected
from electronic catalogs. Often, these items do not have part numbers. Non-catalog
orders usually require special validation and processing.

Users enter non-catalog items to purchase products and services on an ad-hoc
basis or because they could not find them in electronic catalogs.

If `isAdHoc="yes"` exists for some items and not for others,
the requisition should be broken into two requisitions: one for catalog items
and one for non-catalog items. Suppliers will then be able to automatically
process as many requisition items as possible, instead of having to manually
process both catalog and non-catalog items.

### Added Backordered Flag

Suppliers can now issue `ConfirmationRequest` documents to indicate
that items are back ordered.

The new `type="backordered"` attribute value can be used
in either `ConfirmationHeader` for the entire order or in `ConfirmationStatus`
for individual line items.

### Contract Element Deprecated

The `Contract` element for defining contract pricing is deprecated.
It is no longer needed, because `MasterAgreementRequest` documents
can handle most of the requirements of contract pricing.

### SearchGroup Element Deprecated

The `SearchGroup` element for defining parametric data categories
is deprecated. It is no longer needed, because the new `TypeDefinition`
element defines parametric data categories.

Note that catalogs continue to use the `SearchGroupData` element
to populate parametric data.

## 1.2.007

---

### InvoiceDetail Documentation

The InvoiceDetail transaction is now fully described in Chapter 9, "Invoices"
in the *cXML User's Guide*.

### version Attribute Deprecated

The `version` attribute of the `cXML` wrapper element
has been deprecated. This attribute is not needed, because applications can
detect the cXML version from the system identifier in the DOCTYPE declaration.

### InvoiceStatus Added to StatusUpdateRequest

`StatusUpdateRequest` documents can contain a new element named
`InvoiceStatus`. Buying organizations can now use these documents
to update the status of invoices on commerce network hubs, which can forward
them to suppliers. Invoice status can be `reconciled`, `rejected`,
or `paid`.

The new `InvoiceStatus` element can contain a new `PartialAmount`
element, which specifies the amount paid against the `InvoiceDetailRequest`.
If this element exists, the buying organization does not pay the full amount
specified within the `InvoiceDetailRequest`.

### Multiple Provider URLs Returned by ProfileRequest

The Profile transaction can now return multiple variations of a single transaction
type. Previously, if a cXML server supported multiple variations of a transaction,
there was no standard for distinguishing them.

For example, a marketplace might provide two services within the `ProviderSetupRequest`
transaction: *signin* and *console*. The `ProfileResponse`
document can now specify the location of each variation:

> `<Transaction requestName="ProviderSetupRequest">  
>   <URL>http://service.hub.com/signin</URL>  
>   <Option name="service">signin</Option>  
> </Transaction>``<Transaction requestName="ProviderSetupRequest">  
>   <URL>http://service.hub.com/console</URL>  
>   <Option name="service">console</Option>  
> </Transaction>`

### Contact Role Enhancements for Compatibility with EDI

To enable easier data translation between EDI and cXML documents, there are
new values for the `Contact role` attribute and the `IdReference
domain` attribute.

* `IdReference` within `InvoicePartner` has a new `Contact
  role`: `issuerOfInvoice`. The `from` role has
  been deprecated.
* `InvoiceDetailShipping` has a new `Contact role`:
  `carrierCorporate`.
* The general `Contact` element has new roles: `supplierCorporate`
  and `buyerCorporate`. In addition, the general `Contact`
  roles `from` and `to` have been reserved for possible
  use in the future.

## 1.2.006

---

### New InvoiceDetail.dtd

The InvoiceDetail transaction was added to support detailed invoicing. This
transaction enables suppliers to invoice buying organizations through commerce
network hubs for the entirety or portion of single or multiple orders. This
transaction introduces the InvoiceDetailRequest document and uses a standard
cXML Response document.

Use this transaction to inform buying organizations of invoice details, including
order references, line item references, partners involved, accounting and financing,
discount terms, shipping and special handling, applicable taxes, deposit and
payment, and contact and remittance information. Use InvoiceDetail to send an
invoice for any portion of all or selected line items from single or multiple
orders. You can also use InvoiceDetail to send a credit or debit memo, or a
duplicate copy of invoices sent earlier.

## 1.2.005

---

### Added addressID Attribute to Contact

This attribute supports address codes for relationships that require id references.

### Added TaxDetail Element to Tax

Tax element can contain repeatable `TaxDetail` elements. `TaxDetail`
provides information regarding taxable amount, tax amount, tax location, tax
purpose, tax category, tax rate, whether the tax is VAT recoverable, and textual
description.

### Added MasterAgreementRequest Transaction

Provides the capability of negotiating and creating Master Agreements with
suppliers and creating Release Orders from these Master Agreements. Master Agreement
documents can be routed from a procurement application to a supplier via a commerce
network hub.

#### Significant MasterAgreementRequestHeader Elements and Attributes Are:

* `type` attribute - Whether this document refers to a 'value'
  or 'quantity' Master Agreement
* `agreementDate` attribute - Date the Master Agreement becomes
  available for ordering
* `expirationDate` attribute - Date the Master Agreement expires
  and is no longer available for ordering
* `MaxAmount` element - Maximum amount for all line items on the
  Master Agreement
* `MinAmount` element - Committed amount for all line items on
  the Master Agreement

#### Significant AgreementItemOut Elements and Attributes Are:

* `MaxAmount` element - Maximum amount for this line item
* `MinAmount` element - Committed amount for this line item
* `maxQuantity` - Maximum quantity for this line item
* `minQuantity` - Committed quantity for this line item

#### Added orderType, agreementID, and agreementPayloadID Attributes to OrderRequest

`orderType` indicates whether the Order Request is a Release Order
from an existing Master Agreement contract. The default is regular.

`agreementID` identifies the associated agreement corresponding
to the Release Order.

`agreementPayloadID` specifies the PayloadID of the referenced Master
Agreement.

#### Added agreementItemNumber Attribute to ItemOut

Identifies the corresponding item on a particular Master Agreement.

### Added Elements and Attributes to Support RFQ (Request For Quote)

When initiating a PunchOut session for sourcing an item rather than extending
a catalog search to the PunchOut site, some additions to the PunchOutSetupRequest
and related documents improve the application integrations. These additions
should be used only when the originating application is sure the destination
supports them. They are not completely compatible with existing PunchOut destinations.

#### Added "source" operation to PunchOutSetupRequest

The operation attribute of the PunchOutSetupRequest now has an additional option
in its enumeration. This allows a procurement application to begin a PunchOut
session with reference to information present in the ItemOut element list rather
than the SelectedItem element. Otherwise, the new operation is very similar
to a "create" operation.

#### Added SupplierList Element to ItemOut

This new element may be used instead of a single SupplierID in the ItemOut
element. SupplierList element defines a list of suppliers that might be associated
with a sourced item. The ItemOut elements may specify a list of suppliers that
could be involved in the sourcing process. The Supplier List needs the name
and the list of SupplierIDs for that particular supplier.

#### Added SourcingStatus Element to PunchOutOrderMessageHeader and StatusUpdateRequest

Transfers information for the update of a given RFQ transaction, including
the type of update. The content of the element can be a textual description
of the update, such as the actual status update string used in the UI for display.

### Added quoteStatus Attribute to PunchOutOrderMessage

Specifies whether the quote is still pending or final. This is a replacement
for various hacks used to prevent submission of requisitions that include unfinished
quotes. If set, the application should return for updates prior to allowing
submission.

### Corrected the Fixed Value of an a-dtype Attribute

The datatypes of the ProfileResponse attributes as expressed in the a-type
fixed attribute of that element were incorrect in the 1.2.004 DTD. This was
a regression of the defect mentioned below as fixed in 1.2.003.

### Added itemDetailsRequired Attribute to Node

Indicates that a node would like the ItemDetails element returned in a later
PunchOut (edit or inspect) operation. Without this, most procurement applications
today default to sending only limited identification information such as the
SupplierID, Path and ItemID elements.

This is an extension to the Path Routing feature mentioned in the 1.2.003 notes
below.

### Added DataAvailableMessage Element

A new message option for use within the GetPendingResponse. Indicates new information
is available at the target site.

### Moved InternalID Element Definition

Identifies a subscription or any available data.

## 1.2.004

---

### Added PaymentStatus element to StatusUpdateRequest

This optional element allows more detailed information if the original document
is a `ConfirmationRequest` with `type="RequestToPay"`.

### Added ProfileResponse lastRefresh Attribute

The `lastRefresh` attribute indicates when the server's profile
cache last changed. When an application receives a `ProfileResponse`
from a profile caching entity such as a commerce network hub, it will know the
age of the data in the cache.

## 1.2.003

---

### Added Path Routing Feature

Path Routing enables documents to be routed by and copied to intermediary systems
such as direct and indirect marketplaces, and commerce service providers. In
complex relationships between buyers and suppliers, documents might be routed
through several intermediary systems before they reach the end node.

Added an optional `Path` element to the Header and Item level of
cXML documents.

### Corrected Datatype of ProfileResponse effectiveDate Attribute

Changed

> `a-dtype NMTOKENS #FIXED 'effectiveDate dateTime'`

to

> `a-dtype NMTOKENS #FIXED 'effectiveDate dateTime.tz'`

## 1.2.002

---

### Added Catalog Upload Transaction

The cXML Catalog Upload transaction enables suppliers to programmatically upload
and publish catalogs to a commerce network hub. It can be used to automatically distribute
updated catalogs whenever the pricing or availability of products or services
changes. The Catalog Upload transaction consists of two cXML documents: `CatalogUploadRequest`
and generic `Response`. `CatalogUploadRequest` was added
to `cXML.dtd`.

The Catalog Upload transaction supports both CIF and cXML catalogs.

## 1.2.001

---

### Added Provider PunchOut Transaction

`ProviderSetupRequest`, `ProviderSetupResponse`, and
`ProviderDoneMessage` were added to the `cXML.dtd`. Provider
PunchOut enables an application to punch out to a provider’s application
that supplies some service to the originating application, such as credit card
validation, single login, or self registration.

### Moved Common PunchOut Related Element Definitions

Moved common PunchOut related element definitions to `Base.mod`
from other modules thereby reordering the definitions within `cXML.dtd`
and `Fulfill.dtd`.

### Reordered cXML.dtd

Reordering of `cXML.dtd`  places the contents of `Entities.mod`
and `Profile.mod` slightly later in the concatenation.

### New Fulfill.dtd

* Added CopyRequest transaction.
* Reordering of the content models for elements used within the ConfirmationRequest
  and ShipNoticeRequest documents places lower-level lists at the end of each.
  For example, the `ConfirmationStatus` list moves to the end of
  the `ConfirmationItem` element. The content of `ShipNoticePortion`
  has also changed.
* New comments for many elements in ConfirmationRequest about defaulting
  and overriding behavior when a later document arrives with line-level rather
  than header-level data, or visa versa. Specifically describes which elements
  and attributes in the `ConfirmationHeader` apply to an entire
  order rather than this specific confirmation.
* Added `requestToPay` option in the enumeration for the type
  attributes of the `ConfirmationHeader` and `ConfirmationStatus`
  elements. This addition enables support for a scaled-down Invoice capability.

## 1.2.000

---

### Added Extrinsic Element to PunchoutDetail

The `PunchoutDetail` element can now contain an `Extrinsic`
list. This is used in a `IndexItemPunchout` (also correct with that
capitalization) element in a static catalogue.

### Added ConfirmationRequest and ShipNoticeRequest

Released a draft version of `Fulfill.dtd` containing `ConfirmationRequest`
and `ShipNoticeRequest`.

## 1.1.010

---

### Added CopyRequest Element

The `CopyRequest` element enables copying and forwarding of messages
to new recipients, similar to forwarding an e-mail messages. To accomplish
this, a new message is created and sent that includes the original message.
It is primarily used by commerce network hubs and marketplace hosts.

### Added Comments to Country-Related Elements and Attributes

Better explanations of the country-related elements and attributes have been
added to the `CountryCode` element, and the `isoCountryCode`
attribute on the `Address`, `Country`, and `CountryCode`
elements.

## 1.1.009

---

### Change in Data Type of role Attribute of Contact Element

The data type of the of the `Contact` element's optional `role`
attribute has been changed from an enumeration containing `endUser`,
`administrator`, `purchasingAgent`, `technicalSupport`,
`customerService`, and `sales`, to a string with the same
allowed values. This change enables the usage of the `Contact` element
to be more easily expanded.

### Addition of a lastChangedTimeStamp Attribute to the Identity Element

An optional `lastChangedTimestamp` attribute has been added to the
`Identity` element. This attribute enables automatic synchronization
of data between systems.

### Addition of a domain Attribute to the InternalID Element

An optional `domain` attribute has been added to the `InternalID`
element and provides scoping for this subscription catalogue identifier. The
default domain value is "NetworkSubscription".

### Addition of a DocumentReference Element to the OrderRequestHeader Element

An optional `DocumentReference` element has been added to the`OrderRequestHeader` element. `DocumentReference` provides explicit
links between an update or delete action and the most recent `OrderRequest`
for the same order. `DocumentReference` contains the `payloadID`
of the most recent `OrderRequest` document in the list, not always
the original `OrderRequest` (with type set to "new").

### Definitions Rearranged

`DocumentReference` and `StatusUpdateRequest` have been
moved to new locations within the `cxml.dtd` file. The constituent
file `status.mod` no longer exists.

## 1.1.008

---

### New Entity for cXML Version

The cXML version string (for example, 1.1.008) is now stored in a single-parameter
entity named `cxml.version`. You can use this new entity to keep
the version number consistent throughout cXML documents. For example,

> `<!DOCTYPE cXML SYSTEM "http://xml.cXML.org/schemas/cXML/1.1.008/cXML.dtd">  
> <cXML version="&cxml.version;" payloadID="992662"
> xml:lang="en-US" timestamp="2000-03-12T18:39:09-08:00">`

Using this technique is not recommended when interacting with non-validating
XML parsers. Non-validating parsers will have no version information as they
load the cXML document, and will behave as if the `version` attribute
were absent.

### SGML Entity-Redefinition Conditionalized

cXML 1.1 followed a general XML recommendation to redefine five entities (lt,
gt, amp, apos, and quot) for interoperability with SGML parsers. However, it
was found that these redefinitions cause some XML parsers to complain.

These redefinitions are now conditionalized for better compatibility with XML
parsers. In the future, commerce network platforms might have an option for
setting the XML flag `SGML-help` to trigger these redefinitions for
interoperability with SGML parsers.

### Transaction Definitions Rearranged

The definitions of the `%cxml.messages`, `%cxml.requests`,
and `%cxml.responses` entities have been moved to a separate module
(`Entities.mod`) for improved maintainability. By moving these definitions
to `Entities.mod`, they appear together within the .dtd, separate
from their uses in the `Message`, `Request`, and `Response`
elements.

### New License Agreement

The copyright notice in the .dtd and .mod files has been replaced by a reference
to the license agreement on www.cXML.org:

> `For cXML license agreement information, please see  
> http://www.cxml.org/home/license.asp`

## 1.1.007

---

### Deterministic Declaration of cXML Element

The top-level `cXML` element has a new declaration:

> Old element type declaration:  
> `<!ELEMENT cXML ((Header, Message) | (Header, Request)
> | (Response))>`
>
> New declaration:  
> `<!ELEMENT cXML ((Header, (Message | Request)) |
> Response)>`

The new declaration uses a deterministic grammar that is compatible with more
XML parsers.

### OrderReference Changed to DocumentReference

The proposed element name `OrderReference` was changed to `DocumentReference`
so that it is more generic.

### Less Restrictive Data Type for Attributes

The data types of the following attributes have been changed from NMTOKEN to
CDATA so that they can contain less restrictive data:

> `isoCountryCode  
> currency  
> alternateCurrency  
> xml:lang`
