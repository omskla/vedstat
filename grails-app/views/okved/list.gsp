
<%@ page import="vedstat.Okved" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'okved.label', default: 'Okved')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-okved" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-okved" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'okved.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'okved.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="descryption" title="${message(code: 'okved.descryption.label', default: 'Descryption')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${okvedInstanceList}" status="i" var="okvedInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${okvedInstance.id}">${fieldValue(bean: okvedInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: okvedInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: okvedInstance, field: "descryption")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${okvedInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
