
<!--
    For cXML license agreement information, please see
    http://www.cxml.org/home/license.asp

    $Id$
-->

<!--
    For more information about these elements/entities, see the 
    cXML Reference Guide and related documents.
-->

<!--
    Note: In InvoiceDetailRequest, positive amounts are debit the
    buyer owes the supplier; negative amounts are credit given back to the
    buyer by the supplier. For example, the supplier can use a SubtotalAmount
    of -50 USD to indicate credit of 50 USD given back to the buyer.

    Also note that all amounts at invoice line level should add up
    to the total specified in InvoiceDetailSummary.
-->

<!--
    Defines a party involved in invoicing, including Issuer Of Invoice (issuerOfInvoice), 
	Sold to (soldTo), Bill to (billTo), Remit to (remitTo), etc. This element should 
	NOT be used for specifying ship from and ship to. For that purpose, InvoiceDetailShipping 
	should be used.

    Contact: Contact information of the invoice partner. Allowed contact
        roles include issuerOfInvoice, soldTo, billTo, and remitTo.

    IdReference: Partner reference ID, including account #, ERP account payable ID,
        ERP account receivable ID, bank routing ID for remittance, supplier
        tax ID, VAT ID, 1099 ID, court register ID, tax exemption ID, and so on.
-->
<!ELEMENT InvoicePartner (Contact, IdReference*)>

<!--
    Defines invoice header level indicators describing overall
    attributes of this invoice. By default, all indicators are false.
-->
<!ELEMENT InvoiceDetailHeaderIndicator EMPTY>
<!--
    @attr isHeaderInvoice Category of the invoice. Possible values:
		<ul>
		<li>yes - Header invoice. Invoice uses InvoiceDetailHeaderOrder, which contains 
			header level invoice information without item details.</li>
		<li>Not specified - Detail invoice. Invoice uses InvoiceDetailOrder, which 
			contains item details.</li>
		</ul>

    @attr isVatRecoverable Set to "yes" to indicate that the entire invoice is 
		VAT-recoverable.

    @attr isPriceBasedLineLevelCreditMemo Set to "yes" to indicate that the invoice 
		is a price-based, line-level credit memo for an early payment discount granted 
		after the original invoice was issued.
-->
<!ATTLIST InvoiceDetailHeaderIndicator
    isHeaderInvoice                   (yes)      #IMPLIED
    isVatRecoverable                  (yes)      #IMPLIED
    isPriceBasedLineLevelCreditMemo   (yes)      #IMPLIED
>

<!--
    Defines invoice line level indicators indicating certain
    information is provided at invoice line level (in InvoiceDetailItem
    or InvoiceDetailOrderSummary). By default, all indicators are false.

    If an indicator indicates certain information (for example, tax, shipping, and so on)
    will be provided at invoice line level, for invoice lines which do not provide such 
	information, they will be assumed to have values of zero, or "not available", 
	whichever is appropriate, for that information.
-->
<!ELEMENT InvoiceDetailLineIndicator EMPTY>
<!--
    @attr isTaxInLine Set to "yes" if tax info (Tax) is provided at invoice line level.

    @attr isSpecialHandlingInLine Set to "yes" if special handling info (InvoiceDetailLineSpecialHandling)
        is provided at invoice line level.

    @attr isShippingInLine Set to "yes" if shipping info (InvoiceDetailLineShipping) is provided
        at invoice line level.

    @attr isDiscountInLine Set to "yes" if discount info (InvoiceDetailDiscount) is provided
        at invoice line level.

    @attr isAccountingInLine Set to "yes" if accounting distribution info (Distribution) is provided at
        invoice line level. If isHeaderInvoice is true, this indicator must
        be false because Distribution is only available at item level.

    @attr isPriceAdjustmentInLine Set to "yes" if a line-item credit memo or debit memo has a price adjustment.
-->
<!ATTLIST InvoiceDetailLineIndicator
    isTaxInLine                            (yes)      #IMPLIED
    isSpecialHandlingInLine                (yes)      #IMPLIED
    isShippingInLine                       (yes)      #IMPLIED
    isDiscountInLine                       (yes)      #IMPLIED
    isAccountingInLine                     (yes)      #IMPLIED
    isPriceAdjustmentInLine                (yes)      #IMPLIED
>

<!--
    Defines information related to an order, including order
    reference and related master agreement reference, if any.

    The various content options of InvoiceDetailOrderInfo are in order
    of preference, that is, OrderReference is strongly recommended. If
    that is not possible, MasterAgreementReference, MasterAgreementIDInfo,
    OrderIDInfo, or SupplierOrderInfo should be used, in that order.

    OrderReference: The reference to the order being invoiced.

    MasterAgreementReference: The reference to the corresponding master 
		agreement if the order being invoiced is a release.

    MasterAgreementIDInfo: The buyer system id of the corresponding master 
		agreement if the order being invoiced is a release.

    OrderIDInfo: The buyer system order id of the order.

    SupplierOrderInfo: Supplier sales order info of this order.
-->
<!ELEMENT InvoiceDetailOrderInfo
    ( (OrderReference, (MasterAgreementReference | MasterAgreementIDInfo)?,
        SupplierOrderInfo?) |
      (MasterAgreementReference, OrderIDInfo?, SupplierOrderInfo?) |
      (MasterAgreementIDInfo, OrderIDInfo?, SupplierOrderInfo?) |
      (OrderIDInfo, SupplierOrderInfo?) |
      SupplierOrderInfo )>

