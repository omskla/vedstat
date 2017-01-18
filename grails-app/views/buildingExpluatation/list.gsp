
<%@ page import="vedstat.BuildingExpluatation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-buildingExpluatation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-buildingExpluatation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="infDate" title="${message(code: 'buildingExpluatation.infDate.label', default: 'Inf Date')}" />
					
						<g:sortableColumn property="isKomissiaOsmotr" title="${message(code: 'buildingExpluatation.isKomissiaOsmotr.label', default: 'Is Komissia Osmotr')}" />
					
						<g:sortableColumn property="isPrikazHeadOtv" title="${message(code: 'buildingExpluatation.isPrikazHeadOtv.label', default: 'Is Prikaz Head Otv')}" />
					
						<g:sortableColumn property="isAktOsmotrBuilding" title="${message(code: 'buildingExpluatation.isAktOsmotrBuilding.label', default: 'Is Akt Osmotr Building')}" />
					
						<g:sortableColumn property="istehJur" title="${message(code: 'buildingExpluatation.istehJur.label', default: 'Isteh Jur')}" />
					
						<th><g:message code="buildingExpluatation.org.label" default="Org" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${buildingExpluatationInstanceList}" status="i" var="buildingExpluatationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${buildingExpluatationInstance.id}">${fieldValue(bean: buildingExpluatationInstance, field: "infDate")}</g:link></td>
					
						<td><g:formatBoolean boolean="${buildingExpluatationInstance.isKomissiaOsmotr}" /></td>
					
						<td><g:formatBoolean boolean="${buildingExpluatationInstance.isPrikazHeadOtv}" /></td>
					
						<td><g:formatBoolean boolean="${buildingExpluatationInstance.isAktOsmotrBuilding}" /></td>
					
						<td><g:formatBoolean boolean="${buildingExpluatationInstance.istehJur}" /></td>
					
						<td>${fieldValue(bean: buildingExpluatationInstance, field: "org")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${buildingExpluatationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
