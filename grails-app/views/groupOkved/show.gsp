
<%@ page import="vedstat.GroupOkved" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupOkved.label', default: 'GroupOkved')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-groupOkved" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-groupOkved" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list groupOkved">
			
				<g:if test="${groupOkvedInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="groupOkved.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${groupOkvedInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupOkvedInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="groupOkved.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${groupOkvedInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupOkvedInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="groupOkved.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${groupOkvedInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
			</ol>
<sec:ifAllGranted roles="ROLE_ADMIN">
            <g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${groupOkvedInstance?.id}" />
					<g:link class="edit" action="edit" id="${groupOkvedInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAllGranted>
				</fieldset>
			</g:form>
    </sec:ifAllGranted>
		</div>
	</body>
</html>
