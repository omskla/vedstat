
<%@ page import="vedstat.Ot3Data" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ot3Data.label', default: 'Ot3Data')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ot3Data" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ot3Data" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="quarter" title="${message(code: 'ot3Data.quarter.label', default: 'Quarter')}" />
					
						<g:sortableColumn property="yyyy" title="${message(code: 'ot3Data.yyyy.label', default: 'Yyyy')}" />
					
						<g:sortableColumn property="itogo" title="${message(code: 'ot3Data.itogo.label', default: 'Itogo')}" />
					
						<g:sortableColumn property="more50" title="${message(code: 'ot3Data.more50.label', default: 'More50')}" />
					
						<g:sortableColumn property="more50Ot" title="${message(code: 'ot3Data.more50Ot.label', default: 'More50 Ot')}" />
					
						<g:sortableColumn property="itogoWorkers" title="${message(code: 'ot3Data.itogoWorkers.label', default: 'Itogo Workers')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ot3DataInstanceList}" status="i" var="ot3DataInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ot3DataInstance.id}">${fieldValue(bean: ot3DataInstance, field: "quarter")}</g:link></td>
					
						<td>${fieldValue(bean: ot3DataInstance, field: "yyyy")}</td>
					
						<td>${fieldValue(bean: ot3DataInstance, field: "itogo")}</td>
					
						<td>${fieldValue(bean: ot3DataInstance, field: "more50")}</td>
					
						<td>${fieldValue(bean: ot3DataInstance, field: "more50Ot")}</td>
					
						<td>${fieldValue(bean: ot3DataInstance, field: "itogoWorkers")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ot3DataInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