<!--
    Defines the shipping information related to this invoice.

    Contact: The ship from and ship to addresses. Both ship from and ship to
        must be specified. Allowed contact roles are shipFrom, shipTo and
        carrierCorporate.

    CarrierIdentifier: This list may include multiple identifiers for the 
		same carrier. Elements in this list may appear in any order. A 
		particular identification domain (CarrierIdentifier@domain attribute
        value) must not appear more than once in an InvoiceDetailShipping
        element. The identification provided by all elements of the
        CarrierIdentifier list must correspond to the same company.

    ShipmentIdentifier: The tracking number of this shipment or a bill of 
		lading number, depending on the domain attribute.

    DocumentReference: The reference to an earlier ShipNoticeRequest.
-->
<!ELEMENT InvoiceDetailShipping (Contact, Contact+,
                                 (CarrierIdentifier+, ShipmentIdentifier+)?,
                                 DocumentReference?)>
<!--
    @attr shippingDate The date and time this shipment leaves the supplier.
-->
<!ATTLIST InvoiceDetailShipping
    shippingDate             %datetime.tz;          #IMPLIED
>

<!--
	Defines a payment term.

    DEPRECATED in cXML 1.2.011. Do not use. Use PaymentTerm instead.
-->
<!ELEMENT InvoiceDetailPaymentTerm EMPTY>
<!--
    @attr payInNumberOfDays The number of days after invoice date to pay in full.

    @attr percentageRate Discount rate as a percentage for the payment
        term defined in the corresponding payInNumberOfDays.
        Positive means discount and negative means penalty.
-->
<!ATTLIST InvoiceDetailPaymentTerm
    payInNumberOfDays        %uint;         #REQUIRED
    percentageRate           %r8;           #REQUIRED
>

<!-- 
    Defines PaymentInformation for the document that Buyers can provide in
    ERP Copy Invoices and ERS invoices.
    Used to indicate the date after which the invoice has to be paid without any discount
-->
<!ELEMENT PaymentInformation EMPTY>
<!-- 
    @attr paymentNetDueDate The date after which the invoice has to be paid without any discount.
-->
<!ATTLIST PaymentInformation
    paymentNetDueDate         %datetime.tz;  #IMPLIED
>

<!--
    Defines discount applied to the line item.

    Money: The total discount in dollar (or other currency) amount.

    Distribution: Accounting distribution information, including cost center, GL#, and so on.
-->
<!ELEMENT InvoiceDetailDiscount (Money, Distribution*)>
<!--
    @attr percentageRate The discount rate as a percentage. Positive rates denote 
		discounts and negative rates denote penalties. Do not include a percentage 
		sign (\%) or divide by 100. For example, "2" means 2\%.
-->
<!ATTLIST InvoiceDetailDiscount
    percentageRate          %r8;           #IMPLIED
>

<!--
    Represents the additional Charges and Allowances
    that are incurred for the total landed cost of the goods and service 
    contained in this invoice item.

    Modification: Provides the details of a Charge or an Allowance.
-->
<!ELEMENT InvoiceItemModifications (Modification+)>

<!--
    Represents the additional Charges, Allowances that are incurred for the total landed 
	cost of the goods and services within the invoice header. This value specified at 
	the header-level is not the aggregated value towards the charges or allowances 
	available for the line items.

    Modification: Provides the details of a Charge or an Allowance.
-->
<!ELEMENT InvoiceHeaderModifications (Modification+)>

<!--
    Defines the summary information of an InvoiceDetailRequest.

    SubtotalAmount: Sum of amount of all quantities.

    Tax: Tax information.

    SpecialHandlingAmount: Special handling charge.

    ShippingAmount: Shipping charge.

    InvoiceDetailDiscount: The total discount applied in this InvoiceDetailRequest.
        Its contained percentageRate attribute will be ignored if isDiscountInLine 
		is true.

    InvoiceHeaderModifications: The additional Charges, Allowances and their Taxes that are 
		incurred for the total landed cost of the goods and services within the invoice
        header. This value specified at the header-level  is not the aggregated
        value towards the charges or allowances available for the line items.
    
	InvoiceDetailSummaryLineItemModifications: Summary of all modifications applied on the 
		goods and services at the line item level in an invoice.
	
    TotalCharges: The total sum of all the charges applied on the goods and services at 
        the header-level and  line item level in an invoice.

    TotalAllowances: The total sum of all the allowances applied on the goods and services
        at the header-level and  line item level in an invoice.

    TotalAmountWithoutTax: The total sum of the SubTotal, Charges (including special 
		handling charges and shipping charges), Allowances (including discounts) applied at 
		the header-level and line item level in an invoice. This does not include taxes.
    
    GrossAmount: Sum of subtotal, taxes, special handling charges, and shipping charges, 
		before discounts.

    InvoiceItemModificationsTotalAmount: Represents the  sum total of all the charges, allowances, 
		and their taxes applied on the goods and services at the line item level in an invoice.

    NetAmount: Gross amount minus discounts.

    DepositAmount: Total deposit/prepayment amount.

    DueAmount: Total amount due and payable. It equals NetAmount minus DepositAmount. If 
		InvoiceDetailRequestHeader@purpose is "creditMemo" or "lineLevelCreditMemo", this 
		amount must be negative. If InvoiceDetailRequestHeader@purpose is "debitMemo", this 
		amount must be positive.
    
    InvoiceDetailSummaryIndustry: Industry specific summary level data is specified in this 
		element.

