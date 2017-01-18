<%@ page import="vedstat.Verification" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'verification.label', default: 'Verification')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-verification" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-verification" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="verificationDate"
                              title="${message(code: 'verification.verificationDate.label', default: 'Verification Date')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'verification.description.label', default: 'Description')}"/>

            <th><g:message code="verification.verificationStatus.label" default="Verification Status"/></th>

            <th><g:message code="verification.org.label" default="Org"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${verificationInstanceList}" status="i" var="verificationInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${verificationInstance.id}">${fieldValue(bean: verificationInstance, field: "verificationDate")}</g:link></td>

                <td>${fieldValue(bean: verificationInstance, field: "description")}</td>

                <td>${fieldValue(bean: verificationInstance, field: "verificationStatus")}</td>

                <td>${fieldValue(bean: verificationInstance, field: "org")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${verificationInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
