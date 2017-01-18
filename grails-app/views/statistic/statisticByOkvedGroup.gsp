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
    function updateInfo(idTd,idSpan) {
        <g:remoteFunction controller="org" action="getIndexByOkvedGroup" onLoading="showSpinner(idTd)" onSuccess="updateTd(data,idTd)" params="'year='+document.getElementById(\'year\').value+\'&okvedGroup=\'+document.getElementById(\'okvedGroup\').value+\'&idSpan=\'+idSpan"/>
    }
</script>

<div id="statistic"  class="stat">
    <h1 style="text-align: center"><b>Производственный травматизм по группам ОКВЭД</b></h1>
    <table>
        <tr>
            <td colspan="2" style="text-align: center">
                <span id="orgType-label" class="property-label"><g:message code="org.orgType.labdel" default="Выберите отчетный год: " /></span>
                <g:select from="${2012..2016}" value="${year}" noSelection="['': '...']" name="year"
                          id="year"/>
                <br>
                <span id="orgType-label" class="property-label"><g:message code="org.orgType.labdel" default="Группа ОКВЭД: " /></span>
                <g:select from="${vedstat.GroupOkved.list()}" optionKey="id" value="${okvedGroup}" noSelection="['': '...']" name="okvedGroup"
                          id="okvedGroup"/>
                <br>
            </td>
        </tr>

        <tr>
            <td style="width: 70%" >
                <span id="freqTravmSpan" onclick="updateInfo('freqTravm',this.id);"><a>Коэффициент частоты травматизма</a></span>
            </td>
            <td id="freqTravm" style="width: 30%;font-weight: bold">

            </td>
        </tr>

        <tr>
            <td style="width: 70%">
                <span id="hardTravmSpan"  onclick="updateInfo('hardTravm',this.id);"><a>Коэффициент тяжести травматизма</a></span>
            </td>
            <td id="hardTravm" style="width: 30%;font-weight: bold">

            </td>
        </tr>

        <tr>
            <td style="width: 70%">
                <span id="deathSpan"  onclick="updateInfo('death',this.id);"><a>Численность пострадавших со смертельным исходом</a></span>
            </td>
            <td id="death" style="width: 30%; font-weight: bold">
            </td>
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