-->
<!ELEMENT InvoiceDetailSummary (SubtotalAmount, Tax, SpecialHandlingAmount?,
                                ShippingAmount?, GrossAmount?,
                                InvoiceDetailDiscount?, InvoiceHeaderModifications?, InvoiceDetailSummaryLineItemModifications?,
								TotalCharges?, TotalAllowances?, TotalAmountWithoutTax?, NetAmount,
                                DepositAmount?, DueAmount?, InvoiceDetailSummaryIndustry?)>

<!--
    Defines all references related to a line item in this invoice.

    ItemID: The supplier part number of current line item, copied from
        OrderRequest.

    Description: The line item description, copied from OrderRequest.

    Classification: The classification code for of the line item.

    ManufacturerPartID: The manufacturer part number.

    ManufacturerName: The name of the manufacturer.

    Country: The country of origin of the current line item.

    SerialNumber: Defines one or more serial numbers for accountable items that
        are being invoiced. If serial numbers are being reported, then
        the number of serial numbers should match the invoice
        quantity. The specification does not enforce this. Rather, it
        is the responsibility of buyer and supplier implementers to
        validate this count if appropriate. SerialNumber should be
        used instead of the InvoiceDetailItemReference@serialNumber
        attribute, which is now deprecated. It is not valid to use
        both the attribute and the SerialNumber element.

	SupplierBatchID: Batch ID is assigned to material that is manufactured in 
		batches or production lots to a specific batch number.

    InvoiceDetailItemReferenceIndustry: Industry specific item detail data is 
		specified in this element.
-->
<!ELEMENT InvoiceDetailItemReference (ItemID?, Description?, Classification*,
                                      (ManufacturerPartID, ManufacturerName)?,
                                      Country?, SerialNumber*, SupplierBatchID?, InvoiceDetailItemReferenceIndustry?)>
<!--
    @attr lineNumber The line number of current line item, copied from OrderRequest.

    @attr serialNumber The product serial number for the current line item.
		DEPRECATED in cXML 1.2.009. Use SerialNumber elements instead.
-->
<!ATTLIST InvoiceDetailItemReference
    lineNumber      %uint;         #REQUIRED
    serialNumber    %string;       #IMPLIED
>

<!--
    Defines all references related to a service line item in this invoice.

    Classification: The classification information of the service.

    ItemID: The supplier part number of the service.

    Description: The description of the service.
-->
<!ELEMENT InvoiceDetailServiceItemReference (Classification*, ItemID?, Description?)>
<!--
    @attr lineNumber The line number of current line item on the master agreement. This 
		value is required if the item being invoiced is part of a detailed master agreement 
		that specifies detailed pricing terms at the line item or commodity level. It is 
		optional if the item being invoiced is part of a master supplier agreement or 
		blanket purchase order which do not contain detailed line item pricing information.
-->
<!ATTLIST InvoiceDetailServiceItemReference
    lineNumber      %uint;         #IMPLIED
>

<!--
    The ServiceEntryItemReference element provides a clear reference to the line item
    in a prior ServiceEntryRequest document.

	DocumentReference: The reference to a prior ServiceEntryRequest.
-->
<!ELEMENT ServiceEntryItemReference (DocumentReference)>
<!--
	@attr serviceLineNumber Refers to the line number in the related ServiceEntryRequest 
		for the item.

	@attr serviceEntryID The ID for the related ServiceEntryRequest. If present, it must 
		be copied from the ServiceEntryRequestHeader.

	@attr serviceEntryDate The date and time when the supplier created the service sheet. 
		If present, it must be copied from the ServiceEntryRequestHeader.
-->
<!ATTLIST ServiceEntryItemReference
    serviceLineNumber        	%uint;         		#REQUIRED
    serviceEntryID              %string;            #IMPLIED
    serviceEntryDate            %datetime.tz;       #IMPLIED
>

<!--
	The ServiceEntryItemIDInfo element provides a clear reference to the line item
	in a prior ServiceEntryRequest document.
-->
<!ELEMENT ServiceEntryItemIDInfo (IdReference*)>
<!--
	@attr serviceLineNumber The line number of current line item, copied from ServiceEntryRequest.

	@attr serviceEntryID The ID of a service entry sheet known to the buyer system. Basically, what
       the service entry sheet number is today.

	@attr serviceEntryDate The date and time the service entry sheet was created. If present, 
		must be copied directly from the referenced ServiceEntryRequest document's 
		ServiceEntryRequestHeader.
-->
<!ATTLIST ServiceEntryItemIDInfo
    serviceLineNumber        	%uint;         		#REQUIRED
    serviceEntryID              %string;            #REQUIRED
    serviceEntryDate            %datetime.tz;       #IMPLIED
>

<!--
    Defines special handling information of the current invoice line.

    Description: Textual description of the special handling.

    Money: The special handling amount.

    Distribution: Accounting distribution information, including cost center, GL#, and so on.
-->
<!ELEMENT InvoiceDetailLineSpecialHandling (Description?,
                                            Money,
                                            Distribution*)>

