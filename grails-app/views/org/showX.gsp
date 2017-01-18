<%@ page import="vedstat.GroupOkved" %>
<%--
  Created by IntelliJ IDEA.
  User: Vladimir
  Date: 04.01.13
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'org.label', default: 'Org')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <title>Статистика по осмотрам</title>


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
    </style>

</head>

<body>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>--}%
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label"--}%
        %{--args="[entityName]"/></g:link></li>--}%
        <li><g:link class="list" action="statistic" id="${orgInstance.id}">Статистика</g:link>
        </li>
        <li><g:link class="listX" action="show" id="${orgInstance.id}">Обычный вид</g:link>
        </li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<div id="status2" role="complementary">

    <g:if test="${orgInstance?.description}">
        <h4 style="text-align: center"><b><g:fieldValue bean="${orgInstance}" field="description"/></b></h4>
        <br>
        <hr>
    </g:if>


    <table style="text-align: center">
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
    <span style="text-align: right"><g:link action="edit" id="${orgInstance.id}"><h6>изменить</h6></g:link>
    </span>

</div>


<div class="body">

    <table class="test">
        <tbody>

        <td style="width:200px;">
            <div class="nav2"><span class="menuButton"><a id="diagramBut">Общая информация об организации</a></span>
            </div>

            <div class="nav2"><span class="menuButton"><a id="inspectionBut">Сведения о службе <br/>охраны труда</a>
            </span></div>

            <div class="nav2"><span class="menuButton"><a id="forecastBut">Сведения по обучению<br/> по ОТ</a></span>
            </div>

            <div class="nav2"><span class="menuButton"><a id="tiresInfoBut">Организация работы<br/> по ОТ</a></span>
            </div>

            <div class="nav2"><span class="menuButton"><a id="runLostBut">Аттестация<br/> рабочих мест</a></span></div>

            <div class="nav2"><span class="menuButton"><a id="compareRun1But">Надзор за зданиями и затраты на ОТ</a>
            </span></div>

            <div class="nav2"><span class="menuButton"><a id="compareRun2But">Производственный травматизм</a></span>
            </div>
        </td>
        <td>
            <g:form action="diagram" controller="statistics">
                <div class="dialog" id="diagram_div" style="display: none;">
                    %{--<h1>Общая информация об организации</h1>--}%


                    %{--<span id="instructions-label" class="property-label"><g:message code="org.instructions.label" default="Instructions" /></span>--}%
                    <table style="display: block; overflow-x: auto;">
                        <thead>

                        <th style="min-width: 70px;overflow-x: auto;">
                            отчетный год
                        </th>
                        <th style="min-width: 220px;overflow-x: auto;">
                            ФИО руководителя
                        </th>
                        <th style="min-width: 90px;overflow-x: auto;">
                            Численность <br>работников
                        </th>
                        <th style="min-width: 90px;overflow-x: auto;">
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
                                    <h3>${i.yearOfDate}</h3>
                                </td>
                                <td>
                                    <h3>${i.headOrg}</h3>
                                </td>
                                <td>
                                    <h3>${i.staff}</h3>
                                </td>
                                <td>
                                    <h3>${i.women}</h3>
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


                    %{--<div class="buttons">--}%
                    %{--<span class="button"><g:submitButton name="diagram" value="Выполнить"/></span>--}%
                    %{--</div>--}%

                </div>
            </g:form>


            <g:form action="inspectionRep" controller="statistics">
                <div class="dialog" id="inspection_div" style="display: none;">
                    <table style="display: block; overflow-x: auto;">
                        <thead>

                        <th style="min-width: 70px;overflow-x: auto;">
                            отчетный год
                        </th>
                        <th style="min-width: 120px;overflow-x: auto;">
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
                                    <h3>${i.yearOfDate}</h3>
                                </td>
                                <td>
                                    <h3>${i.kolLabourWorker}</h3>
                                </td>
                                <td>
                                    <h3>${i.typeOtWorker}</h3>
                                </td>
                                <td>
                                    <h3>${(i.isPrikazOt != null && i.isPrikazOt == true) ? "да" : "нет"}</h3>
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

                </div>
            </g:form>

            <g:form action="forecast" controller="statistics">
                <div class="dialog" id="forecast_div" style="display: none;">
                    <table style="display: block; overflow-x: auto;">
                        <thead>

                        <th style="min-width: 70px;overflow-x: auto;">
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

                </div>
            </g:form>


            <g:form action="tiresInfoRep" controller="statistics">
                <div class="dialog" id="tiresInfo_div" style="display: none;">
                    <table style="display: block; overflow-x: auto;">
                        <thead>

                        <th style="min-width: 70px;overflow-x: auto;">
                            отчетный год
                        </th>
                        <th style="min-width: 190px;overflow-x: auto;">
                            всего инструкций
                        </th>
                        <th style="min-width: 130px;overflow-x: auto;">
                            Наличие комитета<br> по ОТ
                        </th>
                        <th style="min-width: 170px;overflow-x: auto;">
                            год заключения <br>колдоговора
                        </th>
                        <th style="min-width: 10px;overflow-x: auto;">

                        </th>

                        </tr>
                        </thead>
                        <g:each in="${orgInstance.instructions.sort { it.infDate }}" var="i">
                            <tbody style="background-color: lightgoldenrodyellow">
                            <tr>

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
                        </g:each>
                    </table>
                    <span style="text-align: right"><g:link controller="instruction" action="copy"
                                                            params="['org.id': orgInstance.id]"><h6>копировать на следующий год</h6></g:link>
                    </span>
                    <span style="text-align: right"><g:link controller="instruction" action="create"
                                                            params="['org.id': orgInstance.id]"><h6>добавить запись</h6></g:link>
                    </span>
                </div>
            </g:form>



            <g:form action="runLost" controller="statistics">
                <div class="dialog" id="runLost_div" style="display: none;">
                    <table style="display: block">
                        <thead>

                        <th style="min-width: 70px;overflow-x: auto;">
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

                </div>
            </g:form>


            <g:form action="selectModels" controller="statistics">
                <div class="dialog" id="compareRun1_div" style="display: none;">
                    <table style="display: block">
                        <thead>

                        <th style="min-width: 70px;overflow-x: auto;">
                            отчетный год
                        </th>
                        <th style="min-width: 190px;overflow-x: auto;">
                            затраты на ОТ<br> всего(тыс. руб.)
                        </th>
                        <th style="min-width: 130px;overflow-x: auto;">
                            затраты на <br>сотрудника(тыс. руб.)
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

                </div>
            </g:form>



            <g:form action="compareRun2" name="compareRun2" controller="statistics">
                <div class="dialog" id="compareRun2_div" style="display: none;">
                    <table style="display: block;">
                        <thead>

                        <th style="min-width: 70px;overflow-x: auto;">
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

                </div>
            </g:form>

        </td>
        </tr>
        </tbody>
    </table>

