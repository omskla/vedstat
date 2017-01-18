
<%@ page import="vedstat.OrgInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orgInformation.label', default: 'OrgInformation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-orgInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-orgInformation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <h3 style="text-align: center"> <b> ${orgInformationInstance?.org} </b> </h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list orgInformation">
			
				<g:if test="${orgInformationInstance?.infDate}">
				<li class="fieldcontain">
					<span id="infDate-label" class="property-label"><g:message code="orgInformation.infDate.label" default="Inf Date" /></span>
					
						<span class="property-value" aria-labelledby="infDate-label"><g:formatDate date="${orgInformationInstance?.infDate}" /></span>
					
				</li>
				</g:if>
			

			
				<g:if test="${orgInformationInstance?.headOrg}">
				<li class="fieldcontain">
					<span id="headOrg-label" class="property-label"><g:message code="orgInformation.headOrg.label" default="Head Org" /></span>
					
						<span class="property-value" aria-labelledby="headOrg-label"><g:fieldValue bean="${orgInformationInstance}" field="headOrg"/></span>
					
				</li>
				</g:if>

				<g:if test="${orgInformationInstance?.tel}">
				<li class="fieldcontain">
					<span id="tel-label" class="property-label"><g:message code="orgInformation.tel.label" default="Tel" /></span>
					
						<span class="property-value" aria-labelledby="tel-label"><g:fieldValue bean="${orgInformationInstance}" field="tel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgInformationInstance?.fax}">
				<li class="fieldcontain">
					<span id="fax-label" class="property-label"><g:message code="orgInformation.fax.label" default="Fax" /></span>
					
						<span class="property-value" aria-labelledby="fax-label"><g:fieldValue bean="${orgInformationInstance}" field="fax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgInformationInstance?.adress}">
				<li class="fieldcontain">
					<span id="adress-label" class="property-label"><g:message code="orgInformation.adress.label" default="Adress" /></span>
					
						<span class="property-value" aria-labelledby="adress-label"><g:fieldValue bean="${orgInformationInstance}" field="adress"/></span>
					
				</li>
				</g:if>

                <g:if test="${orgInformationInstance?.adressfact}">
                    <li class="fieldcontain">
                        <span id="adressfact-label" class="property-label"><g:message code="orgInformation.adressfact.label" default="Adress" /></span>

                        <span class="property-value" aria-labelledby="adressfact-label"><g:fieldValue bean="${orgInformationInstance}" field="adressfact"/></span>

                    </li>
                </g:if>
			
				<g:if test="${orgInformationInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="orgInformation.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label">
							<a href="mailto:${orgInformationInstance.email}">
								<g:fieldValue bean="${orgInformationInstance}" field="email"/>
							</a>

						</span>
					
				</li>
				</g:if>


                <g:if test="${orgInformationInstance?.staff}">
                    <li class="fieldcontain">
                        <span id="staff-label" class="property-label"><g:message code="workInfo.staff.label" default="Staff" /></span>

                        <span class="property-value" aria-labelledby="staff-label"><g:fieldValue bean="${orgInformationInstance}" field="staff"/></span>

                    </li>
                </g:if>

                <g:if test="${orgInformationInstance?.women}">
                    <li class="fieldcontain">
                        <span id="women-label" class="property-label"><g:message code="workInfo.women.label" default="Women" /></span>

                        <span class="property-value" aria-labelledby="women-label"><g:fieldValue bean="${orgInformationInstance}" field="women"/></span>

                    </li>
                </g:if>
			

			

			
				<g:if test="${orgInformationInstance?.org}">
				<li class="fieldcontain">
					<span id="org-label" class="property-label"><g:message code="orgInformation.org.label" default="Org" /></span>
					
						<span class="property-value" aria-labelledby="org-label"><g:link controller="org" action="show" id="${orgInformationInstance?.org?.id}">${orgInformationInstance?.org?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${orgInformationInstance?.id}" />
					<g:link class="edit" action="edit" id="${orgInformationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAllGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
