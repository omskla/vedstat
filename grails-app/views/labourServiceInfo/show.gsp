
<%@ page import="vedstat.LabourServiceInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-labourServiceInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-labourServiceInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <h3 style="text-align: center"> <b> ${labourServiceInfoInstance?.org} </b> </h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list labourServiceInfo">
			
				<g:if test="${labourServiceInfoInstance?.infDate}">
				<li class="fieldcontain">
					<span id="infDate-label" class="property-label"><g:message code="labourServiceInfo.infDate.label" default="Inf Date" /></span>
					
						<span class="property-value" aria-labelledby="infDate-label"><g:formatDate date="${labourServiceInfoInstance?.infDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${labourServiceInfoInstance?.kolLabourWorker}">
				<li class="fieldcontain">
					<span id="kolLabourWorker-label" class="property-label"><g:message code="labourServiceInfo.kolLabourWorker.label" default="Kol Labour Worker" /></span>
					
						<span class="property-value" aria-labelledby="kolLabourWorker-label"><g:fieldValue bean="${labourServiceInfoInstance}" field="kolLabourWorker"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${labourServiceInfoInstance?.typeOtWorker}">
				<li class="fieldcontain">
					<span id="typeOtWorker-label" class="property-label"><g:message code="labourServiceInfo.typeOtWorker.label" default="Type Ot Worker" /></span>
					
						<span class="property-value" aria-labelledby="typeOtWorker-label"><g:link controller="typeOtWorker" action="show" id="${labourServiceInfoInstance?.typeOtWorker?.id}">${labourServiceInfoInstance?.typeOtWorker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${labourServiceInfoInstance?.fioWorker}">
				<li class="fieldcontain">
					<span id="fioWorker-label" class="property-label"><g:message code="labourServiceInfo.fioWorker.label" default="Fio Worker" /></span>
					
						<span class="property-value" aria-labelledby="fioWorker-label"><g:fieldValue bean="${labourServiceInfoInstance}" field="fioWorker"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${labourServiceInfoInstance?.tel}">
				<li class="fieldcontain">
					<span id="tel-label" class="property-label"><g:message code="labourServiceInfo.tel.label" default="Tel" /></span>
					
						<span class="property-value" aria-labelledby="tel-label"><g:fieldValue bean="${labourServiceInfoInstance}" field="tel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${labourServiceInfoInstance?.workExperience}">
				<li class="fieldcontain">
					<span id="workExperience-label" class="property-label"><g:message code="labourServiceInfo.workExperience.label" default="Work Experience" /></span>
					
						<span class="property-value" aria-labelledby="workExperience-label"><g:fieldValue bean="${labourServiceInfoInstance}" field="workExperience"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${labourServiceInfoInstance?.education}">
				<li class="fieldcontain">
					<span id="education-label" class="property-label"><g:message code="labourServiceInfo.education.label" default="Education" /></span>
					
						<span class="property-value" aria-labelledby="education-label"><g:link controller="education" action="show" id="${labourServiceInfoInstance?.education?.id}">${labourServiceInfoInstance?.education?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			

			
				<g:if test="${labourServiceInfoInstance?.isPrikazOt}">
				<li class="fieldcontain">
					<span id="isPrikazOt-label" class="property-label"><g:message code="labourServiceInfo.isPrikazOt.label" default="Is Prikaz Ot" /></span>
					
						<span class="property-value" aria-labelledby="isPrikazOt-label"><g:formatBoolean boolean="${labourServiceInfoInstance?.isPrikazOt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${labourServiceInfoInstance?.org}">
				<li class="fieldcontain">
					<span id="org-label" class="property-label"><g:message code="labourServiceInfo.org.label" default="Org" /></span>
					
						<span class="property-value" aria-labelledby="org-label"><g:link controller="org" action="show" id="${labourServiceInfoInstance?.org?.id}">${labourServiceInfoInstance?.org?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${labourServiceInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${labourServiceInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAllGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