<!--
    Defines shipping information of the current invoice line.

    InvoiceDetailShipping: The shipping details.

    Money: The shipping amount.

    Distribution: Accounting distribution information, including cost center, GL#, and so on.
-->
<!ELEMENT InvoiceDetailLineShipping (InvoiceDetailShipping, Money, Distribution*)>

<!--
    Defines a line item in the InvoiceDetailRequest.

    UnitOfMeasure: The unit of measure.

    UnitPrice: The unit price.

    InvoiceDetailItemReference: The references related to this line item.
    
    ReceiptLineItemReference: The reference to the receipt line related to this line item.
    
    ShipNoticeLineItemReference: The reference to the ship notice line related to this 
		line item.

    ServiceEntryItemReference: The clear reference to the line item in a prior 
		ServiceEntryRequest document.

	ServiceEntryItemIDInfo: The clear reference to the line item in a prior 
		ServiceEntryRequest document.

    ProductMovementItemIDInfo: Movement line item from a consignment movement document 
		that is invoiced

    SubtotalAmount: The invoice subtotal of the current item = unit price x
        invoiced quantity.

    Tax: The tax info for this line item. It will be ignored if isTaxInLine
        is false.

    InvoiceDetailLineSpecialHandling: The special handling info for this line item. 
		It will be ignored if isSpecialHandlingInLine is false.

    InvoiceDetailLineShipping: The shipping info for this line item. It will be ignored if
        isShippingInLine is false.

    ShipNoticeIDInfo: References shipment related document identifiers.

    GrossAmount: The SubtotalAmount plus taxes, shipping, and special handling
        charges.

    InvoiceDetailDiscount: The discount info for this line item. It will be ignored if
        isDiscountInLine is false.

    InvoiceItemModifications: The additional Charges, Allowances and their Taxes 
		that are incurred for the total landed cost of the goods and service 
        contained in this invoice item.

    TotalCharges: The total sum of all the charges applied on the goods and 
        services at the line item level in an invoice.

    TotalAllowances: The total sum of all the allowances applied on the goods and
        services at the line item level in an invoice.

    TotalAmountWithoutTax: The total sum of the SubTotal, Charges (including special 
		handling charges and shipping charges), Allowances (including discounts) 
        applied at the line item level in an invoice. This does not include taxes.
    
    NetAmount: The Gross Amount minus discount amount.

    Distribution: Accounting distribution information, including cost center, GL#, etc.
        It will be ignored if isAccountingInLine is false.

    Packaging: Details about the packaging of this invoiced item.

    InvoiceDetailItemIndustry: Industry specific line item detail data is specified 
		in this element.

    Comments: Textual comments for this line item.

    CustomsInfo: Defines specific customs information data for this invoice item, this 
		complementary information applies for imported invoice items.

    Extrinsic: Additional information related to this line item. Should not
        duplicate anything in InvoiceDetailItem or InvoiceDetailOrder.
-->
<!ELEMENT InvoiceDetailItem (UnitOfMeasure, UnitPrice, PriceBasisQuantity?,
                             InvoiceDetailItemReference,
                             ReceiptLineItemReference?,
                             ShipNoticeLineItemReference?,
                             (ServiceEntryItemReference | ServiceEntryItemIDInfo)?,
                             ProductMovementItemIDInfo?,
                             SubtotalAmount?,
                             Tax?, InvoiceDetailLineSpecialHandling?,
                             InvoiceDetailLineShipping?, ShipNoticeIDInfo?, GrossAmount?,
                             InvoiceDetailDiscount?, InvoiceItemModifications?, TotalCharges?, 
                             TotalAllowances?, TotalAmountWithoutTax?, NetAmount?,
                             Distribution*, Packaging*, InvoiceDetailItemIndustry?, Comments?, CustomsInfo?, Extrinsic*)>
<!--
    @attr invoiceLineNumber Supplier defined ID for the current invoice line. Should be unique across all 
		invoice lines within an invoice.

    @attr quantity The quantity being invoiced for the line item.

	@attr referenceDate The reference date for the blanket order or contract item. The usage of this attribute 
		is optional in most cases, and must be defined by the trading partners involved in the transaction. 
		Procurement software might use this date in reconciling an invoice against a blanket order or contract.

    @attr inspectionDate The date when the transfer of goods or the delivery of services occurs according to 
		legal tax definitions. The usage of this attribute is optional in most cases, and must be defined by 
		the trading partners involved in the transaction.

    @attr parentInvoiceLineNumber Specifies the line number of the corresponding parent line item. This 
		attribute is applicable only for a line item with itemType="item".

    @attr itemType Specifies the type of item. Possible values:
		<ul>
		<li>composite - Identifies an item group.</li>
		<li>item - Identifies an independent line item.</li>
		<li>lean - Indicates that no child item is expected for the line.</li>
		</ul>
	
	@attr compositeItemType Specifies whether a parent item uses group-level pricing. Possible values are 
		"groupLevel" or "itemLevel".
    
    @attr reason Specifies the reason for a line-item credit memo. The only possible value for reason is "return", 
		which means the credit memo is for a return item.

    @attr isAdHoc Set to "yes" to indicate that the item does not exist in the reference document or contract 
		master agreement.
