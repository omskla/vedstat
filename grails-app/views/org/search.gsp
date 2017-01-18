
<%@ page import="vedstat.Org" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'org.label', default: 'Org')}" />
    <title><g:message code="default.lidst.label" args="[entityName]" default="Поиск по наименованию организации"/></title>
</head>
<body>
<a href="#list-org" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-org" class="stat" role="main">
    <h1 style="text-align: center"><g:message code="default.list.labelс" default="Поиск по наименованию организации"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <br>
    <g:form>
        <ol class="property-list org">
<li class="fieldcontain">
<span id="nameOrg-label" class="property-label">
            <g:message code="org.search.label" default="Введите ключевое слово поиска" />
        </span>
    <span class="property-value" aria-labelledby="description-label"><g:textField id="nameOrg"  name="nameOrg" /></span>

                                 </li>
        </ol>
    <br><br>
        <fieldset class="buttons">
            <g:actionSubmit class="stat" action="showSearchResult" value="${message(code: 'default.button.delgete.label', default: 'Поиск')}" />
        </fieldset>


    </g:form>



</div>
</body>
</html>
