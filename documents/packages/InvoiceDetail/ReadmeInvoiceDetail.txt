
10/24/2001
----------
The example InvoiceDetailRequest.xml file contained an InvoicePartner
Contact element that had the invalid attribute role=sellTo. The valid
role values are:

    from
    soldTo
    billTo
    remitTo

This invalid attribute has been changed to role=soldTo.