-->
<!ATTLIST InvoiceDetailItem
    invoiceLineNumber        %uint;         #REQUIRED
    quantity                 %r8;           #REQUIRED
    referenceDate            %datetime.tz;  #IMPLIED
    inspectionDate           %datetime.tz;  #IMPLIED
    parentInvoiceLineNumber  %uint;         #IMPLIED
    itemType                 %lineItemType; #IMPLIED
	compositeItemType		 %compositeItemType;		#IMPLIED
    reason                   (return)       #IMPLIED
    isAdHoc                  (yes)          #IMPLIED 
>

<!--
    Defines a service line item in the InvoiceDetailRequest.

    InvoiceDetailServiceItemReference: The references related to this line item.

    ServiceEntryItemReference: The clear reference to the line item in a prior ServiceEntryRequest document.

	ServiceEntryItemIDInfo: The clear reference to the line item in a prior ServiceEntryRequest document.

    SubtotalAmount: The invoice subtotal of the current service item. If unit price and invoiced quantity 
		are specified, then subtotal should be equal to the product of them.

    Period: The period during which the service was rendered.

    UnitRate: The rate at which service item is charged. Use of the UnitRate element is recommended 
		over the plain (UnitOfMeasure, UnitPrice) pair, as the UnitRate element includes the rate code. 
		For some services like temp labor services UnitRate is required.

    UnitOfMeasure: (DEPRECATED) The unit of measure. For ex: HUR (per hour), MON (per month), etc. Use of
		UnitRate is recommended over use of this element.

    UnitPrice: (DEPRECATED) The unit price if any. Use of UnitRate is recommended over use 
		of this element.

    Tax: The tax info for this line item. It will be ignored if isTaxInLine is false.

    GrossAmount: The SubtotalAmount plus taxes, shipping, and special handling charges.

    InvoiceDetailDiscount: The discount info for this line item. It will be ignored if
        isDiscountInLine is false.

    InvoiceItemModifications: The additional Charges, Allowances and their Taxes that are 
        incurred for the total landed cost of the goods and service 
        contained in this invoice item.

    TotalCharges: The total sum of all the charges applied on the goods and 
        services at the line item level in an invoice.

    TotalAllowances: The total sum of all the allowances applied on the goods and
        services at the line item level in an invoice.

    TotalAmountWithoutTax: The total sum of the SubTotal, Charges (including special handling
        charges and shipping charges), Allowances (including discounts) 
        applied at the line item level in an invoice. This does not include taxes.
    
    NetAmount: The Gross Amount minus discount amount.

    Distribution: Accounting distribution information, including cost center, GL#, etc.
        It will be ignored if isAccountingInLine is false.

    Comments: Textual comments for this line item.

    InvoiceLaborDetail: Additional details for a particular type of spend category will be specified here.
        For example, for timecard related(temp labor) services, extra info like the 
        TimeCard document reference, Contractor, and so on, can be specified.
    
    Extrinsic: Additional information related to this line item. Should not duplicate
        anything in InvoiceDetailItem or InvoiceDetailOrder. Other line item related
        attributes such as "union/non-union" should be specified in 
        extrinsic elements.
-->
<!ELEMENT InvoiceDetailServiceItem (
                             InvoiceDetailServiceItemReference,
                             (ServiceEntryItemReference | ServiceEntryItemIDInfo)?,
                             SubtotalAmount,
                             Period?, 
                             (UnitRate | (UnitOfMeasure, UnitPrice, PriceBasisQuantity?))?,
                             Tax?,
                             GrossAmount?,
                             InvoiceDetailDiscount?, InvoiceItemModifications?, TotalCharges?, 
                             TotalAllowances?, TotalAmountWithoutTax?, NetAmount?,
                             Distribution*, Comments?, 
                             (InvoiceLaborDetail)?,
                             Extrinsic*)>

<!--
    @attr invoiceLineNumber Supplier defined ID for the current invoice line. Should be unique across 
		all invoice lines within an invoice.

    @attr quantity The quantity being invoiced for the line item. For service items, quantity 
		represents the number of units of service rendered. For example, 2 hours of service, where 
		UnitOfMeasure is “HUR”

    @attr referenceDate The reference date for the service item. This can indicate the date at 
		which the service line item is being invoiced.

    @attr inspectionDate The date when the transfer of goods or the delivery of services occurs 
		according to legal tax definitions. The usage of this attribute is optional in most cases, 
		and must be defined by the trading partners involved in the transaction.
	
	@attr parentInvoiceLineNumber To specify the line number of the corresponding parent line item. 
		This field is applicable only for a line item with itemType="item".
	
    @attr itemType Specifies the type of item. Possible values:
		<ul>
		<li>composite - Identifies an item group.</li>
		<li>item - Identifies an independent line item.</li>
		<li>lean - Indicates that no child item is expected for the line.</li>
		</ul>

    @attr isAdHoc Set to "yes" to indicate that the item does not exist in the reference document or 
		contract master agreement.
-->
<!ATTLIST InvoiceDetailServiceItem
    invoiceLineNumber        %uint;         #REQUIRED
    quantity                 %r8;           #IMPLIED
    referenceDate            %datetime.tz;  #IMPLIED
    inspectionDate           %datetime.tz;  #IMPLIED
    parentInvoiceLineNumber  %uint;         #IMPLIED
    itemType                 %lineItemType; #IMPLIED  
    isAdHoc                  (yes)          #IMPLIED
