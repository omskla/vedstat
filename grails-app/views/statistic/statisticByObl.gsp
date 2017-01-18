<%@ page import="vedstat.Org" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'org.label', default: 'Org')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>

    <style type="text/css" media="screen">

    #statistic {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 56em;
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
<a href="#show-org" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>--}%
    </ul>
</div>

<script>
    function updateInfo(idTd) {
        if (idTd == '83p') {
            var pathToController

            if (document.getElementById('okved').value != "") {
                pathToController = '<a href="${createLink(controller: "reports",action: "downloadRepAreaOkved") }">скачать</a>';
            }
            else {
                pathToController = '<a href="${createLink(controller: "reports",action: "downloadRepArea") }">скачать</a>';
            }
            <g:remoteFunction   controller="reports" action="repArea"
                            onLoading="showSpinner(idTd)"
                            onSuccess="updateTdWithController(data,idTd,pathToController)"
                            params="'year='+document.getElementById(\'year\').value+\'&area=\'+document.getElementById(\'area\').value+\'&okved=\'+document.getElementById(\'okved\').value"/>
        }
        if (idTd == 'armOkved') {
            var pathToController = '<a href="${createLink(controller: "reports",action: "downloadRepArmOkved") }">скачать</a>';
            <g:remoteFunction controller="reports"
            action="repArmOkved"
            onLoading="showSpinner(idTd)"
            onSuccess="updateTdWithController(data,idTd,pathToController)"
            params="'year='+document.getElementById(\'year\').value+\'&area=\'+document.getElementById(\'area\').value"/>
        }
        if (idTd == 'notOtTd') {
            var pathToController = '<a href="${createLink(controller: "reports",action: "downloadNotOt") }">скачать</a>';
            <g:remoteFunction
            controller="reports"
            action="notOt"
            onLoading="showSpinner(idTd)"
            onSuccess="updateTdWithController(data,idTd,pathToController)"
            params="'year='+document.getElementById(\'year\').value+\'&area=\'+document.getElementById(\'area\').value"/>
        }
        if (idTd == 'infObuchenieTd') {
            var pathToController = '<a href="${createLink(controller: "reports",action: "downloadInfObuchenie") }">скачать</a>';
            <g:remoteFunction
            controller="reports"
            action="infObuchenie"
            onLoading="showSpinner(idTd)"
            onSuccess="updateTdWithController(data,idTd,pathToController)"
            params="'year='+document.getElementById(\'year\').value+\'&area=\'+document.getElementById(\'area\').value"/>
        }
        if (idTd == 'infAttestationTd') {
            var pathToController = '<a href="${createLink(controller: "reports",action: "downloadInfAttestation") }">скачать</a>';
            <g:remoteFunction
            controller="reports"
            action="infAttestation"
            onLoading="showSpinner(idTd)"
            onSuccess="updateTdWithController(data,idTd,pathToController)"
            params="'year='+document.getElementById(\'year\').value+\'&area=\'+document.getElementById(\'area\').value"/>
        }

    }
</script>


<script>

    //    $( document ).ajaxSend(function(event,request,settings) {
    //        alert(event.target.id)
    //        $("#tester").hide();
    //    });

</script>


<div id="statistic" class="stat">
    <h1 style="text-align: center"><b>Статистические показатели по району(округу)</b></h1>
    <br>
    <table>
        <tr>
            <td colspan="2" style="text-align: center">
                <span id="orgType-label" class="property-label">
                    <g:message code="org.orgType.labdel" default="Выберите отчетный год: "/>
                </span>
                <g:select from="${2012..2017}" value="${year}" noSelection="['': '...']" name="year" id="year"/>
                <br/>
                <span id="orgType-label" class="property-label">
                    <g:message code="org.orgType.labdel" default="Муниципальный район: "/>
                </span>
                <g:select from="${vedstat.MunicArea.list()}"
                          optionKey="id"
                          value="${area}"
                          noSelection="['': '...']"
                          name="area"
                          id="area"/>
                <br/>
                <span id="orgType-label" class="property-label">
                    <g:message code="org.orgType.labdel" default="Группа ОКВЭД: "/>
                </span>
                <g:select from="${vedstat.GroupOkved.list()}"
                          optionKey="id"
                          value="${okved}"
                          noSelection="['': '...']"
                          name="okved"
                          id="okved"/>
                <br/>
            </td>
        </tr>
        <tr>
            <td>
                <span id="aivOtSpan" onclick="updateInfo('83p')">
                    <a>
                        Информация
                        о состоянии условий и охраны труда у работодателей,
                        <br> осуществляющих деятельность на территории Омской области
                    </a>
                </span>
            </td>
            <td id="83p" style="width: 30%;font-weight: bold">
            </td>
        </tr>

        <tr>
            <td>
                <span id="armOkvedSpan" onclick="updateInfo('armOkved')">
                    <a>Информация
                    о результатах проведения специальной оценки<br> условий труда (аттестации) у работодателей
                    </a>
                </span>
            </td>
            <td id="armOkved" style="width: 30%;font-weight: bold">

            </td>
        </tr>

        <tr>
            <td>
                <span id="notOT" onclick="updateInfo('notOtTd')">
                    <a>Информация
                    о работодателях, с численностью работающих более 50 человек,
                    у которых не проведена специальная оценка условий труда (аттестация рабочих мест)
                    </a>
                </span>
            </td>
            <td id="notOtTd" style="width: 30%;font-weight: bold">

            </td>
        </tr>
        <tr>
            <td>
                <span id="infObuchenie" onclick="updateInfo('infObuchenieTd')">
                    <a>Информация по обучению руководителей и специалистов по охране труда в организациях
                    </a>
                </span>
            </td>
            <td id="infObuchenieTd" style="width: 30%;font-weight: bold">

            </td>
        </tr>
        <tr>
            <td>
                <span id="infAttestation" onclick="updateInfo('infAttestationTd')">
                    <a>Информация по проведению спецоценки (аттестации) в организациях
                    </a>
                </span>
            </td>
            <td id="infAttestationTd" style="width: 30%;font-weight: bold">

            </td>
        </tr>

    </table>
</div>

<br>

%{--<div id="mainStat">--}%
%{--<g:form>--}%
%{--<fieldset class="buttons">--}%
%{--<g:link class="edit" action="list" id=""><g:message code="default.button.edit.label!!!!!!!"--}%
%{--default="Какое нибудь действие, если нужно"/></g:link>--}%
%{--<g:link class="edit" action="list" id=""><g:message code="default.button.edit.label!!!!!!!"--}%
%{--default="Какое нибудь еще одно   действие, если нужно"/></g:link>--}%
%{--</fieldset>--}%
%{--</g:form>--}%
%{--</div>--}%
</body>
</html>
