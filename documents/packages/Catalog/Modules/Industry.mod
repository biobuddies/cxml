<!--
    For cXML license agreement information, please see
    http://www.cxml.org/home/license.asp

	$Id: //ariba/cxml/schema/Modules/Industry.mod#1$
-->

<!-- ====
    Allow this module to be built separately from any other DTD file.
==== -->

<!--
    Characteristic contains detailed information about an item that can be used across different industries.
    Can also be used to send material characteristics to support configurable material process. 
-->
<!ELEMENT Characteristic EMPTY>
<!-- 
	@attr domain Type of Characteristic. Examples: size, sizeCode, color, colorCode , quality, qualityCode, grade, gradeCode.

    @attr value Value for the domain.

	@attr code Code associated with a characteristic, such as a currency code or unit of measure. 
-->
<!ATTLIST Characteristic
	domain	%string;   #REQUIRED
	value  	%string;   #REQUIRED
	code 	%string;   #IMPLIED >
	
<!-- 
    DEPRECATED. Do not use this element.

	Use IdReference and proper domain within ItemID instead.

    Number assigned to a manufacturer's product according to the International Article Numbering Association 
	or UPC(Universal Product Code) for an article.
-->
<!ELEMENT EANID (#PCDATA)> <!-- string -->

<!-- 
	European Waste Catalogue is a unique ID for articles listed in the EU Waste Catalogue (EWC). 
	It requires special handling. 
-->
<!ELEMENT EuropeanWasteCatalogID (#PCDATA)>

<!-- 
	Number assigned by a supplier to a special promotion activity. Promotions affect the forward 
	planning/ordering process (and the related pricing). 
-->
<!ELEMENT PromotionDealID (#PCDATA)> <!-- string -->

<!-- 
	The item number is a promotional variant number. Used when only one or some variants of an 
	article are promoted.
-->
<!ELEMENT PromotionVariantID (#PCDATA)> <!-- string -->


<!-- 
	Total retail value of all products. 
-->
<!ELEMENT TotalRetailAmount (Money)>

<!-- 
	Information price, excluding allowances or charges, and taxes. The price stated is for 
	information purposes only. 
-->
<!ELEMENT InformationalAmount (Money)>

<!-- 
	Gross monetary amount paid or to be paid at intervals. 
-->
<!ELEMENT GrossProgressPaymentAmount (Money)>

<!-- 
	Deposit amount charged for returnable items (boxes, containers, pallets, and so on).
-->
<!ELEMENT TotalReturnableItemsDepositAmount (Money)>

<!-- 
	Total amount of goods and services excluding deposits for returnable goods.
-->
<!ELEMENT GoodsAndServiceAmount (Money)>

<!-- 
	Specific exact amount. 
-->
<!ELEMENT ExactAmount (Money)>

<!-- 
	Groups all the additional amounts. 
-->
<!ELEMENT AdditionalAmounts (TotalRetailAmount?, InformationalAmount?, GrossProgressPaymentAmount?, 
					TotalReturnableItemsDepositAmount?, GoodsAndServiceAmount?,  ExactAmount? )>

<!--
	Price value per unit (gross price).
-->
<!ELEMENT UnitGrossPrice (Money, PriceBasisQuantity?)>

<!--
	Information price, excluding allowances or charges, and taxes. The price stated is for 
	information purposes only. 
-->
<!ELEMENT InformationalPrice (Money, PriceBasisQuantity?)>

<!-- 
	Information price, excluding  only taxes. The price stated is for information purposes 
	only.
-->
<!ELEMENT InformationalPriceExclTax (Money, PriceBasisQuantity?)>

<!-- 
	The Net value of a single unit that has to be corrected (new price). 
-->
<!ELEMENT UnitNetPriceCorrection (Money, PriceBasisQuantity?)>

<!-- 
	Defines all the item related additional prices. 
-->
<!ELEMENT AdditionalPrices (UnitGrossPrice?, InformationalPrice?,  InformationalPriceExclTax?, UnitNetPriceCorrection?)>

<!-- 
	Defines product/item related indicators. 
-->
<!ELEMENT ItemIndicator EMPTY>
<!-- 
	@attr domain Specifies the type of the Indicator. Suggested values are:
		<ul>
		<li>InvoiceUnitIndicator - Indicator specifies the unit as basis for invoicing ("price per unit").</li>
		<li>ConsumerUnitIndicator - Indicator will be set if the specified unit is used from the consumer/consumption 
			process (for instance "gallons" or "liters").</li>
		<li>ReturnableContainerIndicator - Indicator will be set if the packaging/container shall be returned to the 
			sender and will be re-used.</li>
		<li>TradeUnitIndicator - Indicator will be set if the specified unit is used to describe the trading unit (for 
			instance "barrel" for oil).</li>
		<li>DutyIndicator - Specifies that the current line item has a special fee.</li>
		<li>CommisionIndicator - Marks the actual position/line item has a provision.</li>
		</ul>
		
	 @attr value Value of the indicator. 
-->
<!ATTLIST ItemIndicator
    domain  %string;   #REQUIRED
    value  %string;    #REQUIRED
>


<!-- 
    Contains public sector procurement identifiers associated with a Government procurement instrument. 
	This element provides Procurement Instrument Identifier (PIID) information, commonly referred to as a Smart Number, 
	along with document and modification references used to support contract, purchase order, task order, delivery order,
	and contract lifecycle management.
	OrderReferencePublicSector is used to uniquely identify a Government procurement document and its associated modifications, 
	enabling traceability, auditability, and compliance with public sector acquisition requirements. 
-->
<!ELEMENT OrderReferencePublicSector EMPTY >

<!-- 
    @attr smartNumber The Government-assigned Procurement Instrument Identifier (PIID).
        The PIID uniquely identifies a contract, purchase order, agreement, task order, delivery order, 
		or other acquisition instrument and serves as the primary reference between buying organizations and suppliers. 
    @attr smartDocumentNumber The government document number associated with the procurement instrument. 
	    This identifier is used to track the specific procurement document within the acquisition process. 
    
	@attr modificationNumber: The modification number assigned to a change, amendment, revision, 
	    or supplemental action against the procurement instrument.
		This value supports version control and auditability of procurement transactions.
--> 
<!ATTLIST OrderReferencePublicSector 
    smartNumber			 %string;  #REQUIRED 
    smartDocumentNumber	 %string;  #IMPLIED 
    modificationNumber   %string;  #IMPLIED 
> 

<!--
    Defines public sector industry details associated with order reference.
	    OrderReferencePublicSector: Contains information specific to the public sector industry, 
		including the SmartNumber and optional extrinsic attributes. 
--> 
<!ELEMENT OrderReferenceIndustry (OrderReferencePublicSector?)> 

 

<!-- 
    Public Sector procurement information. 
    The PublicSector element contains industry-specific information used in public sector transactions. 
	It provides identifiers and status information that support government purchasing processes and
    document lifecycle tracking. 
    
	OrderReferenceIndustry: Contains industry-related information for order reference. 
--> 
<!ELEMENT PublicSector (OrderReferenceIndustry, Extrinsic*) >

<!-- 
    @attr headerStatus specifies the current processing status of the procurement document within the public sector procurement lifecycle. The possible values are: 

    <ul>
        <li>active - The document is active and in effect. </li>
        <li>deleted - The document has been deleted. </li>
        <li>rejected - The document has been rejected. </li>
        <li>followOnDocCreated - A subsequent document has been created from this document. The document is still active.</li>
        <li>completed - Processing of the document has been completed. </li>
        <li>closed - The document has been closed and is no longer available for further processing. </li>
    </ul>
-->
<!ATTLIST PublicSector 
    headerStatus (active | deleted | rejected | followOnDocCreated | completed | closed) #IMPLIED
>

<!-- 

    Contains industry-specific elements. 
    ItemReferencePublicSector: contains information specific to public sector. It captures contract-related details associated with an item reference and allows additional custom information to be included. 
--> 
<!ELEMENT ItemReferenceIndustry (ItemReferencePublicSector?)> 

<!-- 
    Contains information relevant to the public sector industry. 

	IdReference: A contract line item is a specific line item within a government contract that defines what is being purchased, in what quantity, and at what price. specifies the contract line item number(CLIN) or subline item number (SLIN) information 

	Extrinsic: Contains any additional information related to the ItemReferencePublicSector element.
-->
<!ELEMENT ItemReferencePublicSector (IdReference, Extrinsic*)> 

<!-- 
    Contains public sector-specific information for receipt item reference. 
    
    IdReference: A contract line item is a specific line item within a government contract that defines what is being purchased, 
    in what quantity, and at what price. specifies the contract line item number(CLIN) or subline item number(SLIN) information 
    
    Extrinsic: Contains optional custom or supplementary information applicable to the ReceiptItemReferencePublicSector element. 
-->
<!ELEMENT ReceiptItemReferencePublicSector (IdReference, Extrinsic*)> 