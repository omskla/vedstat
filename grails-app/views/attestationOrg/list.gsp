
<%@ page import="vedstat.AttestationOrg" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attestationOrg.label', default: 'AttestationOrg')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-attestationOrg" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-attestationOrg" class="content scaffold-list" role="main">
            <h1  style="color: #000000; text-align: center">Реестр аккредитованных организаций, оказывающих услуги в области охраны труда, вы можете посмотреть на сайте <a style="color: #185f9b;" href = "http://rao.rosminzdrav.ru/"> http://rao.rosminzdrav.ru/</a></h1>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'attestationOrg.name.label', default: 'Name')}" />
					
						%{--<g:sortableColumn property="code" title="${message(code: 'attestationOrg.code.label', default: 'Code')}" />--}%
					
						<g:sortableColumn property="descryption" title="${message(code: 'attestationOrg.descryption.label', default: 'Descryption')}" />
					
						<g:sortableColumn property="tel" title="${message(code: 'attestationOrg.tel.label', default: 'Tel')}" />
					
						<g:sortableColumn property="adr" title="${message(code: 'attestationOrg.adr.label', default: 'Adr')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${attestationOrgInstanceList}" status="i" var="attestationOrgInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${attestationOrgInstance.id}">${fieldValue(bean: attestationOrgInstance, field: "name")}</g:link></td>
					
						%{--<td>${fieldValue(bean: attestationOrgInstance, field: "code")}</td>--}%
					
						<td>${fieldValue(bean: attestationOrgInstance, field: "descryption")}</td>
					
						<td>${fieldValue(bean: attestationOrgInstance, field: "tel")}</td>
					
						<td>${fieldValue(bean: attestationOrgInstance, field: "adr")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${attestationOrgInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
