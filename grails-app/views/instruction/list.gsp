
<%@ page import="vedstat.Instruction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instruction.label', default: 'Instruction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-instruction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-instruction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="infDate" title="${message(code: 'instruction.infDate.label', default: 'Inf Date')}" />
					
						<g:sortableColumn property="itogoInstructions" title="${message(code: 'instruction.itogoInstructions.label', default: 'Itogo Instructions')}" />
					
						<g:sortableColumn property="procentInstructions" title="${message(code: 'instruction.procentInstructions.label', default: 'Procent Instructions')}" />
					
						<g:sortableColumn property="regJournal" title="${message(code: 'instruction.regJournal.label', default: 'Reg Journal')}" />
					
						<g:sortableColumn property="issueJournal" title="${message(code: 'instruction.issueJournal.label', default: 'Issue Journal')}" />
					
						<g:sortableColumn property="kolKabinetOt" title="${message(code: 'instruction.kolKabinetOt.label', default: 'Kol Kabinet Ot')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${instructionInstanceList}" status="i" var="instructionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${instructionInstance.id}">${fieldValue(bean: instructionInstance, field: "infDate")}</g:link></td>
					
						<td>${fieldValue(bean: instructionInstance, field: "itogoInstructions")}</td>
					
						<td>${fieldValue(bean: instructionInstance, field: "procentInstructions")}</td>
					
						<td><g:formatBoolean boolean="${instructionInstance.regJournal}" /></td>
					
						<td><g:formatBoolean boolean="${instructionInstance.issueJournal}" /></td>
					
						<td>${fieldValue(bean: instructionInstance, field: "kolKabinetOt")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${instructionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
