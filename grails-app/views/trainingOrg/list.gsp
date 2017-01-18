
<%@ page import="vedstat.TrainingOrg" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trainingOrg.label', default: 'TrainingOrg')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-trainingOrg" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-trainingOrg" class="content scaffold-list" role="main">
            <h1  style="color: #000000; text-align: center">Реестр аккредитованных организаций, оказывающих услуги в области охраны труда, вы можете посмотреть на сайте <a style="color: #185f9b;" href = "http://rao.rosminzdrav.ru/"> http://rao.rosminzdrav.ru/</a></h1>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'trainingOrg.name.label', default: 'Name')}" />
					
						%{--<g:sortableColumn property="code" title="${message(code: 'trainingOrg.code.label', default: 'Code')}" />--}%
					
						<g:sortableColumn property="description" title="${message(code: 'trainingOrg.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="tel" title="${message(code: 'trainingOrg.tel.label', default: 'Tel')}" />
					
						<g:sortableColumn property="adr" title="${message(code: 'trainingOrg.adr.label', default: 'Adr')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${trainingOrgInstanceList}" status="i" var="trainingOrgInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${trainingOrgInstance.id}">${fieldValue(bean: trainingOrgInstance, field: "name")}</g:link></td>
					
						%{--<td>${fieldValue(bean: trainingOrgInstance, field: "code")}</td>--}%
					
						<td>${fieldValue(bean: trainingOrgInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: trainingOrgInstance, field: "tel")}</td>
					
						<td>${fieldValue(bean: trainingOrgInstance, field: "adr")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${trainingOrgInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
