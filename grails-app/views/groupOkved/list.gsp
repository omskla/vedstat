
<%@ page import="vedstat.GroupOkved" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupOkved.label', default: 'GroupOkved')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-groupOkved" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
<sec:ifAllGranted roles="ROLE_ADMIN">
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </sec:ifAllGranted>
			</ul>
		</div>
		<div id="list-groupOkved" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'groupOkved.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'groupOkved.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'groupOkved.code.label', default: 'Code')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${groupOkvedInstanceList}" status="i" var="groupOkvedInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${groupOkvedInstance.id}">${fieldValue(bean: groupOkvedInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: groupOkvedInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: groupOkvedInstance, field: "code")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${groupOkvedInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