>

<!--
    Defines header level summary info of an order or master agreement in an invoice
    line.

    SubtotalAmount: The invoice subtotal of this order or master agreement.

    Period: The period during which the service was rendered. It should only be used for
        header level summary info for services, and it does not apply to goods.

    Tax: The tax info for this order or master agreement. It will be ignored if
        isTaxInLine is false.

    InvoiceDetailLineSpecialHandling: The special handling info for this order or master 
		agreement. It will be ignored if isSpecialHandlingInLine is false. It should only be 
		used for header level summary info for goods, and it does not apply to services.

    InvoiceDetailLineShipping: The shipping info for this order. It will be ignored if 
		isShippingInLine is false. It should only be used for header level summary info 
		for goods, and it does not apply to services.

    GrossAmount: The SubtotalAmount plus taxes, shipping, and special handling
        charges.

    InvoiceDetailDiscount: The discount info for this order. It will be ignored if
        isDiscountInLine is false.

    NetAmount: The GrossAmount minus discount amount.

    Comments: Textual comments for this line item.

    Extrinsic: Additional information related to this line item. Should not
        duplicate anything in InvoiceDetailOrderSummary or
        InvoiceDetailHeaderOrder.
-->
<!ELEMENT InvoiceDetailOrderSummary (SubtotalAmount, Period?, Tax?,
                                     InvoiceDetailLineSpecialHandling?,
                                     InvoiceDetailLineShipping?,
                                     GrossAmount?, InvoiceDetailDiscount?,
                                     NetAmount?, Comments?, Extrinsic*)>
<!--
    @attr invoiceLineNumber Supplier defined ID for the current invoice line. It should be 
		unique across all invoice lines of the same InvoiceDetailRequest.

    @attr inspectionDate The date when the transfer of goods or the delivery of services 
		occurs according to legal tax definitions. The usage of this attribute is optional 
		in most cases, and must be defined by the trading partners involved in the transaction.
-->
<!ATTLIST InvoiceDetailOrderSummary
    invoiceLineNumber        %uint;         #REQUIRED
    inspectionDate           %datetime.tz;  #IMPLIED
>

<!--
    Defines the header invoice information of an order without item details,
    used ONLY when isHeaderInvoice is true.

    In this case, an invoice line is an InvoiceDetailHeaderOrder
    and its invoice line number is InvoiceDetailHeaderOrder/
    InvoiceDetailOrderSummary@invoiceLineNumber.

    InvoiceDetailOrderInfo: The reference information of the order.

    InvoiceDetailOrderSummary: The header level invoice info of the order.
-->
<!ELEMENT InvoiceDetailHeaderOrder
    (InvoiceDetailOrderInfo, InvoiceDetailOrderSummary)>

<!--
    Defines the invoice information of an order or master agreement with item details,
    used ONLY when isHeaderInvoice is false.

    In this case, an invoice line is an InvoiceDetailItem and its invoice
    line number is InvoiceDetailItem@invoiceLineNumber.

    InvoiceDetailOrderInfo: The reference information of the order or 
		master agreement.

    InvoiceDetailReceiptInfo: The reference information of the receipt.

    InvoiceDetailShipNoticeInfo: The reference information of the ship notice.

    InvoiceDetailItem: The information of an item in the order.

    InvoiceDetailServiceItem: The information of a service item in the master agreement.
-->
<!ELEMENT InvoiceDetailOrder (InvoiceDetailOrderInfo, InvoiceDetailReceiptInfo?, InvoiceDetailShipNoticeInfo?,
                              (InvoiceDetailItem | InvoiceDetailServiceItem)+)>

<!--
    Defines the header information of an InvoiceDetailRequest.

    InvoiceDetailHeaderIndicator: Header level indicators describing overall attributes of this
        invoice.

    InvoiceDetailLineIndicator: Header level indicators indicating certain information 
		is provided at invoice line level (in InvoiceDetailItem or InvoiceDetailOrderSummary).

    InvoicePartner: All partners invoiced in invoicing, including Sold to,
        Bill to, Remit to, Issuer of Invoice, and so on.

    DocumentReference: Reference to an earlier InvoiceDetailRequest. If the
        attribute InvoiceDetailRequestHeader@operation is "delete",
        the DocumentReference is required and it must reference the
        original InvoiceDetailRequest document (with value "new" for
        its attribute InvoiceDetailRequestHeader@operation) during the
        same invoicing process. If the attribute
        InvoiceDetailRequestHeader@purpose is "lineLevelCreditMemo",
        the DocumentReference is required and must identify the
        original invoice against which the credit is applied. In all
        other situations, the DocumentReference is optional and, if it
        is provided, it must reference the InvoiceDetailRequest which
        is related to the current InvoiceDetailRequest.

    InvoiceIDInfo: Reference to an earlier InvoiceDetailRequest. If both
        DocumentReference and InvoiceIDInfo are provided, they must
        refer to the same invoice.

    PaymentProposalIDInfo: Reference to an earlier PaymentProposalRequest.
        In case of priceBasedLineLevelCreditMemo, this element will be populated. 

    InvoiceDetailShipping: The shipping details of this invoice. It will be ignored if
        isShippingInLine is true.

    ShipNoticeIDInfo: References shipment related document identifiers.

    InvoiceDetailPaymentTerm: DEPRECATED in cXML 1.2.011. Do not use. Use PaymentTerm instead.

    PaymentTerm: This defines the payment terms for this invoice.

    Period: The total period during which all the services (specified in this invoice)
        were rendered. This does not imply anything about the Period at the
        line level. 

    Comments: Textual comments for this invoice.

    IdReference: Internal Reference Number/Supplier Reference Number. Can be one of the following:
		<ul>
		<li>Internal supplier number - This is the most common scenario. It represents the document number 
			created by the internal supplier ERP system.</li>
		<li>Contract - The contract number can be used to identify that a specific outbound document 
			is related to a specific contract.</li>
		<li>Internal criteria - Sometimes the supplier can enter a customized value in the field Supplier 
			Reference Number. Example: It can be the name of the person in charge of the follow-up of 
			the transaction.</li>
		</ul>

    Extrinsic: Additional information related to this invoice. Should not
        duplicate anything in InvoiceDetailRequestHeader or InvoiceDetailRequest.
        For service related invoice, header level service extrinsics such 
        as "serviceLocation" can be specified here as follows.
		%
        <Extrinsic name="serviceLocation">
            <Contact role="serviceLocation">
                <Name>XYZ Inc</Name>
                <PostalAddress>
                    <Street>123 Easy St</Street>
                    <City>Sunnyvale</City>
                    <State>California</State>
                    <PostalCode>94089</PostalCode>
                    <Country isoCountryCode="US">USA</Country>
                </PostalAddress>
            </Contact>
        </Extrinsic>
		%
