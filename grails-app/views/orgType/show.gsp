
<%@ page import="vedstat.OrgType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orgType.label', default: 'OrgType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-orgType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-orgType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list orgType">
			
				<g:if test="${orgTypeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="orgType.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${orgTypeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orgTypeInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="orgType.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${orgTypeInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${orgTypeInstance?.id}" />
					<g:link class="edit" action="edit" id="${orgTypeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAllGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
