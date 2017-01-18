
<%@ page import="vedstat.Unlucky" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unlucky.label', default: 'Unlucky')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-unlucky" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-unlucky" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <h3 style="text-align: center"> <b> ${unluckyInstance?.org} </b> </h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list unlucky">
			
				<g:if test="${unluckyInstance?.infDate}">
				<li class="fieldcontain">
					<span id="infDate-label" class="property-label"><g:message code="unlucky.infDate.label" default="Inf Date" /></span>
					
						<span class="property-value" aria-labelledby="infDate-label"><g:formatDate date="${unluckyInstance?.infDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.kolWorkerProfZab}">
				<li class="fieldcontain">
					<span id="kolWorkerProfZab-label" class="property-label"><g:message code="unlucky.kolWorkerProfZab.label" default="Kol Worker Prof Zab" /></span>
					
						<span class="property-value" aria-labelledby="kolWorkerProfZab-label"><g:fieldValue bean="${unluckyInstance}" field="kolWorkerProfZab"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.kolWomenProfZab}">
				<li class="fieldcontain">
					<span id="kolWomenProfZab-label" class="property-label"><g:message code="unlucky.kolWomenProfZab.label" default="Kol Women Prof Zab" /></span>
					
						<span class="property-value" aria-labelledby="kolWomenProfZab-label"><g:fieldValue bean="${unluckyInstance}" field="kolWomenProfZab"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.kolUnluck}">
				<li class="fieldcontain">
					<span id="kolUnluck-label" class="property-label"><g:message code="unlucky.kolUnluck.label" default="Kol Unluck" /></span>
					
						<span class="property-value" aria-labelledby="kolUnluck-label"><g:fieldValue bean="${unluckyInstance}" field="kolUnluck"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.kolGroupUnluck}">
				<li class="fieldcontain">
					<span id="kolGroupUnluck-label" class="property-label"><g:message code="unlucky.kolGroupUnluck.label" default="Kol Group Unluck" /></span>
					
						<span class="property-value" aria-labelledby="kolGroupUnluck-label"><g:fieldValue bean="${unluckyInstance}" field="kolGroupUnluck"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.kolDeathUnluck}">
				<li class="fieldcontain">
					<span id="kolDeathUnluck-label" class="property-label"><g:message code="unlucky.kolDeathUnluck.label" default="Kol Death Unluck" /></span>
					
						<span class="property-value" aria-labelledby="kolDeathUnluck-label"><g:fieldValue bean="${unluckyInstance}" field="kolDeathUnluck"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.kolHardUnluck}">
				<li class="fieldcontain">
					<span id="kolHardUnluck-label" class="property-label"><g:message code="unlucky.kolHardUnluck.label" default="Kol Hard Unluck" /></span>
					
						<span class="property-value" aria-labelledby="kolHardUnluck-label"><g:fieldValue bean="${unluckyInstance}" field="kolHardUnluck"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.itogo}">
				<li class="fieldcontain">
					<span id="itogo-label" class="property-label"><g:message code="unlucky.itogo.label" default="Itogo" /></span>
					
						<span class="property-value" aria-labelledby="itogo-label"><g:fieldValue bean="${unluckyInstance}" field="itogo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.itogoWomen}">
				<li class="fieldcontain">
					<span id="itogoWomen-label" class="property-label"><g:message code="unlucky.itogoWomen.label" default="Itogo Women" /></span>
					
						<span class="property-value" aria-labelledby="itogoWomen-label"><g:fieldValue bean="${unluckyInstance}" field="itogoWomen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.itogoDeath}">
				<li class="fieldcontain">
					<span id="itogoDeath-label" class="property-label"><g:message code="unlucky.itogoDeath.label" default="Itogo Death" /></span>
					
						<span class="property-value" aria-labelledby="itogoDeath-label"><g:fieldValue bean="${unluckyInstance}" field="itogoDeath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.itogoDeathWomen}">
				<li class="fieldcontain">
					<span id="itogoDeathWomen-label" class="property-label"><g:message code="unlucky.itogoDeathWomen.label" default="Itogo Death Women" /></span>
					
						<span class="property-value" aria-labelledby="itogoDeathWomen-label"><g:fieldValue bean="${unluckyInstance}" field="itogoDeathWomen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.itogoHard}">
				<li class="fieldcontain">
					<span id="itogoHard-label" class="property-label"><g:message code="unlucky.itogoHard.label" default="Itogo Hard" /></span>
					
						<span class="property-value" aria-labelledby="itogoHard-label"><g:fieldValue bean="${unluckyInstance}" field="itogoHard"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.itogoHardWomen}">
				<li class="fieldcontain">
					<span id="itogoHardWomen-label" class="property-label"><g:message code="unlucky.itogoHardWomen.label" default="Itogo Hard Women" /></span>
					
						<span class="property-value" aria-labelledby="itogoHardWomen-label"><g:fieldValue bean="${unluckyInstance}" field="itogoHardWomen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.kolDaysNot}">
				<li class="fieldcontain">
					<span id="kolDaysNot-label" class="property-label"><g:message code="unlucky.kolDaysNot.label" default="Kol Days Not" /></span>
					
						<span class="property-value" aria-labelledby="kolDaysNot-label"><g:fieldValue bean="${unluckyInstance}" field="kolDaysNot"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unluckyInstance?.org}">
				<li class="fieldcontain">
					<span id="org-label" class="property-label"><g:message code="unlucky.org.label" default="Org" /></span>
					
						<span class="property-value" aria-labelledby="org-label"><g:link controller="org" action="show" id="${unluckyInstance?.org?.id}">${unluckyInstance?.org?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${unluckyInstance?.id}" />
					<g:link class="edit" action="edit" id="${unluckyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAllGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
