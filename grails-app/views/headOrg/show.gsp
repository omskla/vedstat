
<%@ page import="vedstat.HeadOrg" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'headOrg.label', default: 'HeadOrg')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-headOrg" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
                <li><g:link class="list"  controller="org" action="showChild" params="${[idHead: headOrgInstance?.id]}">Подведомственные учреждения</g:link></li>
			</ul>
		</div>
		<div id="show-headOrg" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list headOrg">
			
				<g:if test="${headOrgInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="headOrg.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${headOrgInstance}" field="code"/></span>
					
				</li>
				</g:if>


				<g:if test="${headOrgInstance?.descryption}">
				<li class="fieldcontain">
					<span id="descryption-label" class="property-label"><g:message code="headOrg.descryption.label" default="Descryption" /></span>
					
						<span class="property-value" aria-labelledby="descryption-label"><g:fieldValue bean="${headOrgInstance}" field="descryption"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${headOrgInstance?.id}" />
					<g:link class="edit" action="edit" id="${headOrgInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAllGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
