
<%@ page import="vedstat.Unlucky" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unlucky.label', default: 'Unlucky')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-unlucky" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-unlucky" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="infDate" title="${message(code: 'unlucky.infDate.label', default: 'Inf Date')}" />
					
						<g:sortableColumn property="kolWorkerProfZab" title="${message(code: 'unlucky.kolWorkerProfZab.label', default: 'Kol Worker Prof Zab')}" />
					
						<g:sortableColumn property="kolWomenProfZab" title="${message(code: 'unlucky.kolWomenProfZab.label', default: 'Kol Women Prof Zab')}" />
					
						<g:sortableColumn property="kolUnluck" title="${message(code: 'unlucky.kolUnluck.label', default: 'Kol Unluck')}" />
					
						<g:sortableColumn property="kolGroupUnluck" title="${message(code: 'unlucky.kolGroupUnluck.label', default: 'Kol Group Unluck')}" />
					
						<g:sortableColumn property="kolDeathUnluck" title="${message(code: 'unlucky.kolDeathUnluck.label', default: 'Kol Death Unluck')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${unluckyInstanceList}" status="i" var="unluckyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${unluckyInstance.id}">${fieldValue(bean: unluckyInstance, field: "infDate")}</g:link></td>
					
						<td>${fieldValue(bean: unluckyInstance, field: "kolWorkerProfZab")}</td>
					
						<td>${fieldValue(bean: unluckyInstance, field: "kolWomenProfZab")}</td>
					
						<td>${fieldValue(bean: unluckyInstance, field: "kolUnluck")}</td>
					
						<td>${fieldValue(bean: unluckyInstance, field: "kolGroupUnluck")}</td>
					
						<td>${fieldValue(bean: unluckyInstance, field: "kolDeathUnluck")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${unluckyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
