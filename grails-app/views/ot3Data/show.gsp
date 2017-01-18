
<%@ page import="vedstat.Ot3Data" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ot3Data.label', default: 'Ot3Data')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ot3Data" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ot3Data" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ot3Data">
			
				<g:if test="${ot3DataInstance?.quarter}">
				<li class="fieldcontain">
					<span id="quarter-label" class="property-label"><g:message code="ot3Data.quarter.label" default="Quarter" /></span>
					
						<span class="property-value" aria-labelledby="quarter-label"><g:fieldValue bean="${ot3DataInstance}" field="quarter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.yyyy}">
				<li class="fieldcontain">
					<span id="yyyy-label" class="property-label"><g:message code="ot3Data.yyyy.label" default="Yyyy" /></span>
					
						<span class="property-value" aria-labelledby="yyyy-label"><g:fieldValue bean="${ot3DataInstance}" field="yyyy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.itogo}">
				<li class="fieldcontain">
					<span id="itogo-label" class="property-label"><g:message code="ot3Data.itogo.label" default="Itogo" /></span>
					
						<span class="property-value" aria-labelledby="itogo-label"><g:fieldValue bean="${ot3DataInstance}" field="itogo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.more50}">
				<li class="fieldcontain">
					<span id="more50-label" class="property-label"><g:message code="ot3Data.more50.label" default="More50" /></span>
					
						<span class="property-value" aria-labelledby="more50-label"><g:fieldValue bean="${ot3DataInstance}" field="more50"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.more50Ot}">
				<li class="fieldcontain">
					<span id="more50Ot-label" class="property-label"><g:message code="ot3Data.more50Ot.label" default="More50 Ot" /></span>
					
						<span class="property-value" aria-labelledby="more50Ot-label"><g:fieldValue bean="${ot3DataInstance}" field="more50Ot"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.itogoWorkers}">
				<li class="fieldcontain">
					<span id="itogoWorkers-label" class="property-label"><g:message code="ot3Data.itogoWorkers.label" default="Itogo Workers" /></span>
					
						<span class="property-value" aria-labelledby="itogoWorkers-label"><g:fieldValue bean="${ot3DataInstance}" field="itogoWorkers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.kolRabAttest}">
				<li class="fieldcontain">
					<span id="kolRabAttest-label" class="property-label"><g:message code="ot3Data.kolRabAttest.label" default="Kol Rab Attest" /></span>
					
						<span class="property-value" aria-labelledby="kolRabAttest-label"><g:fieldValue bean="${ot3DataInstance}" field="kolRabAttest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.kolRabMestOt}">
				<li class="fieldcontain">
					<span id="kolRabMestOt-label" class="property-label"><g:message code="ot3Data.kolRabMestOt.label" default="Kol Rab Mest Ot" /></span>
					
						<span class="property-value" aria-labelledby="kolRabMestOt-label"><g:fieldValue bean="${ot3DataInstance}" field="kolRabMestOt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.kolRabOtHelp}">
				<li class="fieldcontain">
					<span id="kolRabOtHelp-label" class="property-label"><g:message code="ot3Data.kolRabOtHelp.label" default="Kol Rab Ot Help" /></span>
					
						<span class="property-value" aria-labelledby="kolRabOtHelp-label"><g:fieldValue bean="${ot3DataInstance}" field="kolRabOtHelp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.kolRabOtSMI}">
				<li class="fieldcontain">
					<span id="kolRabOtSMI-label" class="property-label"><g:message code="ot3Data.kolRabOtSMI.label" default="Kol Rab Ot SMI" /></span>
					
						<span class="property-value" aria-labelledby="kolRabOtSMI-label"><g:fieldValue bean="${ot3DataInstance}" field="kolRabOtSMI"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.kolobrash}">
				<li class="fieldcontain">
					<span id="kolobrash-label" class="property-label"><g:message code="ot3Data.kolobrash.label" default="Kolobrash" /></span>
					
						<span class="property-value" aria-labelledby="kolobrash-label"><g:fieldValue bean="${ot3DataInstance}" field="kolobrash"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.kolMeropr}">
				<li class="fieldcontain">
					<span id="kolMeropr-label" class="property-label"><g:message code="ot3Data.kolMeropr.label" default="Kol Meropr" /></span>
					
						<span class="property-value" aria-labelledby="kolMeropr-label"><g:fieldValue bean="${ot3DataInstance}" field="kolMeropr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.kolzased}">
				<li class="fieldcontain">
					<span id="kolzased-label" class="property-label"><g:message code="ot3Data.kolzased.label" default="Kolzased" /></span>
					
						<span class="property-value" aria-labelledby="kolzased-label"><g:fieldValue bean="${ot3DataInstance}" field="kolzased"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ot3DataInstance?.area}">
				<li class="fieldcontain">
					<span id="area-label" class="property-label"><g:message code="ot3Data.area.label" default="Area" /></span>
					
						<span class="property-value" aria-labelledby="area-label"><g:link controller="municArea" action="show" id="${ot3DataInstance?.area?.id}">${ot3DataInstance?.area?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:ot3DataInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${ot3DataInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
