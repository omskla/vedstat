
<%@ page import="vedstat.HeadOrg" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'headOrg.label', default: 'HeadOrg')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-headOrg" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
<sec:ifAllGranted roles="ROLE_ADMIN">
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </sec:ifAllGranted>
			</ul>
		</div>
		<div id="list-headOrg" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'headOrg.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="descryption" title="${message(code: 'headOrg.descryption.label', default: 'Descryption')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${headOrgInstanceList}" status="i" var="headOrgInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${headOrgInstance.id}">${fieldValue(bean: headOrgInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: headOrgInstance, field: "descryption")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${headOrgInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
