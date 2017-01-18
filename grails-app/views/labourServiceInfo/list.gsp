
<%@ page import="vedstat.LabourServiceInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-labourServiceInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-labourServiceInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="infDate" title="${message(code: 'labourServiceInfo.infDate.label', default: 'Inf Date')}" />
					
						<g:sortableColumn property="kolLabourWorker" title="${message(code: 'labourServiceInfo.kolLabourWorker.label', default: 'Kol Labour Worker')}" />
					
						<th><g:message code="labourServiceInfo.typeOtWorker.label" default="Type Ot Worker" /></th>
					
						<g:sortableColumn property="fioWorker" title="${message(code: 'labourServiceInfo.fioWorker.label', default: 'Fio Worker')}" />
					
						<g:sortableColumn property="tel" title="${message(code: 'labourServiceInfo.tel.label', default: 'Tel')}" />
					
						<g:sortableColumn property="workExperience" title="${message(code: 'labourServiceInfo.workExperience.label', default: 'Work Experience')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${labourServiceInfoInstanceList}" status="i" var="labourServiceInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${labourServiceInfoInstance.id}">${fieldValue(bean: labourServiceInfoInstance, field: "infDate")}</g:link></td>
					
						<td>${fieldValue(bean: labourServiceInfoInstance, field: "kolLabourWorker")}</td>
					
						<td>${fieldValue(bean: labourServiceInfoInstance, field: "typeOtWorker")}</td>
					
						<td>${fieldValue(bean: labourServiceInfoInstance, field: "fioWorker")}</td>
					
						<td>${fieldValue(bean: labourServiceInfoInstance, field: "tel")}</td>
					
						<td>${fieldValue(bean: labourServiceInfoInstance, field: "workExperience")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${labourServiceInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
