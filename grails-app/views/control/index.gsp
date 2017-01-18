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
    <h1 style="text-align: center"><b>Контроль</b></h1>            <br>
    <table>
        <sec:ifAnyGranted roles="ROLE_USER,ROLE_ADMIN">
            <tr>
                <td>
                    <a href="${createLink(controller: "org", action: "list", params: [bad: 'yes'])}">
                        Список организаций с замечаниями
                    </a>
                </td>
            </tr>
        </sec:ifAnyGranted>
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <tr>
                <td>
                    <a href="${createLink(controller: "org", action: "list", params: [repair: 'yes'])}">
                        Список организаций с устраненными замечаниями
                    </a>
                </td>
            </tr>
        </sec:ifAllGranted>
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
