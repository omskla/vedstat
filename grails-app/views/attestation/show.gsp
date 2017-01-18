
<%@ page import="vedstat.Attestation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attestation.label', default: 'Attestation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-attestation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-attestation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
      <h3 style="text-align: center"> <b> ${attestationInstance?.org} </b> </h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list attestation">
			
				<g:if test="${attestationInstance?.infDate}">
				<li class="fieldcontain">
					<span id="infDate-label" class="property-label"><g:message code="attestation.infDate.label" default="Inf Date" /></span>
					
						<span class="property-value" aria-labelledby="infDate-label"><g:formatDate date="${attestationInstance?.infDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWorkingPlace}">
				<li class="fieldcontain">
					<span id="kolWorkingPlace-label" class="property-label"><g:message code="attestation.kolWorkingPlace.label" default="Kol Working Place" /></span>
					
						<span class="property-value" aria-labelledby="kolWorkingPlace-label"><g:fieldValue bean="${attestationInstance}" field="kolWorkingPlace"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWorkingPlaceToAttest}">
				<li class="fieldcontain">
					<span id="kolWorkingPlaceToAttest-label" class="property-label"><g:message code="attestation.kolWorkingPlaceToAttest.label" default="Kol Working Place To Attest" /></span>
					
						<span class="property-value" aria-labelledby="kolWorkingPlaceToAttest-label"><g:fieldValue bean="${attestationInstance}" field="kolWorkingPlaceToAttest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.attestationOrg}">
				<li class="fieldcontain">
					<span id="attestationOrg-label" class="property-label"><g:message code="attestation.attestationOrg.label" default="Attestation Org" /></span>
					
						<span class="property-value" aria-labelledby="attestationOrg-label"><g:link controller="attestationOrg" action="show" id="${attestationInstance?.attestationOrg?.id}">${attestationInstance?.attestationOrg?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.dateSert}">
				<li class="fieldcontain">
					<span id="dateSert-label" class="property-label"><g:message code="attestation.dateSert.label" default="Date Sert" /></span>
					
						<span class="property-value" aria-labelledby="dateSert-label"><g:fieldValue bean="${attestationInstance}" field="dateSert"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolAttestationPlace}">
				<li class="fieldcontain">
					<span id="kolAttestationPlace-label" class="property-label"><g:message code="attestation.kolAttestationPlace.label" default="Kol Attestation Place" /></span>
					
						<span class="property-value" aria-labelledby="kolAttestationPlace-label"><g:fieldValue bean="${attestationInstance}" field="kolAttestationPlace"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWorkerAttestationPlace}">
				<li class="fieldcontain">
					<span id="kolWorkerAttestationPlace-label" class="property-label"><g:message code="attestation.kolWorkerAttestationPlace.label" default="Kol Worker Attestation Place" /></span>
					
						<span class="property-value" aria-labelledby="kolWorkerAttestationPlace-label"><g:fieldValue bean="${attestationInstance}" field="kolWorkerAttestationPlace"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWomenAttestation}">
				<li class="fieldcontain">
					<span id="kolWomenAttestation-label" class="property-label"><g:message code="attestation.kolWomenAttestation.label" default="Kol Women Attestation" /></span>
					
						<span class="property-value" aria-labelledby="kolWomenAttestation-label"><g:fieldValue bean="${attestationInstance}" field="kolWomenAttestation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolRabMest1_2}">
				<li class="fieldcontain">
					<span id="kolRabMest1_2-label" class="property-label"><g:message code="attestation.kolRabMest1_2.label" default="Kol Rab Mest12" /></span>
					
						<span class="property-value" aria-labelledby="kolRabMest1_2-label"><g:fieldValue bean="${attestationInstance}" field="kolRabMest1_2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWorker1_2}">
				<li class="fieldcontain">
					<span id="kolWorker1_2-label" class="property-label"><g:message code="attestation.kolWorker1_2.label" default="Kol Worker12" /></span>
					
						<span class="property-value" aria-labelledby="kolWorker1_2-label"><g:fieldValue bean="${attestationInstance}" field="kolWorker1_2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWomen1_2}">
				<li class="fieldcontain">
					<span id="kolWomen1_2-label" class="property-label"><g:message code="attestation.kolWomen1_2.label" default="Kol Women12" /></span>
					
						<span class="property-value" aria-labelledby="kolWomen1_2-label"><g:fieldValue bean="${attestationInstance}" field="kolWomen1_2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolRabMest3}">
				<li class="fieldcontain">
					<span id="kolRabMest3-label" class="property-label"><g:message code="attestation.kolRabMest3.label" default="Kol Rab Mest3" /></span>
					
						<span class="property-value" aria-labelledby="kolRabMest3-label"><g:fieldValue bean="${attestationInstance}" field="kolRabMest3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWorker3}">
				<li class="fieldcontain">
					<span id="kolWorker3-label" class="property-label"><g:message code="attestation.kolWorker3.label" default="Kol Worker3" /></span>
					
						<span class="property-value" aria-labelledby="kolWorker3-label"><g:fieldValue bean="${attestationInstance}" field="kolWorker3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWomen3}">
				<li class="fieldcontain">
					<span id="kolWomen3-label" class="property-label"><g:message code="attestation.kolWomen3.label" default="Kol Women3" /></span>
					
						<span class="property-value" aria-labelledby="kolWomen3-label"><g:fieldValue bean="${attestationInstance}" field="kolWomen3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolRabMest4}">
				<li class="fieldcontain">
					<span id="kolRabMest4-label" class="property-label"><g:message code="attestation.kolRabMest4.label" default="Kol Rab Mest4" /></span>
					
						<span class="property-value" aria-labelledby="kolRabMest4-label"><g:fieldValue bean="${attestationInstance}" field="kolRabMest4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWorker4}">
				<li class="fieldcontain">
					<span id="kolWorker4-label" class="property-label"><g:message code="attestation.kolWorker4.label" default="Kol Worker4" /></span>
					
						<span class="property-value" aria-labelledby="kolWorker4-label"><g:fieldValue bean="${attestationInstance}" field="kolWorker4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWomen4}">
				<li class="fieldcontain">
					<span id="kolWomen4-label" class="property-label"><g:message code="attestation.kolWomen4.label" default="Kol Women4" /></span>
					
						<span class="property-value" aria-labelledby="kolWomen4-label"><g:fieldValue bean="${attestationInstance}" field="kolWomen4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolRabMestTravm3}">
				<li class="fieldcontain">
					<span id="kolRabMestTravm3-label" class="property-label"><g:message code="attestation.kolRabMestTravm3.label" default="Kol Rab Mest Travm3" /></span>
					
						<span class="property-value" aria-labelledby="kolRabMestTravm3-label"><g:fieldValue bean="${attestationInstance}" field="kolRabMestTravm3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWorkerTravm3}">
				<li class="fieldcontain">
					<span id="kolWorkerTravm3-label" class="property-label"><g:message code="attestation.kolWorkerTravm3.label" default="Kol Worker Travm3" /></span>
					
						<span class="property-value" aria-labelledby="kolWorkerTravm3-label"><g:fieldValue bean="${attestationInstance}" field="kolWorkerTravm3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWomenTravm3}">
				<li class="fieldcontain">
					<span id="kolWomenTravm3-label" class="property-label"><g:message code="attestation.kolWomenTravm3.label" default="Kol Women Travm3" /></span>
					
						<span class="property-value" aria-labelledby="kolWomenTravm3-label"><g:fieldValue bean="${attestationInstance}" field="kolWomenTravm3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolRabMestSizFail}">
				<li class="fieldcontain">
					<span id="kolRabMestSizFail-label" class="property-label"><g:message code="attestation.kolRabMestSizFail.label" default="Kol Rab Mest Siz Fail" /></span>
					
						<span class="property-value" aria-labelledby="kolRabMestSizFail-label"><g:fieldValue bean="${attestationInstance}" field="kolRabMestSizFail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWorkerSizFail}">
				<li class="fieldcontain">
					<span id="kolWorkerSizFail-label" class="property-label"><g:message code="attestation.kolWorkerSizFail.label" default="Kol Worker Siz Fail" /></span>
					
						<span class="property-value" aria-labelledby="kolWorkerSizFail-label"><g:fieldValue bean="${attestationInstance}" field="kolWorkerSizFail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.kolWomenSizFail}">
				<li class="fieldcontain">
					<span id="kolWomenSizFail-label" class="property-label"><g:message code="attestation.kolWomenSizFail.label" default="Kol Women Siz Fail" /></span>
					
						<span class="property-value" aria-labelledby="kolWomenSizFail-label"><g:fieldValue bean="${attestationInstance}" field="kolWomenSizFail"/></span>
					
				</li>
				</g:if>

            <g:if test="${attestationInstance?.isMeropriatie}">
                <li class="fieldcontain">
                    <span id="isMeropriatie-label" class="property-label"><g:message code="attestation.isMeropriatie.label" default="Is Meropriatie" /></span>

                    <span class="property-value" aria-labelledby="isMeropriatie-label"><g:formatBoolean boolean="${attestationInstance?.isMeropriatie}" /></span>

                </li>
            </g:if>
				<g:if test="${attestationInstance?.isGosExpertiza}">
				<li class="fieldcontain">
					<span id="isGosExpertiza-label" class="property-label"><g:message code="attestation.isGosExpertiza.label" default="Is Gos Expertiza" /></span>
					
						<span class="property-value" aria-labelledby="isGosExpertiza-label"><g:formatBoolean boolean="${attestationInstance?.isGosExpertiza}" /></span>
					
				</li>
				</g:if>

			
				<g:if test="${attestationInstance?.isCertDoverie}">
				<li class="fieldcontain">
					<span id="isCertDoverie-label" class="property-label"><g:message code="attestation.isCertDoverie.label" default="Is Cert Doverie" /></span>
					
						<span class="property-value" aria-labelledby="isCertDoverie-label"><g:formatBoolean boolean="${attestationInstance?.isCertDoverie}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${attestationInstance?.org}">
				<li class="fieldcontain">
					<span id="org-label" class="property-label"><g:message code="attestation.org.label" default="Org" /></span>
					
						<span class="property-value" aria-labelledby="org-label"><g:link controller="org" action="show" id="${attestationInstance?.org?.id}">${attestationInstance?.org?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${attestationInstance?.id}" />
					<g:link class="edit" action="edit" id="${attestationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
			        <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				        </sec:ifAllGranted>
                        </fieldset>
			</g:form>
		</div>
	</body>
</html>
