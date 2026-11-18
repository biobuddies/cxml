<!--
    For cXML license agreement information, please see
    http://www.cxml.org/home/license.asp

    $Id$
-->

<!-- ====
    Provider* transaction is used to visually integrate an application with
    a UI provided by a service provider.
==== -->

<!--
     The originating application would provide the BrowserFormPost location
     only if it wished the provider site to display a "Done" button or
     would like information (at least Status) returned at the end of the
     interactive session. Inclusion should lead to a ProviderDoneMessage
     from the provider at the end of a session.

     The originating application would provide the Followup location if it
     wished the provider to provide information about later status changes
     in the service (after the end of a particular Provider session). This
     applies only when the initial status (transmitted via a
     ProviderDoneMessage) was an interim value.
-->
<!ELEMENT ProviderSetupRequest (OriginatorCookie,
                                (BrowserFormPost, Followup?)?,
                                SelectedService, Extrinsic*)>

<!--
     Notifies the originating application of the results of the request. 
	 Start page information is included.
-->
<!ELEMENT ProviderSetupResponse (StartPage)>

<!--
    Contains any information the originating application must know about the 
	completed operation at the provider site.
-->
<!ELEMENT ProviderDoneMessage (OriginatorCookie, ReturnData*)>
