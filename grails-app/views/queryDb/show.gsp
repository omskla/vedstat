
<%@ page import="vedstat.QueryDb" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'queryDb.label', default: 'QueryDb')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-queryDb" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-queryDb" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list queryDb">
			
				<g:if test="${queryDbInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="queryDb.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${queryDbInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${queryDbInstance?.queryStr}">
				<li class="fieldcontain">
					<span id="queryStr-label" class="property-label"><g:message code="queryDb.queryStr.label" default="Query Str" /></span>
					
						<span class="property-value" aria-labelledby="queryStr-label"><g:fieldValue bean="${queryDbInstance}" field="queryStr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${queryDbInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="queryDb.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${queryDbInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">

                    <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">

                    <g:hiddenField name="id" value="${queryDbInstance?.id}" />
					<g:link class="edit" action="edit" id="${queryDbInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				        </sec:ifAllGranted>
                        </fieldset>
			</g:form>
		</div>
	</body>
</html>
