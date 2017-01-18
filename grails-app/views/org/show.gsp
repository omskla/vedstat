<%@ page import="vedstat.Org" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'org.label', default: 'Org')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <style>
    #status2 {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 36em;
        float: inherit;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    #verification {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 15em;
        float: right;
        /*display: inline-block;*/
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    #mainInf {
        display: inline-block;
        float: left;
    }

    #orgInf {
        display: inline;
        float: left;
    }
    </style>

</head>

<body>
<a href="#show-org" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>--}%
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label"--}%
        %{--args="[entityName]"/></g:link></li>--}%
        <li><g:link class="list" action="statistic" id="${orgInstance.id}">Статистика</g:link>
        </li>
        <li><g:link class="listX" action="showX" id="${orgInstance.id}">Компактный вид</g:link>
        </li>
    </ul>
</div>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>



<div id="mainInf">

    <div id="status2" role="complementary">

        <g:if test="${orgInstance?.description}">
            <h4 style="text-align: center"><b><g:fieldValue bean="${orgInstance}" field="description"/></b></h4>
            <br>
            <hr>
        </g:if>


        <table style="text-align: center" class="stat">
            <tr>
                <td style="text-align: center"><b>Район</b></td>
                <td style="text-align: center"><b>ИНН</b></td>
                <td style="text-align: center"><b>ОКВЭД</b></td>
                <td style="text-align: center"><b>группа ОКВЭД</b></td>

            </tr>
            <tr>
                <td style="text-align: center"><g:link controller="municArea" action="show"
                                                       id="${orgInstance?.area?.id}">${orgInstance?.area?.encodeAsHTML()}</g:link></td>
                <td style="text-align: center"><g:fieldValue bean="${orgInstance}" field="inn"/></td>
                <td style="text-align: center"><g:fieldValue bean="${orgInstance}" field="okved"/></td>
                <td style="text-align: center"><g:fieldValue bean="${orgInstance}" field="groupOkved"/></td>

            </tr>
        </table>
        <g:if test="${orgInstance?.headOrg}">
            <h5 style="text-align: center;"><g:link style="color: #000000;" controller="headOrg" action="show"
                                                    id="${orgInstance?.headOrg?.id}">${orgInstance?.headOrg?.encodeAsHTML()}</g:link></h5>
            <br>
        </g:if>

        <hr>
        <span style="text-align: left"><h6 style="float: left">${orgInstance.status}</h6></span>
        <span style="text-align: right"><g:link action="edit" id="${orgInstance.id}"><h6>изменить</h6></g:link></span>
    </div>

    <div id="verification">
        <h4 style="text-align: center"><b>Контроль</b></h4>
        <br>
        <hr>
        <table style="text-align: center" class="stat">
            <tr>
                <td style="text-align: center"><b>Дата</b></td>
                <td style="text-align: center"><b>Отметка</b></td>
                <td style="text-align: center"><b>Решено</b></td>
            </tr>
        %{--<tbody style="background-color: #dae5ff;">--}%
            <g:each in="${orgInstance.verification.sort { it.verificationDate }}" var="i">

                <g:if test="${"bad".equals(i.verificationStatus.code) && (i.isResolve == false || i.isResolve == null)}">
                    <tr style="background-color: #cd5973; cursor: pointer;"  onclick='document.location="<g:createLink
                        controller="verification" action="show" id="${i.id}"/>";'>
                </g:if>

                <g:else><tr style="background-color: #dae5ff"></g:else>

                <td>
                    ${i.verificationDate.format("dd.MM.yyyy")}
                </td>
                <td>
                    ${i.verificationStatus}
                </td>
                <td>
                    <g:if test="${i.isResolve}">да</g:if><g:else>-</g:else>
                </td>
                </tr>
            </g:each>
        %{--</tbody>--}%
        </table>

        <hr>
    </div>
</div>

