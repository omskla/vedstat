
<%@ page import="vedstat.Org" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'org.label', default: 'Org')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-org" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-org" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="org.description.label" default="Area" /></th>
            %{--<th><g:message code="org.orgType.label" default="Org Type" /></th>--}%

            <th><g:message code="org.area.label" default="Area" /></th>

            %{--<g:sortableColumn property="guid" title="${message(code: 'org.guid.label', default: 'Guid')}" />--}%

        </tr>
        </thead>
        <tbody>
        <g:each in="${orgInstanceList}" status="i" var="orgInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${orgInstance.id}">${fieldValue(bean: orgInstance, field: "description")}</g:link></td>

                %{--<td>${fieldValue(bean: orgInstance, field: "orgType")}</td>--}%

                <td>${fieldValue(bean: orgInstance, field: "area")}</td>

                %{--<td>${fieldValue(bean: orgInstance, field: "guid")}</td>--}%

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${orgInstanceTotal}" action="showChild" params="${params}" />
    </div>
</div>
</body>
</html>
