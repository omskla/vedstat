
<%@ page import="vedstat.OrgInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orgInformation.label', default: 'OrgInformation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-orgInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-orgInformation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="infDate" title="${message(code: 'orgInformation.infDate.label', default: 'Inf Date')}" />

						<g:sortableColumn property="headOrg" title="${message(code: 'orgInformation.headOrg.label', default: 'Head Org')}" />
					
						<g:sortableColumn property="tel" title="${message(code: 'orgInformation.tel.label', default: 'Tel')}" />
					
						<g:sortableColumn property="fax" title="${message(code: 'orgInformation.fax.label', default: 'Fax')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${orgInformationInstanceList}" status="i" var="orgInformationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${orgInformationInstance.id}">${fieldValue(bean: orgInformationInstance, field: "infDate")}</g:link></td>

						<td>${fieldValue(bean: orgInformationInstance, field: "headOrg")}</td>
					
						<td>${fieldValue(bean: orgInformationInstance, field: "tel")}</td>
					
						<td>${fieldValue(bean: orgInformationInstance, field: "fax")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${orgInformationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