</div>

<g:javascript>
    $("#diagramBut").click(function () {
        $("#diagram_div").show();
        $("#inspection_div").hide();
        $("#forecast_div").hide();
        $("#runLost_div").hide();
        $("#compareRun1_div").hide();
        $("#compareRun2_div").hide();
        $("#tiresInfo_div").hide();
    });

    $("#inspectionBut").click(function () {
        $("#diagram_div").hide();
        $("#inspection_div").show();
        $("#forecast_div").hide();
        $("#runLost_div").hide();
        $("#compareRun1_div").hide();
        $("#compareRun2_div").hide();
        $("#tiresInfo_div").hide();
    });

    $("#forecastBut").click(function () {

        $("#diagram_div").hide();
        $("#inspection_div").hide();
        $("#forecast_div").show();
        $("#runLost_div").hide();
        $("#compareRun1_div").hide();
        $("#compareRun2_div").hide();
        $("#tiresInfo_div").hide();
    });

    $("#runLostBut").click(function () {

        $("#diagram_div").hide();
        $("#inspection_div").hide();
        $("#forecast_div").hide();
        $("#runLost_div").show();
        $("#compareRun1_div").hide();
        $("#compareRun2_div").hide();
        $("#tiresInfo_div").hide();
    });

    $("#compareRun1But").click(function () {

        $("#diagram_div").hide();
        $("#inspection_div").hide();
        $("#forecast_div").hide();
        $("#runLost_div").hide();
        $("#compareRun1_div").show();
        $("#compareRun2_div").hide();
        $("#tiresInfo_div").hide();
    });

    $("#compareRun2But").click(function () {

        $("#diagram_div").hide();
        $("#inspection_div").hide();
        $("#forecast_div").hide();
        $("#runLost_div").hide();
        $("#compareRun1_div").hide();
        $("#compareRun2_div").show();
        $("#tiresInfo_div").hide();
    });

    $("#tiresInfoBut").click(function () {


        $("#diagram_div").hide();
        $("#inspection_div").hide();
        $("#forecast_div").hide();
        $("#runLost_div").hide();
        $("#compareRun1_div").hide();
        $("#compareRun2_div").hide();
        $("#tiresInfo_div").show();
    });



</g:javascript>
</body>
</html>