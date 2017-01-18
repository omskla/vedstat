<%@ page import="vedstat.Verification" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'verification.label', default: 'Verification')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-verification" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>


<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                               args="[entityName]"/></g:link></li>
        </sec:ifAllGranted>

    </ul>
</div>

<div id="show-verification" class="content scaffold-show" role="main">
    <h1 style="text-align: right; color: #333333; font-size: medium;">
        %{--<g:message code="default.show.label" args="[entityName]"/>--}%
        <label for="isRepair">
            <g:message code="verification.isRepair.label" default="Is Repair"/>

        </label>
        <g:checkBox name="isRepair" value="${verificationInstance?.isRepair}"
                    onclick="${remoteFunction(
                            controller: 'verification',
                            action: 'test',
                            params: '\'onlyCheckbox=\'+true+\'&verId=\'+document.getElementById(\'verId\').value'
//                onLoading: 'showSpinner(\'fssOkvedTd\')',
//                onSuccess: "updateTd(data,\'fssOkvedTd\')",
//                params: '\'year=\'+document.getElementById(\'year\').value'

                    )}"/>


    </h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list verification">

        <g:if test="${verificationInstance?.verificationDate}">
            <li class="fieldcontain">
                <span id="verificationDate-label" class="property-label"><g:message
                        code="verification.verificationDate.label" default="Verification Date"/></span>

                <span class="property-value" aria-labelledby="verificationDate-label"><g:formatDate
                        date="${verificationInstance?.verificationDate}"/></span>

            </li>
        </g:if>

        <g:if test="${verificationInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="verification.description.label"
                                                                               default="Description"/></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                        bean="${verificationInstance}" field="description"/></span>

            </li>
        </g:if>

        <g:if test="${verificationInstance?.verificationStatus}">
            <li class="fieldcontain">
                <span id="verificationStatus-label" class="property-label"><g:message
                        code="verification.verificationStatus.label" default="Verification Status"/></span>

                <span class="property-value" aria-labelledby="verificationStatus-label"><g:link
                        controller="verificationStatus" action="show"
                        id="${verificationInstance?.verificationStatus?.id}">${verificationInstance?.verificationStatus?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${verificationInstance?.org}">
            <li class="fieldcontain">
                <span id="org-label" class="property-label"><g:message code="verification.org.label"
                                                                       default="Org"/></span>

                <span class="property-value" aria-labelledby="org-label"><g:link controller="org" action="show"
                                                                                 id="${verificationInstance?.org?.id}">${verificationInstance?.org?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>




    <input type="hidden" id = "verId" value="${verificationInstance.id}">

    <sec:ifAllGranted roles="ROLE_ADMIN">
        <g:form url="[resource: verificationInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${verificationInstance}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </sec:ifAllGranted>
</div>
</body>
</html>