<div id="orgInf">

    <ol class="property-list org">

        <li class="fieldcontain">
            %{--<span id="instructions-label" class="property-label"><g:message code="org.instructions.label" default="Instructions" /></span>--}%
            <table style="display: block; overflow-x: auto;">
                <thead>
                <th style="min-width: 170px;overflow-x: auto;">
                    Общая информация <br>об организации
                </th>

                <th style="min-width: 90px;overflow-x: auto;">
                    отчетный год
                </th>
                <th style="min-width: 190px;overflow-x: auto;">
                    ФИО руководителя
                </th>
                <th style="min-width: 130px;overflow-x: auto;">
                    Численность <br>работников
                </th>
                <th style="min-width: 170px;overflow-x: auto;">
                    Из них<br>
                    женщин
                </th>
                <th style="min-width: 10px;overflow-x: auto;">

                </th>

                </tr>
                </thead>
                <g:each in="${orgInstance.orgInf.sort { it.infDate }}" var="i">
                    <tbody style="background-color: #e4fff8">
                    <tr>
                        <td>

                        </td>
                        <td>
                            ${i.yearOfDate}
                        </td>
                        <td>
                            <h5>${i.headOrg}</h5>
                        </td>
                        <td>
                            ${i.staff}
                        </td>
                        <td>
                            ${i.women}
                        </td>
                        <td>
                            <g:link controller="orgInformation" action="show" id="${i.id}">
                                <img src="${resource(dir: 'images/', file: 'show.ico')}" alt="Grails"/>
                            </g:link>
                            <g:link controller="orgInformation" action="edit" id="${i.id}">
                                <img src="${resource(dir: 'images/', file: 'pen.ico')}" alt="Grails"/>
                            </g:link>
                        </td>

                    </tr>
                    </tbody>


                %{--<span class="property-value" aria-labelledby="instructions-label"><g:link controller="instruction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>--}%
                </g:each>
            %{--<tfoot>--}%
            %{--<tr><td colspan="6" style="text-align: right"><g:link controller="instruction" action="create" params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link></TD></tr>--}%
            %{--</tfoot>--}%
            </table>
            <span style="text-align: right"><g:link controller="orgInformation" action="copy"
                                                    params="['org.id': orgInstance.id]"><h6>копировать на следующий год</h6></g:link>
            </span>
            <span style="text-align: right"><g:link controller="orgInformation" action="create"
                                                    params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link>
            </span>

        </li>



        %{--<g:if test="${orgInstance?.labourServiceInfo}">--}%
        %{--<li class="fieldcontain">--}%
        %{--<span id="labourServiceInfo-label" class="property-label"><g:message code="org.labourServiceInfo.label"--}%
        %{--default="Labour Service Info"/></span>--}%
        %{--<g:each in="${orgInstance.labourServiceInfo.sort { it.infDate }}" var="l">--}%
        %{--<span class="property-value" aria-labelledby="labourServiceInfo-label"><g:link--}%
        %{--controller="labourServiceInfo" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>--}%
        %{--</g:each>--}%

        %{--</li>--}%
        %{--</g:if>--}%


        <li class="fieldcontain">
            %{--<span id="instructions-label" class="property-label"><g:message code="org.instructions.label" default="Instructions" /></span>--}%
            <table style="display: block; overflow-x: auto;">
                <thead>
                <th style="min-width: 170px;overflow-x: auto;">
                    Сведения о службе <br>охраны труда
                </th>

                <th style="min-width: 90px;overflow-x: auto;">
                    отчетный год
                </th>
                <th style="min-width: 190px;overflow-x: auto;">
                    Всего  специалистов<br> по ОТ
                </th>
                <th style="min-width: 130px;overflow-x: auto;">
                    Вид трудовых <br>отношений
                </th>
                <th style="min-width: 170px;overflow-x: auto;">
                    Наличие приказа о <br>системе управления ОТ

                </th>
                <th style="min-width: 10px;overflow-x: auto;">

                </th>

                </tr>
                </thead>
                <g:each in="${orgInstance.labourServiceInfo.sort { it.infDate }}" var="i">
                    <tbody style="background-color: #dae5ff;">
                    <tr>
                        <td>

                        </td>
                        <td>
                            ${i.yearOfDate}
                        </td>
                        <td>
                            ${i.kolLabourWorker}
                        </td>
                        <td>
                            ${i.typeOtWorker}
                        </td>
                        <td>
                            ${(i.isPrikazOt != null && i.isPrikazOt == true) ? "да" : "нет"}
                        </td>
                        <td>
                            <g:link controller="labourServiceInfo" action="show" id="${i.id}">
                                <img src="${resource(dir: 'images/', file: 'show.ico')}" alt="Grails"/>
                            </g:link>
                            <g:link controller="labourServiceInfo" action="edit" id="${i.id}">
                                <img src="${resource(dir: 'images/', file: 'pen.ico')}" alt="Grails"/>
                            </g:link>
                        </td>

                    </tr>
                    </tbody>


                %{--<span class="property-value" aria-labelledby="instructions-label"><g:link controller="instruction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>--}%
                </g:each>
            %{--<tfoot>--}%
            %{--<tr><td colspan="6" style="text-align: right"><g:link controller="instruction" action="create" params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link></TD></tr>--}%
            %{--</tfoot>--}%
            </table>
            <span style="text-align: right"><g:link controller="labourServiceInfo" action="copy"
                                                    params="['org.id': orgInstance.id]"><h6>копировать на следующий год</h6></g:link>
            </span>
            <span style="text-align: right"><g:link controller="labourServiceInfo" action="create"
                                                    params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link>
            </span>

        </li>

        %{--<g:if test="${orgInstance?.trainingLabourInfo}">--}%
        %{--<li class="fieldcontain">--}%
        %{--<span id="trainingLabourInfo-label" class="property-label"><g:message code="org.trainingLabourInfo.label"--}%
        %{--default="Training Labour Info"/></span>--}%

        %{--<g:each in="${orgInstance.trainingLabourInfo.sort { it.infDate }}" var="t">--}%
        %{--<span class="property-value" aria-labelledby="trainingLabourInfo-label"><g:link--}%
        %{--controller="trainingLabourInfo" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>--}%
        %{--</g:each>--}%

        %{--</li>--}%
        %{--</g:if>--}%


        <li class="fieldcontain">
            %{--<span id="instructions-label" class="property-label"><g:message code="org.instructions.label" default="Instructions" /></span>--}%
            <table style="display: block; overflow-x: auto;">
                <thead>
                <th style="min-width: 170px;overflow-x: auto;">
                    Сведения по <br>обучению по ОТ
                </th>

                <th style="min-width: 90px;overflow-x: auto;">
                    отчетный год
                </th>
                <th style="min-width: 190px;overflow-x: auto;">
                    Год обучения<br> руководителя
                </th>
                <th style="min-width: 130px;overflow-x: auto;">
                    Обучено  спец.<br> по ОТ
                </th>
                <th style="min-width: 170px;overflow-x: auto;">
                    Всего обучено<br> работников
                </th>
                <th style="min-width: 10px;overflow-x: auto;">

                </th>

                </tr>
                </thead>
                <g:each in="${orgInstance.trainingLabourInfo.sort { it.infDate }}" var="i">
                    <tbody style="background-color: #ffedf2;">
                    <tr>
                        <td>

                        </td>
                        <td>
                            ${i.yearOfDate}
                        </td>
                        <td>
                            ${i.yearTrainHear}
                        </td>
                        <td>
                            ${i.kolTrainSpec}
                        </td>
                        <td>
                            ${i.itogoObuchSpec}
                        </td>
                        <td>
                            <g:link controller="trainingLabourInfo" action="show" id="${i.id}">
                                <img src="${resource(dir: 'images/', file: 'show.ico')}" alt="Grails"/>
                            </g:link>
                            <g:link controller="trainingLabourInfo" action="edit" id="${i.id}">
                                <img src="${resource(dir: 'images/', file: 'pen.ico')}" alt="Grails"/>
                            </g:link>
                        </td>

                    </tr>
                    </tbody>


                %{--<span class="property-value" aria-labelledby="instructions-label"><g:link controller="instruction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>--}%
                </g:each>
            %{--<tfoot>--}%
            %{--<tr><td colspan="6" style="text-align: right"><g:link controller="instruction" action="create" params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link></TD></tr>--}%
            %{--</tfoot>--}%
            </table>
            <span style="text-align: right"><g:link controller="trainingLabourInfo" action="copy"
                                                    params="['org.id': orgInstance.id]"><h6>копировать на следующий год</h6></g:link>
            </span>
            <span style="text-align: right"><g:link controller="trainingLabourInfo" action="create"
                                                    params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link>
            </span>

        </li>




        <li class="fieldcontain">
            %{--<span id="instructions-label" class="property-label"><g:message code="org.instructions.label" default="Instructions" /></span>--}%
            <table style="display: block; overflow-x: auto;">
                <thead>
                <th style="min-width: 170px;overflow-x: auto;">
                    Организация<br> работы по ОТ
                </th>

                <th style="min-width: 90px;overflow-x: auto;">
                    отчетный год
                </th>
                <th style="min-width: 190px;overflow-x: auto;">
                    всего инструкций
                </th>
                <th style="min-width: 130px;overflow-x: auto;">
                    Наличие комитета<br> по ОТ
                </th>
                <th style="min-width: 170px;overflow-x: auto;">
                    год заключения <br>ТД
                </th>
                <th style="min-width: 10px;overflow-x: auto;">

                </th>

                </tr>
                </thead>
                <g:each in="${orgInstance.instructions.sort { it.infDate }}" var="i">
                    <tbody style="background-color: lightgoldenrodyellow">
                    <tr>
                        <td>

                        </td>
                        <td>
                            ${i.yearOfDate}
                        </td>
                        <td>
                            ${i.itogoInstructions}
                        </td>
                        <td>
                            ${(i.isKomitetOt == true) ? "да" : "нет"}
                        </td>
                        <td>
                            ${i.yearKollectDog}
                        </td>
                        <td>
                            <g:link controller="instruction" action="show" id="${i.id}">
                                <img src="${resource(dir: 'images/', file: 'show.ico')}" alt="Grails"/>
                            </g:link>
                            <g:link controller="instruction" action="edit" id="${i.id}">
                                <img src="${resource(dir: 'images/', file: 'pen.ico')}" alt="Grails"/>
                            </g:link>
                        </td>

                    </tr>
                    </tbody>


                %{--<span class="property-value" aria-labelledby="instructions-label"><g:link controller="instruction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>--}%
                </g:each>
            %{--<tfoot>--}%
            %{--<tr><td colspan="6" style="text-align: right"><g:link controller="instruction" action="create" params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link></TD></tr>--}%
            %{--</tfoot>--}%
            </table>
            <span style="text-align: right"><g:link controller="instruction" action="copy"
                                                    params="['org.id': orgInstance.id]"><h6>копировать на следующий год</h6></g:link>
            </span>
            <span style="text-align: right"><g:link controller="instruction" action="create"
                                                    params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link>
            </span>

        </li>




        <li class="fieldcontain">
            %{--<span id="attestation-label" class="property-label"><g:message code="org.attestation.label" default="Attestation" /></span>--}%
            <table style="display: block">
                <thead>
                <th style="min-width: 170px;overflow-x: auto;">
                    Аттестация РМ
                </th>

                <th style="min-width: 90px;overflow-x: auto;">
                    отчетный год
                </th>
                <th style="min-width: 190px;overflow-x: auto;">
                    Количество <br>рабочих мест
                </th>
                <th style="min-width: 130px;overflow-x: auto;">
                    завершена АРМ
                </th>
                <th style="min-width: 170px;overflow-x: auto;">
                    всего аттестовано
                </th>
                <th style="min-width: 10px;overflow-x: auto;">

                </th>
                </tr>
                </thead>
                <g:each in="${orgInstance.attestation.sort { it.infDate }}" var="a">
                %{--<span class="property-value" aria-labelledby="attestation-label"><g:link controller="attestation" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>--}%

                    <tbody style="background-color: honeydew">
                    <tr>
                        <td>

                        </td>
                        <td>
                            ${a.yearOfDate}
                        </td>
                        <td>
                            ${a.kolWorkingPlace}
                        </td>
                        <td>
                            ${a.dateSert}
                        </td>
                        <td>
                            ${a.kolAttestationPlace}
                        </td>
                        <td>
                            <g:link controller="attestation" action="show" id="${a.id}">
                                <img src="${resource(dir: 'images/', file: 'show.ico')}" alt="Grails"/>
                            </g:link>
                            <g:link controller="attestation" action="edit" id="${a.id}">
                                <img src="${resource(dir: 'images/', file: 'pen.ico')}" alt="Grails"/>
                            </g:link>
                        </td>
                    </tr>
                    </tbody>

                </g:each>
            %{--<tfoot>--}%
            %{--<tr><td colspan="6" style="text-align: right"><g:link controller="attestation" action="create" params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link></TD></tr>--}%
            %{--</tfoot>--}%
            </table>
            <span style="text-align: right"><g:link controller="attestation" action="copy"
                                                    params="['org.id': orgInstance.id]"><h6>копировать на следующий год</h6></g:link>
            </span>
            <span style="text-align: right"><g:link controller="attestation" action="create"
                                                    params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link>
            </span>

        </li>



        <li class="fieldcontain">
            %{--<span id="buildinhExpluatation-label" class="property-label"><g:message code="org.buildinhExpluatation.label" default="Buildinh Expluatation" /></span>--}%
            <table style="display: block">
                <thead>
                <th style="min-width: 170px;overflow-x: auto;">
                    Надзор за зданиями<br>и затраты на ОТ
                </th>

                <th style="min-width: 90px;overflow-x: auto;">
                    отчетный год
                </th>
                <th style="min-width: 190px;overflow-x: auto;">
                    затраты на ОТ<br> всего(тыс. руб.)
                </th>
                <th style="min-width: 130px;overflow-x: auto;">
                    затраты на <br> сотрудника(тыс. руб.)

                </th>
                <th style="min-width: 170px;overflow-x: auto;">
                    затраты на <br>ФСС(тыс. руб.)
                </th>
                <th style="min-width: 10px;overflow-x: auto;">

                </th>
                </tr>
                </thead>
                <g:each in="${orgInstance.buildinhExpluatation.sort { it.infDate }}" var="b">
                %{--<span class="property-value" aria-labelledby="buildinhExpluatation-label"><g:link controller="buildingExpluatation" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>--}%


                    <tbody style="background-color: #dbf8ff">
                    <tr>
                        <td>

                        </td>
                        <td>
                            ${b.yearOfDate}
                        </td>
                        <td>
                            ${b.summ}
                        </td>
                        <td>
                            ${b.summPerWorker}
                        </td>
                        <td>
                            ${b.summToOt}
                        </td>
                        <td>
                            <g:link controller="buildingExpluatation" action="show" id="${b.id}">
                                <img src="${resource(dir: 'images/', file: 'show.ico')}" alt="Grails"/>
                            </g:link>
                            <g:link controller="buildingExpluatation" action="edit" id="${b.id}">
                                <img src="${resource(dir: 'images/', file: 'pen.ico')}" alt="Grails"/>
                            </g:link>
                        </td>
                    </tr>
                    </tbody>

                </g:each>
            %{--<tfoot>--}%
            %{--<tr><td colspan="6" style="text-align: right"><g:link controller="buildingExpluatation" action="create" params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link></TD></tr>--}%
            %{--</tfoot>  --}%
            </table>
            <span style="text-align: right"><g:link controller="buildingExpluatation" action="copy"
                                                    params="['org.id': orgInstance.id]"><h6>копировать на следующий год</h6></g:link>
            </span>
            <span style="text-align: right"><g:link controller="buildingExpluatation" action="create"
                                                    params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link>
            </span>

        </li>









        <li class="fieldcontain">
            %{--<span id="unluck-label" class="property-label"><g:message code="org.unluck.label" default="Unluck" /></span>--}%
            <table style="display: block;">
                <thead>
                <th style="min-width: 170px;overflow-x: auto;">
                    Производственный <br>травматизм
                </th>

                <th style="min-width: 90px;overflow-x: auto;">
                    отчетный год
                </th>
                <th style="min-width: 190px;overflow-x: auto;">
                    всего несчастных<br>случаев
                </th>
                <th style="min-width: 130px;overflow-x: auto;">
                    всего <br>пострадавших
                </th>
                <th style="min-width: 170px;overflow-x: auto;">
                    число дней<br> нетрудоспособности
                </th>
                <th style="min-width: 10px;overflow-x: auto;">

                </th>
                </tr>
                </thead>
                <g:each in="${orgInstance.unluck.sort { it.infDate }}" var="u">

                    <tbody style="background-color: antiquewhite">
                    <tr>
                        <td style="display: block;min-width: 25%; overflow: auto;">

                        </td>
                        <td>
                            ${u.yearOfDate}
                        </td>
                        <td>
                            ${u.kolUnluck}
                        </td>
                        <td>
                            ${u?.itogo}
                        </td>
                        <td>
                            ${u?.kolDaysNot}
                        </td>
                        <td>
                            <g:link controller="unlucky" action="show" id="${u.id}">
                                <img src="${resource(dir: 'images/', file: 'show.ico')}" alt="Grails"/>
                            </g:link>
                            <g:link controller="unlucky" action="edit" id="${u.id}">
                                <img src="${resource(dir: 'images/', file: 'pen.ico')}" alt="Grails"/>
                            </g:link>
                        </td>
                    </tr>
                    </tbody>



                %{--<span class="property-value" aria-labelledby="unluck-label"><g:link controller="unlucky" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>--}%
                </g:each>
            %{--<tfoot>--}%
            %{--<tr><td colspan="6" style="text-align: right"><g:link controller="unlucky" action="create" params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link></TD></tr>--}%
            %{--</tfoot>   --}%
            </table>
            <span style="text-align: right"><g:link controller="unlucky" action="copy"
                                                    params="['org.id': orgInstance.id]"><h6>копировать на следующий год</h6></g:link>
            </span>
            <span style="text-align: right"><g:link controller="unlucky" action="create"
                                                    params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link>
            </span>

        </li>

        %{--<g:if test="${orgInstance?.headOrg}">--}%
        %{--<li class="fieldcontain">--}%
        %{--<span id="headOrg-label" class="property-label"><g:message code="org.headOrg.label" default="Head Org"/></span>--}%

        %{--<span class="property-value" aria-labelledby="headOrg-label"><g:link controller="headOrg" action="show"--}%
        %{--id="${orgInstance?.headOrg?.id}">${orgInstance?.headOrg?.encodeAsHTML()}</g:link></span>--}%

        %{--</li>--}%
        %{--</g:if>--}%

    </ol>
%{--<g:form>--}%
%{--<fieldset class="buttons">--}%
%{--<g:hiddenField name="id" value="${orgInstance?.id}"/>--}%
%{--<g:link class="edit" action="edit" id="${orgInstance?.id}"><g:message code="default.button.edit.label"--}%
%{--default="Edit"/></g:link>--}%
%{--<sec:ifAllGranted roles="ROLE_SUPER_ADMIN">--}%
%{--<g:actionSubmit class="delete" action="delete"--}%
%{--value="${message(code: 'default.button.delete.label', default: 'Delete')}"--}%
%{--onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>--}%
%{--</sec:ifAllGranted>--}%
%{--</fieldset>--}%
%{--</g:form>--}%

    <sec:ifAllGranted roles="ROLE_ADMIN">
        <div id="mainStat" style="text-align: right">
            <g:form>
                <fieldset class="buttons">
                    <g:link class="edit"
                            controller="verification"
                            action="create"
                            params="['org.id': orgInstance.id]">
                        <g:message code="default.button.edit.label!!!!!!!"
                                   default="добавить отметку о проверке"/></g:link>
                </fieldset>
            </g:form>
        </div>

    </sec:ifAllGranted>

</div>
</body>
</html>
