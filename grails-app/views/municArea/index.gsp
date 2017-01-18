
<%@ page import="vedstat.MunicArea" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'municArea.label', default: 'MunicArea')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-municArea" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

                %{--<sec:ifAllGranted roles="ROLE_ADMIN">--}%
                %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			     %{--</sec:ifAllGranted>--}%
                <li><g:link class="list" controller="reports" action="areaInf">Информация о системе управления охраной труда в муниципальных районах Омской области</g:link></li>
            </ul>
		</div>
		<div id="list-municArea" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'municArea.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'municArea.code.label', default: 'Code')}" />
					
						%{--<g:sortableColumn property="declension" title="${message(code: 'municArea.declension.label', default: 'Declension')}" />--}%
					
						<g:sortableColumn property="head" title="${message(code: 'municArea.head.label', default: 'Head')}" />
					
						<g:sortableColumn property="specOt" title="${message(code: 'municArea.specOt.label', default: 'Spec Ot')}" />
                        <g:sortableColumn property="specTrud" title="${message(code: 'municArea.specTrud.label', default: 'Spec Ot')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${municAreaInstanceList}" status="i" var="municAreaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${municAreaInstance.id}">${fieldValue(bean: municAreaInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: municAreaInstance, field: "code")}</td>
					
						%{--<td>${fieldValue(bean: municAreaInstance, field: "declension")}</td>--}%
					
						<td>${fieldValue(bean: municAreaInstance, field: "head")}</td>
					
						<td>${fieldValue(bean: municAreaInstance, field: "specOt")}</td>
						<td>${fieldValue(bean: municAreaInstance, field: "specTrud")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${municAreaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
