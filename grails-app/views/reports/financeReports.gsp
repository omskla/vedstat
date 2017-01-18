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

    function updateTd(data, idTd) {
        $.each(data, function (key, value) {
            var td = document.getElementById(idTd);
            if (key == 'action') {
                if (value == 'fssArea') {
                    td.innerHTML = '<a href="${createLink(controller: "reports",action: "downloadFssArea") }">скачать</a>';
                }
                if (value == 'fssOkved')
                    td.innerHTML = '<a href="${createLink(controller: "reports",action: "downloadFssOkved") }">скачать</a>';
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
    <h1 style="text-align: center"><b>Затраты работодателей на охрану труда</b></h1>
    <table>
        <tr>
            <td colspan="2" style="text-align: center">
                <span class="property-label"><g:message code="report.year.label" default=""/></span>
                <g:select from="${2012..2017}" value="${year}" noSelection="['': '...']" name="year" id="year"/>
                <br>
            </td>
        </tr>
        <tr>
            <td>
                <span id="fssArea" onclick="${remoteFunction(
                        controller: 'reports',
                        action: 'fssArea',
                        onLoading: 'showSpinner(\'fssAreaTd\')',
                        onSuccess: "updateTd(data,\'fssAreaTd\')",
                        params: '\'year=\'+document.getElementById(\'year\').value'

                )}">
                    <a>Затраты работодателей на охрану труда, в том числе за счет средств ФСС, по муниципальным районам</a>
                </span>

            </td>
            <td id="fssAreaTd" style="width: 30%;font-weight: bold">

            </td>
        </tr>

        <tr>
            <td>
                <span id="fssOkved" onclick="${remoteFunction(
                        controller: 'reports',
                        action: 'fssOkved',
                        onLoading: 'showSpinner(\'fssOkvedTd\')',
                        onSuccess: "updateTd(data,\'fssOkvedTd\')",
                        params: '\'year=\'+document.getElementById(\'year\').value'

                )}">
                    <a>Затраты работодателей на охрану труда, в том числе за счет средств ФСС, по группам ОКВЭД</a>
                </span>

            </td>
            <td id="fssOkvedTd" style="width: 30%;font-weight: bold">
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
