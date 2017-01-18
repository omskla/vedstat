<%@ page import="vedstat.Org" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    %{--<g:set var="entityName" value="${message(code: 'org.label', default: 'Org')}" />--}%
    %{--<title><g:message code="default.create.label" args="[entityName]" /></title>--}%
</head>
<body>
%{--<a href="#create-org" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--<div class="nav" role="navigation">--}%
    %{--<ul>--}%
        %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
        %{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
    %{--</ul>--}%
%{--</div>--}%
<div id="create-org" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${orgInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${orgInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form  >


        <div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'description', 'error')} ">
            <label for="description">
                <g:message code="org.description.label" default="Description" />

            </label>
            <g:textField name="description" value="${orgInstance?.description}" style="width: 600px"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'orgType', 'error')} ">
            <label for="orgType">
                <g:message code="org.orgType.label" default="Org Type" />

            </label>
            <g:select id="orgType" name="orgType.id" from="${vedstat.OrgType.list()}" optionKey="id" value="${orgInstance?.orgType?.id}" class="many-to-one" noSelection="['null': '']"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'area', 'error')} ">
            <label for="area">
                <g:message code="org.area.label" default="Area" />

            </label>
            <g:select id="area" name="area.id" from="${vedstat.MunicArea.list()}" optionKey="id" value="${orgInstance?.area?.id}" class="many-to-one" noSelection="['null': '']"/>
        </div>


        <div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'inn', 'error')} ">
            <label for="inn">
                <g:message code="orgInformation.inn.label" default="Inn" />

            </label>
            <g:textField name="inn" value="${orgInstance?.inn}"/>
        </div>
        <div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'okved', 'error')} ">
            <label for="okved">
                <g:message code="orgInformation.okved.label" default="Okved" />

            </label>
            <g:textField name="okved" value="${orgInstance?.okved}"/>
        </div>








        <div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'headOrg', 'error')} ">
            <label for="headOrg">
                <g:message code="org.headOrg.label" default="Head Org" />

            </label>
            <g:select id="headOrg" name="headOrg.id" from="${vedstat.HeadOrg.list()}" optionKey="id" value="${orgInstance?.headOrg?.id}" class="many-to-one" noSelection="['null': '']"/>
        </div>



        <fieldset class="buttons">
            <g:submitButton name="next" class="save" value="next" />
            <g:submitButton name="cancel" value="отмена" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
