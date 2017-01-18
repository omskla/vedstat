
<%@ page import="vedstat.TrainingLabourInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-trainingLabourInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-trainingLabourInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="infDate" title="${message(code: 'trainingLabourInfo.infDate.label', default: 'Inf Date')}" />
					
						<g:sortableColumn property="kolTrainWorker" title="${message(code: 'trainingLabourInfo.kolTrainWorker.label', default: 'Kol Train Worker')}" />
					
						<g:sortableColumn property="yearTrainHear" title="${message(code: 'trainingLabourInfo.yearTrainHear.label', default: 'Year Train Hear')}" />
					
						<th><g:message code="trainingLabourInfo.orgTrainHead.label" default="Org Train Head" /></th>
					
						<g:sortableColumn property="kolTrainSpec" title="${message(code: 'trainingLabourInfo.kolTrainSpec.label', default: 'Kol Train Spec')}" />
					
						<g:sortableColumn property="yearTrainSpec" title="${message(code: 'trainingLabourInfo.yearTrainSpec.label', default: 'Year Train Spec')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${trainingLabourInfoInstanceList}" status="i" var="trainingLabourInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${trainingLabourInfoInstance.id}">${fieldValue(bean: trainingLabourInfoInstance, field: "infDate")}</g:link></td>
					
						<td>${fieldValue(bean: trainingLabourInfoInstance, field: "kolTrainWorker")}</td>
					
						<td>${fieldValue(bean: trainingLabourInfoInstance, field: "yearTrainHear")}</td>
					
						<td>${fieldValue(bean: trainingLabourInfoInstance, field: "orgTrainHead")}</td>
					
						<td>${fieldValue(bean: trainingLabourInfoInstance, field: "kolTrainSpec")}</td>
					
						<td>${fieldValue(bean: trainingLabourInfoInstance, field: "yearTrainSpec")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${trainingLabourInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
