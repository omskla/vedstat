
<%@ page import="vedstat.Attestation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attestation.label', default: 'Attestation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-attestation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-attestation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="infDate" title="${message(code: 'attestation.infDate.label', default: 'Inf Date')}" />
					
						<g:sortableColumn property="kolWorkingPlace" title="${message(code: 'attestation.kolWorkingPlace.label', default: 'Kol Working Place')}" />
					
						<g:sortableColumn property="kolWorkingPlaceToAttest" title="${message(code: 'attestation.kolWorkingPlaceToAttest.label', default: 'Kol Working Place To Attest')}" />
					
						<th><g:message code="attestation.attestationOrg.label" default="Attestation Org" /></th>
					
						<g:sortableColumn property="dateSert" title="${message(code: 'attestation.dateSert.label', default: 'Date Sert')}" />
					
						<g:sortableColumn property="kolAttestationPlace" title="${message(code: 'attestation.kolAttestationPlace.label', default: 'Kol Attestation Place')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${attestationInstanceList}" status="i" var="attestationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${attestationInstance.id}">${fieldValue(bean: attestationInstance, field: "infDate")}</g:link></td>
					
						<td>${fieldValue(bean: attestationInstance, field: "kolWorkingPlace")}</td>
					
						<td>${fieldValue(bean: attestationInstance, field: "kolWorkingPlaceToAttest")}</td>
					
						<td>${fieldValue(bean: attestationInstance, field: "attestationOrg")}</td>
					
						<td>${fieldValue(bean: attestationInstance, field: "dateSert")}</td>
					
						<td>${fieldValue(bean: attestationInstance, field: "kolAttestationPlace")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${attestationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
