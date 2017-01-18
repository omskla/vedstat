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



    <script>
        function updateInfo(idTd,idSpan) {
            <g:remoteFunction controller="statistic" action="getIndexByArea" onLoading="showSpinner(idTd)" onSuccess="updateTd(data,idTd)" params="'year='+document.getElementById(\'year\').value+\'&area=\'+document.getElementById(\'area\').value+\'&idSpan=\'+idSpan"/>
        }
    </script>



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



<div id="statistic" class="stat">
    <h1 style="text-align: center"><b>Производственный травматизм по муниципальным районам</b></h1>     <br>
    <table>
        <tr>
            <td colspan="2" style="text-align: center">
                <span id="orgType-label" class="property-label"><g:message code="org.orgType.labdel" default="Выберите отчетный год: " /></span>
                <g:select from="${2012..2016}" value="${year}" noSelection="['': '...']" name="year"
                          id="year"/>
                <br>
                <span id="orgType-label" class="property-label"><g:message code="org.orgType.labdel" default="Муниципальный район: " /></span>
                <g:select from="${vedstat.MunicArea.list()}"  optionKey="id" value="${area}" noSelection="['': '...']" name="area"
                          id="area"/>
                <br>

            </td>
        </tr>
        <tr>
            <td style="width: 70%">
                <span id="freqTravmSpan" onclick="updateInfo('freqTravm',this.id)"><a>Коэффициент частоты травматизма</a></span>
            </td>
            <td id="freqTravm" style="width: 30%;font-weight: bold; text-align: right">

            </td>
        </tr>
        <tr>
            <td style="width: 70%">
                <span id="hardTravmSpan"  onclick="updateInfo('hardTravm',this.id)"><a>Коэффициент тяжести травматизма</a></span>
            </td>
            <td id="hardTravm" style="width: 30%;font-weight: bold; text-align: right">

            </td>
        </tr>
        <tr>
            <td style="width: 70%">
                <span id="deathSpan"  onclick="updateInfo('death',this.id)"><a>Численность пострадавших со смертельным исходом</a></span>

            </td>
            <td id="death" style="width: 30%; font-weight: bold; text-align: right">

            </td>
        </tr>

        <tr>
            <td style="width: 70%">
                <span id="k1Span"  onclick="updateInfo('k1',this.id)"><a>Численность пострадавших в результате несчастных случаев на производстве с утратой трудоспособности на 1 рабочий день и более и со смертельным исходом в расчете на 1000 работающих </a>
                </span>

            </td>
            <td id="k1" style="width: 30%; font-weight: bold; text-align: right">

            </td>
        </tr>


        <tr>
            <td style="width: 70%">
                <span id="k3Span"  onclick="updateInfo('k3',this.id)"><a>Численность лиц с
                установленным в текущем году
                профессиональным заболеванием
                в расчете на 10000 работающих    </a>
                </span>

            </td>
            <td id="k3" style="width: 30%; font-weight: bold; text-align: right">

            </td>
        </tr>

        <tr>
            <td style="width: 70%">
                <span id="k6Span"  onclick="updateInfo('k6',this.id)"><a>Удельный вес численности работников, занятых в условиях, не отвечающих гигиеническим нормативам условий труда</a>

                </span>

            </td>
            <td id="k6" style="width: 30%; font-weight: bold; text-align: right">

            </td>
        </tr>
        <tr>
            <td style="width: 70%">
                <span id="k7Span"  onclick="updateInfo('k7',this.id)"><a>Удельный вес численности работников, занятых на рабочих местах, аттестованных по условиям труда </a>
                </span>
            </td>

            <td id="k7" style="width: 30%; font-weight: bold; text-align: right">
            </td>
        </tr>

        <tr>
            <td style="width: 70%">
                <span id="k8Span"  onclick="updateInfo('k8',this.id)">
                    <a>Количество организаций,имеющих декларацию соответствия условий труда государственным нормативным требованиям охраны труда </a>
                </span>

            </td>
            <td id="k8" style="width: 30%; font-weight: bold; text-align: right">
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
