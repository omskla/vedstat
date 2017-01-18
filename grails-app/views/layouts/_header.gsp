<%@ page import="vedstat.MunicArea; vedstat.User;" %>
<style type="text/css" media="screen">
.status1 {
    background-color: #eee;
    border: .2em solid #fff;
    margin: 0em 1em 0em;
    padding: 1em;
    width: 10em;
    height: 8em;
    float: none;
    -moz-box-shadow: 0px 0px 1.25em #ccc;
    -webkit-box-shadow: 0px 0px 1.25em #ccc;
    box-shadow: 0px 0px 1.25em #ccc;
    -moz-border-radius: 0.6em;
    -webkit-border-radius: 0.6em;
    border-radius: 0.6em;
    text-align: left;
}
</style>
<div style="text-align: right;float: right;">

    <sec:ifLoggedIn>
        <%

            def user = User.findByUsername(sec.loggedInUserInfo(field: 'username'))
        %>

    %{--Вы вошли как --}%
        <span class="mini">${(user?.org == null) ? user.area : user?.org}</span>
    %{--<g:link controller="logout">выйти</g:link>      </b>--}%
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <g:link controller='login' action='auth' class="mini">войти</g:link>
    </sec:ifNotLoggedIn>
</div>
<br>
<div id="header">
    <div class="nav" role="navigation">



        <ul class="stat">
            <sec:ifAnyGranted roles="ROLE_ORG">

                <li>
                    <g:link controller="org" action="list">
                        <img src="${resource(dir: 'images/head', file: 'user.png')}" alt="Grails"/>
                        <br/>
                        Моя организация
                    </g:link>
                </li>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN">
                <li>
                    <g:link controller="org" action="list">
                        <img src="${resource(dir: 'images/ico', file: 'work.ico')}" alt="Grails"/>
                        <br/>
                        Список организаций
                    </g:link>
                </li>


                <li>
                    <g:link controller="org" action="search">
                        <img src="${resource(dir: 'images/ico', file: 'search.png')}" alt="Grails"/>
                        <br/>
                        Поиск организаций
                    </g:link>
                </li>
            </sec:ifAnyGranted>

            <li>
                <g:link controller="statistic">
                    <img src="${resource(dir: 'images/head', file: 'columnchart.png')}" alt="Grails"/>
                    <br/>
                    Статистика и<br/> отчетность
                </g:link>
            </li>

            <sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN">
            <li>
                <g:link controller="control" action="index">
                    <img src="${resource(dir: 'images/head', file: '128.png')}" alt="Grails"/>
                    <br/>
                    &nbsp;&nbsp;Контроль
                </g:link>
            </li>
            </sec:ifAnyGranted>

            <li>
                <div class="status1" role="complementary">
                    <ul>
                        <li><a href="${createLink(controller: "support")}">Поддержка</a></li>
                        <sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN">
                            <li><a href="${createLink(controller: "org", action: "create")}">Новая организация</a></li>
                        %{--<li><a href="${createLink(controller: "ot3Data",action: "index")}">Данные для ОТ3</a></li>--}%
                        </sec:ifAnyGranted>
                    %{--<sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN"> <li><a onclick="${remoteFunction(--}%
                    %{--controller: "org",--}%
                    %{--action: 'ohvatYear',--}%
                    %{--onLoading: 'showSpinner(\'png\')',--}%
                    %{--onSuccess:  "updateTd(data,\'png\')",--}%
                    %{--//                            params: '\'year=\'+document.getElementById(\'year\').value'--}%

                    %{--)}" >Что не хватает<span id ="png"></span></a></li>                 </sec:ifAnyGranted>--}%
                        <li><a href="${createLink(uri: "/")}">На главную</a></li>
                        <li><a href="${createLink(controller: "logout", action: "index")}">Выйти</a></li>

                    </ul>

                </div>

            </li>
        </ul>
    </div>
</div>
