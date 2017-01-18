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
    function showSpinner(idAfter) {
        var td = document.getElementById(idAfter);
        td.innerHTML = '<img src="${resource(dir: 'images', file: 'spinner.gif')}" />';
    }
    function showOk(idAfter) {
        var td = document.getElementById(idAfter);
        %{--td.innerHTML = '<img src="${resource(dir: 'images', file: 'ok.png')}" />';--}%
        td.innerHTML ='<a href="${createLink(controller: "org",action: "downloadOt4ByArea") }">скачать</a>'
    }

    function updateTd(data,idTd) {
        $.each(data, function (key, value) {
            var td = document.getElementById(idTd);
            if(key == 'action') {

                if(value=='repArea')
                {
                    td.innerHTML = '<a href="${createLink(controller: "reports",action: "downloadRepArea") }">скачать</a>' ;
                }
                if(value=='aivOb')
                    td.innerHTML = '<a href="${createLink(controller: "statistic",action: "downloadAivOb, params: [templateName:aivOb.xls]" ) }">скачать</a>' ;
                if(value=='infMonitor')
                    td.innerHTML = '<a href="${createLink(controller: "statistic",action: "downloadByTemplateName", params: [templateName: 'infMonitorX.xls']) }">скачать</a>' ;
            }

            else
                td.innerHTML = value;
        });
//        var td = document.getElementById("freqTravm");
//        td.innerHTML = '100000';
    }

    function checkYear() {
        var year = $('#year');
        if (year.val() == "") {
            alert("Заполните отчетную дату!");
            return false;
        }

    }
</script>

<div id="statistic" class="stat">
    <h1 style="text-align: center"><b>Статистические показатели по условиям и охране труда в органах исполнительной власти Омской области</b></h1>
    <br>
    <table>         <tr>
        <td colspan="2" style="text-align: center">
            <span id="orgType-label" class="property-label"><g:message code="org.orgType.labdel" default="Выберите отчетный год: " /></span>
            <g:select from="${2012..2017}" value="${year}" noSelection="['': '...']" name="year"
                      id="year"/>
            <br>
            %{--<span id="orgType-label" class="property-label"><g:message code="org.orgType.labdel" default="Муниципальный район: " /></span>--}%
            %{--<g:select from="${vedstat.MunicArea.list()}"  optionKey="id" value="${area}" noSelection="['': '...']" name="area"--}%
                      %{--id="area"/>--}%
            %{--<br>--}%

        </td>
    </tr>

        %{--<tr> <td>  <span id="aivOtSpan" onclick="${remoteFunction(--}%
                %{--controller: 'reports',--}%
                %{--action: 'repArea',--}%
                %{--onLoading: 'showSpinner(\'83p\')',--}%
                %{--onSuccess:  "updateTd(data,\'83p\')",--}%
                %{--params: '\'year=\'+document.getElementById(\'year\').value+\'&area=\'+document.getElementById(\'area\').value'--}%

        %{--)}"><a>Информация о состоянии условий и охраны труда у работодателей,<br> осуществляющих деятельность на территории Омской области </a></span>--}%

        %{--</td>--}%
            %{--<td id="83p" style="width: 30%;font-weight: bold">--}%

            %{--</td>--}%
        %{--</tr>--}%
        <tr> <td> <span id="aivObSpan" onclick="${remoteFunction(
        controller: "statistic",
        action: 'aivOb',
        onLoading: 'showSpinner(\'aivObWait\')',
        onSuccess:  "updateTd(data,\'aivObWait\')",
        params: '\'year=\'+document.getElementById(\'year\').value'

        )}"><a>Информация об обучении работников в органах исполнительной власти</a> </span>    </td>
        <td id="aivObWait" style="width: 30%;font-weight: bold">

        </td>
        </tr>

        <tr> <td> <span id="infMonitorSpan" onclick="${remoteFunction(
        controller: "statistic",
        action: 'infMonitor',
        onLoading: 'showSpinner(\'infMonitorWait\')',
        onSuccess:  "updateTd(data,\'infMonitorWait\')",
        params: '\'year=\'+document.getElementById(\'year\').value'

        )}"><a>Информация о количестве работодателей, охваченных мониторингом  </a>
        </span>    </td>
        <td id="infMonitorWait" style="width: 30%;font-weight: bold">

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