-->
<!ELEMENT InvoiceDetailRequestHeader (InvoiceDetailHeaderIndicator,
                                      InvoiceDetailLineIndicator,
                                      InvoicePartner*,
                                      DocumentReference?,
                                      InvoiceIDInfo?,
                                      PaymentProposalIDInfo?,
                                      InvoiceDetailShipping?,
                                      ShipNoticeIDInfo?,
                                      (InvoiceDetailPaymentTerm*|PaymentTerm*),
                                      PaymentInformation?,
                                      Period?,
                                      Comments?,
                                      IdReference*,
                                      Extrinsic*)>
<!--
    @attr invoiceID A supplier-generated identifier for this Invoice. Identical to the
        Invoice Number which appears at the top of a physical Invoice.

    @attr isInformationOnly True if this document is for buyer's information only (i.e. no action
        needs to be taken by the buyer). False if the buyer needs to take
        action upon receiving this document (for example, submit payment or accept
        credit). By default, it is false.

    @attr purpose The purpose of this invoice. Possible values:
		<ul>
		<li>standard (default) - This invoice is a standard billing statement from the
            supplier to the buyer.</li>
        <li>creditMemo - This invoice is a credit memo for giving credit back
            to the buyer by the supplier. In this case, the attribute
            InvoiceDetailHeaderIndicator@isHeaderInvoice must be true.
            Also, the element InvoiceDetailSummary/DueAmount must be
            a negative amount.</li>
        <li>debitMemo - This invoice is a debit memo for billing a balance
            owed by the buyer to the supplier. In this case, the attribute
            InvoiceDetailHeaderIndicator@isHeaderInvoice must be true.
            Also, the element InvoiceDetailSummary/DueAmount must be
            a positive amount.</li>
        <li>lineLevelCreditMemo - This invoice is a line item level credit memo 
            for giving credit back to the buyer by the supplier. In this 
            case, the attribute InvoiceDetailHeaderIndicator@isHeaderInvoice 
            is false. All the line item amounts and hence the 
            InvoiceDetailSummary/DueAmount must be a negative amount.</li>
        <li>lineLevelDebitMemo - This invoice is a line item level debit memo 
            billing a balance owed by the buyer to the supplier.</li>
		</ul>

    @attr operation How this document is acting on the invoice:
		<ul>
		<li>new (default) - This document creates a new invoice.</li>
		<li>delete - This document cancels an existing invoice. That existing
            invoice must be specified as DocumentReference.</li>
		</ul>

    @attr invoiceDate Date and time this Invoice was created (should be earlier than the
        document's timestamp).

    @attr invoiceOrigin Indicates the originator of the invoice for categorization. Possible values:
		<ul>
		<li>supplier - Invoice originated by supplier.</li>
		<li>buyer - Invoice originated by buying organization.</li>
		<li>Not specified - Invoice origin is unknown.</li>
		</ul>
	
	@attr isERS Whether the invoice is an Evaluated Receipt Settlement (ERS) invoice. The only 
		possible value is "yes". If not specified, the invoice is a regular invoice.
-->
<!ATTLIST InvoiceDetailRequestHeader
    invoiceID     %string;                         #REQUIRED
    isInformationOnly
                  (yes)                            #IMPLIED
    purpose       (standard | creditMemo | debitMemo | lineLevelCreditMemo | lineLevelDebitMemo)
                                                   "standard"
    operation     (new | delete)                   "new"
    invoiceDate   %datetime.tz;                    #REQUIRED
    invoiceOrigin   
                  (supplier | buyer)               #IMPLIED
    isERS          (yes)                           #IMPLIED
>

<!--
    Transmits a invoice request to a buyer. Provides order
    references, line item references, partners involved, accounting
    distribution, discount terms, shipping and special handling, applicable
    taxes, deposit and payment, contact and remittance information, etc.

    Suppliers can use InvoiceDetailRequest to send invoice for any
    portion of all or selected line items from single or multiple
    orders. They can also use InvoiceDetailRequest to send cancel invoice
    (InvoiceDetailRequestHeader@operation is "delete"), credit memo,
    debit memo, or receipt (InvoiceDetailRequestHeader@isInformationOnly is
    "yes").

    This document must be sent to the location specified in the buyer's
    ProfileResponse.

    InvoiceDetailRequestHeader: The header information of this invoice.

    InvoiceDetailOrder: The invoice information of an order with item details, 
		used ONLY when isHeaderInvoice is false.

    InvoiceDetailHeaderOrder: The header invoice information of an order 
		without item details, used ONLY when isHeaderInvoice is true.

    InvoiceDetailSummary: The summary information of this invoice.
-->
<!ELEMENT InvoiceDetailRequest
    (InvoiceDetailRequestHeader,
     (InvoiceDetailOrder+ | InvoiceDetailHeaderOrder+),
     InvoiceDetailSummary)>

<!-- 
	Specifies the retail industry specific data for InvoiceDetailSummary element. 
-->
<!ELEMENT InvoiceDetailSummaryRetail (AdditionalAmounts? )>

<!-- 
	Specifies the various industries specific data for InvoiceDetailSummary element. 
-->
<!ELEMENT InvoiceDetailSummaryIndustry (InvoiceDetailSummaryRetail?)>

<!-- 
	Defines the retail industry specific data for InvoiceDetailItemReference element 
    
	EANID: Number assigned to a manufacturer's product according to the International 
		Article Numbering Association for substitution of an article. This is a world-wide 
		largest and most standardized article catalog in retail and CPG.
		DEPRECATED. Use '<IdReference domain="EAN-13">' within 'ItemID' instead.
    
	EuropeanWasteCatalogID: European Waste Catalog is a unique ID for articles listed in the EU 
		Waste Catalog (EWC). It requires special handling.
    
	Characteristic: Defines Product Characteristics like size, color, grade, and so on.
-->
<!ELEMENT InvoiceDetailItemReferenceRetail (EANID?, EuropeanWasteCatalogID?, Characteristic*)>

<!-- 
	Defines the various industries specific categories for InvoiceDetailReferenceItem element. 
-->
<!ELEMENT InvoiceDetailItemReferenceIndustry (InvoiceDetailItemReferenceRetail?)>

<!-- 
	Defines the retail industry specific data for InvoiceDetailItem element.

	AdditionalPrices: Retail industry specific item level additional prices.
	
	TotalRetailAmount: Total retail amount at the item detail level.
	
	ItemIndicator: Product/item level indicators.
	
	PromotionDealID: An ID assigned by the supplier for a special promotional activity. 
		Promotions affect the forward planning/ordering process (and the related pricing). 
    
	PromotionVariantID: The item number is a promotional variant number. Used when only one 
		or some variants of an article are promoted         
-->
<!ELEMENT InvoiceDetailItemRetail (AdditionalPrices?, TotalRetailAmount?, ItemIndicator*, PromotionDealID?, PromotionVariantID?)>

<!-- 
	Defines the various industries specific categories for InvoiceDetailItem element. 
-->
<!ELEMENT InvoiceDetailItemIndustry (InvoiceDetailItemRetail?)>

<!--
    Defines customs reference as complementary information when the item is imported.
		
    Issuer: The information of the issuer related to the imported item.
    
	DocumentInfo: The information of the document related to the imported item.
-->
<!ELEMENT CustomsInfo ( Issuer , DocumentInfo )>

<!--
    The ReceiptLineItemReference element provides a clear 
    reference to the line item in a prior ReceiptRequest document.
-->
<!ELEMENT ReceiptLineItemReference EMPTY>
<!--
    @attr receiptLineNumber Specifies the receipt line number of the current line item, copied from ReceiptRequest. 
-->
<!ATTLIST ReceiptLineItemReference
    receiptLineNumber      %uint;                 #REQUIRED
>

<!--
    Defines information related to an receipt

    The various content options of InvoiceDetailReceiptInfo are in order
    of preference, that is, ReceiptReference is strongly recommended. If
    that is not possible ReceiptIDInfo should be used, in that order.

    ReceiptReference: The reference to the receipt being invoiced.

    ReceiptIDInfo: The buyer system receipt id of the receipt.
-->
<!ELEMENT InvoiceDetailReceiptInfo
    (ReceiptReference | ReceiptIDInfo) >

<!--
    Defines information related to a ship notice

    The various content options of ShipNoticeDetailReceiptInfo are in order
    of preference, that is, ShipNoticeReference is strongly recommended. If
    that is not possible, ShipNoticeIDInfo should be used, in that order.

    ShipNoticeReference: The reference to the ship notice being invoiced.

    ShipNoticeIDInfo: The buyer system ship notice ID of the receipt.
-->
<!ELEMENT InvoiceDetailShipNoticeInfo
    (ShipNoticeReference | ShipNoticeIDInfo) >

<!--
    Defines information related to a summary of line modifications (allowances/charges) in Invoice.

    Modification: Summary of one modification.
-->
<!ELEMENT InvoiceDetailSummaryLineItemModifications (Modification+)>
