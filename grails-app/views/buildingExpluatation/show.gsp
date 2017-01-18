<%@ page import="vedstat.BuildingExpluatation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-buildingExpluatation" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
    </ul>
</div>

<div id="show-buildingExpluatation" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>

    <h3 style="text-align: center"><b>${buildingExpluatationInstance?.org}</b></h3>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list buildingExpluatation">

        <g:if test="${buildingExpluatationInstance?.infDate}">
            <li class="fieldcontain">
                <span id="infDate-label" class="property-label"><g:message code="buildingExpluatation.infDate.label"
                                                                           default="Inf Date"/></span>

                <span class="property-value" aria-labelledby="infDate-label"><g:formatDate
                        date="${buildingExpluatationInstance?.infDate}"/></span>

            </li>
        </g:if>
        <g:if test="${buildingExpluatationInstance?.isKomissiaOsmotr}">
            <li class="fieldcontain">
                <span id="isKomissiaOsmotr-label" class="property-label"><g:message
                        code="buildingExpluatation.isKomissiaOsmotr.label" default="Is Komissia Osmotr"/></span>

                <span class="property-value" aria-labelledby="isKomissiaOsmotr-label"><g:formatBoolean
                        boolean="${buildingExpluatationInstance?.isKomissiaOsmotr}"/></span>

            </li>
        </g:if>

        <g:if test="${buildingExpluatationInstance?.isPrikazHeadOtv}">
            <li class="fieldcontain">
                <span id="isPrikazHeadOtv-label" class="property-label"><g:message
                        code="buildingExpluatation.isPrikazHeadOtv.label" default="Is Prikaz Head Otv"/></span>

                <span class="property-value" aria-labelledby="isPrikazHeadOtv-label"><g:formatBoolean
                        boolean="${buildingExpluatationInstance?.isPrikazHeadOtv}"/></span>

            </li>
        </g:if>

        <g:if test="${buildingExpluatationInstance?.isAktOsmotrBuilding}">
            <li class="fieldcontain">
                <span id="isAktOsmotrBuilding-label" class="property-label"><g:message
                        code="buildingExpluatation.isAktOsmotrBuilding.label" default="Is Akt Osmotr Building"/></span>

                <span class="property-value" aria-labelledby="isAktOsmotrBuilding-label"><g:formatBoolean
                        boolean="${buildingExpluatationInstance?.isAktOsmotrBuilding}"/></span>

            </li>
        </g:if>

        <g:if test="${buildingExpluatationInstance?.istehJur}">
            <li class="fieldcontain">
                <span id="istehJur-label" class="property-label"><g:message code="buildingExpluatation.istehJur.label"
                                                                            default="Isteh Jur"/></span>

                <span class="property-value" aria-labelledby="istehJur-label"><g:formatBoolean
                        boolean="${buildingExpluatationInstance?.istehJur}"/></span>

            </li>
        </g:if>

        <g:if test="${buildingExpluatationInstance?.isArenda}">
            <li class="fieldcontain">
                <span id="isArenda-label" class="property-label"><g:message code="buildingExpluatation.isArenda.label"
                                                                            default="Isteh Jur"/></span>

                <span class="property-value" aria-labelledby="isArenda-label"><g:formatBoolean
                        boolean="${buildingExpluatationInstance?.isArenda}"/></span>

            </li>
        </g:if>


        <g:if test="${buildingExpluatationInstance?.summ}">
            <li class="fieldcontain">
                <span id="summ-label" class="property-label"><g:message code="FSS.summ.label" default="Summ"/></span>

                <g:if test="${buildingExpluatationInstance.summ > 1000}">
                    <span class="property-value" style="color: red; font-weight: bold" aria-labelledby="summ-label">
                        <g:formatNumber number="${buildingExpluatationInstance.summ}" currencyCode="RUR" maxFractionDigits="2" minFractionDigits="2"/></span>
                </g:if>
                <g:else>
                    <span class="property-value" aria-labelledby="summ-label"><g:fieldValue
                            bean="${buildingExpluatationInstance}" field="summ"/></span>
                </g:else>
            </li>
        </g:if>

        <g:if test="${buildingExpluatationInstance?.summPerWorker}">
            <li class="fieldcontain">
                <span id="summPerWorker-label" class="property-label"><g:message code="FSS.summPerWorker.label"
                                                                                 default="Summ Per Worker"/></span>

                <span class="property-value" aria-labelledby="summPerWorker-label"><g:fieldValue
                        bean="${buildingExpluatationInstance}" field="summPerWorker"/></span>

            </li>
        </g:if>

        <g:if test="${buildingExpluatationInstance?.summToOt}">
            <li class="fieldcontain">
                <span id="summToOt-label" class="property-label"><g:message code="FSS.summToOt.label"
                                                                            default="Summ To Ot"/></span>

                <span class="property-value" aria-labelledby="summToOt-label"><g:fieldValue
                        bean="${buildingExpluatationInstance}" field="summToOt"/></span>

            </li>
        </g:if>


        <g:if test="${buildingExpluatationInstance?.org}">
            <li class="fieldcontain">
                <span id="org-label" class="property-label"><g:message code="buildingExpluatation.org.label"
                                                                       default="Org"/></span>

                <span class="property-value" aria-labelledby="org-label"><g:link controller="org" action="show"
                                                                                 id="${buildingExpluatationInstance?.org?.id}">${buildingExpluatationInstance?.org?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${buildingExpluatationInstance?.id}"/>
            <g:link class="edit" action="edit" id="${buildingExpluatationInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </sec:ifAllGranted>
        </fieldset>
    </g:form>
</div>
</body>
</html>
