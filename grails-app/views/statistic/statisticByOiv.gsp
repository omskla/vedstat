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
    %{--function showSpinner(idAfter) {--}%
    %{--var td = document.getElementById(idAfter);--}%
    %{--td.innerHTML = '<img src="${resource(dir: 'images', file: 'spinner.gif')}" />';--}%
    %{--}--}%
    function showOk(idAfter) {
        var td = document.getElementById(idAfter);
        %{--td.innerHTML = '<img src="${resource(dir: 'images', file: 'ok.png')}" />';--}%
        td.innerHTML ='<a href="${createLink(controller: "ot4",action: "downloadOt4ByOiv") }">скачать</a>'
    }

    function updateTd(data,idTd) {
        $.each(data, function (key, value) {
            var td = document.getElementById(idTd);
            if(key == 'action') {

                if(value=='statisticOt4ByOiv')
                {
                    td.innerHTML = '<a href="${createLink(controller: "ot4",action: "downloadOt4ByOiv") }">скачать</a>' ;
                }
            }
            else
                td.innerHTML = value;
        });
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
    <h1 style="text-align: center"><b>Общие статистические показатели по ОИВ </b></h1>        <br>
    <table>         <tr>
        <td colspan="2" style="text-align: center">
            <span id="orgType-label" class="property-label"><g:message code="org.orgType.labdel" default="Выберите отчетный год: " /></span>
            <g:select from="${2012..2016}" value="${year}" noSelection="['': '...']" name="year"
                      id="year"/>
            <br>

            <br/>
            <span id="orgType-label" class="property-label">
                <g:message code="org.orgType.labdel" default="ОИВ: "/>
            </span>
            <g:select from="${vedstat.HeadOrg.list()}"
                      optionKey="id"
                      value="${oiv}"
                      noSelection="['': '...']"
                      name="oiv"
                      id="oiv"/>
            <br/>          <br/>
        </td>
    </tr>
        <tr> <td>  <span id="oivOt4" onclick="${remoteFunction(
                controller: 'ot4',
                action: 'statisticOt4ByOiv',
                onLoading: 'showSpinner(\'oivOt4Wait\')',
                onSuccess:  "updateTd(data,\'oivOt4Wait\')",
                params:"'year='+document.getElementById(\'year\').value+\'&oiv=\'+document.getElementById(\'oiv\').value"

        )}"> <a>Статистические показатели  по форме ОТ4</a></span>

        </td>
            <td id="oivOt4Wait" style="width: 30%;font-weight: bold;text-align: right">

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
