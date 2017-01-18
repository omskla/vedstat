
<%@ page import="vedstat.QueryDb" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'queryDb.label', default: 'QueryDb')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-queryDb" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-queryDb" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'queryDb.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="queryStr" title="${message(code: 'queryDb.queryStr.label', default: 'Query Str')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'queryDb.code.label', default: 'Code')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${queryDbInstanceList}" status="i" var="queryDbInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${queryDbInstance.id}">${fieldValue(bean: queryDbInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: queryDbInstance, field: "queryStr")}</td>
					
						<td>${fieldValue(bean: queryDbInstance, field: "code")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${queryDbInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
