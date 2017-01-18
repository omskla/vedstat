
<%@ page import="vedstat.TrainingLabourInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-trainingLabourInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-trainingLabourInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <h3 style="text-align: center"> <b> ${trainingLabourInfoInstance?.org} </b> </h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list trainingLabourInfo">
			
				<g:if test="${trainingLabourInfoInstance?.infDate}">
				<li class="fieldcontain">
					<span id="infDate-label" class="property-label"><g:message code="trainingLabourInfo.infDate.label" default="Inf Date" /></span>
					
						<span class="property-value" aria-labelledby="infDate-label"><g:formatDate date="${trainingLabourInfoInstance?.infDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainingLabourInfoInstance?.kolTrainWorker}">
				<li class="fieldcontain">
					<span id="kolTrainWorker-label" class="property-label"><g:message code="trainingLabourInfo.kolTrainWorker.label" default="Kol Train Worker" /></span>
					
						<span class="property-value" aria-labelledby="kolTrainWorker-label"><g:fieldValue bean="${trainingLabourInfoInstance}" field="kolTrainWorker"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainingLabourInfoInstance?.yearTrainHear}">
				<li class="fieldcontain">
					<span id="yearTrainHear-label" class="property-label"><g:message code="trainingLabourInfo.yearTrainHear.label" default="Year Train Hear" /></span>
					
						<span class="property-value" aria-labelledby="yearTrainHear-label"><g:fieldValue bean="${trainingLabourInfoInstance}" field="yearTrainHear"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainingLabourInfoInstance?.orgTrainHead}">
				<li class="fieldcontain">
					<span id="orgTrainHead-label" class="property-label"><g:message code="trainingLabourInfo.orgTrainHead.label" default="Org Train Head" /></span>
					
						<span class="property-value" aria-labelledby="orgTrainHead-label"><g:link controller="trainingOrg" action="show" id="${trainingLabourInfoInstance?.orgTrainHead?.id}">${trainingLabourInfoInstance?.orgTrainHead?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainingLabourInfoInstance?.kolTrainSpec}">
				<li class="fieldcontain">
					<span id="kolTrainSpec-label" class="property-label"><g:message code="trainingLabourInfo.kolTrainSpec.label" default="Kol Train Spec" /></span>
					
						<span class="property-value" aria-labelledby="kolTrainSpec-label"><g:fieldValue bean="${trainingLabourInfoInstance}" field="kolTrainSpec"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainingLabourInfoInstance?.yearTrainSpec}">
				<li class="fieldcontain">
					<span id="yearTrainSpec-label" class="property-label"><g:message code="trainingLabourInfo.yearTrainSpec.label" default="Year Train Spec" /></span>
					
						<span class="property-value" aria-labelledby="yearTrainSpec-label"><g:fieldValue bean="${trainingLabourInfoInstance}" field="yearTrainSpec"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainingLabourInfoInstance?.orgTrainSpec}">
				<li class="fieldcontain">
					<span id="orgTrainSpec-label" class="property-label"><g:message code="trainingLabourInfo.orgTrainSpec.label" default="Org Train Spec" /></span>
					
						<span class="property-value" aria-labelledby="orgTrainSpec-label"><g:link controller="trainingOrg" action="show" id="${trainingLabourInfoInstance?.orgTrainSpec?.id}">${trainingLabourInfoInstance?.orgTrainSpec?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
                <g:if test="${trainingLabourInfoInstance?.isPrikazOt}">
                    <li class="fieldcontain">
                        <span id="isPrikazOt-label" class="property-label"><g:message code="trainingLabourInfo.isPrikazOt.label" default="Is Prikaz Ot" /></span>

                        <span class="property-value" aria-labelledby="isPrikazOt-label"><g:formatBoolean boolean="${trainingLabourInfoInstance?.isPrikazOt}" /></span>

                    </li>
                </g:if>
				<g:if test="${trainingLabourInfoInstance?.itogoObuchSpec}">
				<li class="fieldcontain">
					<span id="itogoObuchSpec-label" class="property-label"><g:message code="trainingLabourInfo.itogoObuchSpec.label" default="Itogo Obuch Spec" /></span>
					
						<span class="property-value" aria-labelledby="itogoObuchSpec-label"><g:fieldValue bean="${trainingLabourInfoInstance}" field="itogoObuchSpec"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainingLabourInfoInstance?.itogoObuchSpecHead}">
				<li class="fieldcontain">
					<span id="itogoObuchSpecHead-label" class="property-label"><g:message code="trainingLabourInfo.itogoObuchSpecHead.label" default="Itogo Obuch Spec Head" /></span>
					
						<span class="property-value" aria-labelledby="itogoObuchSpecHead-label"><g:fieldValue bean="${trainingLabourInfoInstance}" field="itogoObuchSpecHead"/></span>
					
				</li>
				</g:if>

			
				<g:if test="${trainingLabourInfoInstance?.itogoObuchWorker}">
				<li class="fieldcontain">
					<span id="itogoObuchWorker-label" class="property-label"><g:message code="trainingLabourInfo.itogoObuchWorker.label" default="Itogo Obuch Worker" /></span>
					
						<span class="property-value" aria-labelledby="itogoObuchWorker-label"><g:fieldValue bean="${trainingLabourInfoInstance}" field="itogoObuchWorker"/></span>
					
				</li>
				</g:if>
			

			
				<g:if test="${trainingLabourInfoInstance?.org}">
				<li class="fieldcontain">
					<span id="org-label" class="property-label"><g:message code="trainingLabourInfo.org.label" default="Org" /></span>
					
						<span class="property-value" aria-labelledby="org-label"><g:link controller="org" action="show" id="${trainingLabourInfoInstance?.org?.id}">${trainingLabourInfoInstance?.org?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${trainingLabourInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${trainingLabourInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAllGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
