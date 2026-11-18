
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
    Defines invoice information specific to labor items.

    Contractor: The contractor whose work is being invoiced.

    JobDescription: Detailed description of the job for this labor line item.

    Supervisor: Supervisor of the contractor whose work is being invoiced.

    WorkLocation: The work location of the contractor whose work is being invoiced.

    InvoiceTimeCardDetail: Invoice details for labor reported on a time card. The pay code 
		for this invoice line item is in the UnitRate of the containing 
		InvoiceDetailServiceItem element.
-->
<!ELEMENT InvoiceLaborDetail (Contractor?, JobDescription?, Supervisor?, WorkLocation?,  InvoiceTimeCardDetail?)>

<!--
    Captures details about a timecard related (temp labor) service.

    TimeCardReference: Provides a clear reference to a prior TimeCard
        cXML document.

    TimeCardIDInfo: Unique ID for the timecard as sent on the TimeCard document during
        TimeCardInfoRequest or TimeCardRequest messages.
-->
<!ELEMENT InvoiceTimeCardDetail ((TimeCardReference | TimeCardIDInfo))>
<!--
	Provides a clear reference to a prior TimeCard document.
-->
<!ELEMENT TimeCardReference (DocumentReference)>
<!--
	@attr timeCardID Unique ID for the timecard as sent on the TimeCard document during 
		TimeCardInfoRequest or TimeCardRequest.
-->
<!ATTLIST TimeCardReference
	timeCardID %string; #IMPLIED
>

<!--
    Defines the unique ID of the timecard known to the buyer and supplier systems.
-->
<!ELEMENT TimeCardIDInfo EMPTY>
<!--
	@attr timeCardID Unique ID for the timecard as sent on the TimeCard document during 
		TimeCardInfoRequest or TimeCardRequest.
-->
<!ATTLIST TimeCardIDInfo
	timeCardID %string; #REQUIRED
>
