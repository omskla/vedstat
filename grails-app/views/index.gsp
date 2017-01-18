<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Система ведомственной статистики по охране труда</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

            #status2 {
                background-color: #eee;
                border: .2em solid #fff;
                margin: 2em 2em 1em;
                padding: 1em;
                width: 17em;
                float: left;
                -moz-box-shadow: 0px 0px 1.25em #ccc;
                -webkit-box-shadow: 0px 0px 1.25em #ccc;
                box-shadow: 0px 0px 1.25em #ccc;
                -moz-border-radius: 0.6em;
                -webkit-border-radius: 0.6em;
                border-radius: 0.6em;
            }


			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN, ROLE_ORG">
    <div id="status2" role="complementary">

        <div class="stat">
        <h1 style="text-align: center">справочники</h1>      <br>
        <table>
            <tr> <td> <a href="${createLink(controller: "attestationOrg",action: "list") }">Аттестующие организации</a>     </td>
            </tr>
            <tr> <td><a href="${createLink(controller: "trainingOrg",action: "list") }">Обучающие организации</a>    </td>
            </tr>

            <tr> <td><a href="${createLink(controller: "groupOkved",action: "list") }">Группы по ОКВЭД</a>    </td>
            </tr>
            <tr> <td><a href="${createLink(controller: "headOrg",action: "list") }">Органы Исполнительной Власти</a>    </td>
            </tr>
            <tr> <td><a href="${createLink(controller: "municArea",action: "index") }">Муниципальные районы</a>    </td>
            </tr>
            <tr> <td><a href="${createLink(controller: "orgType",action: "list")}">Типы организаций</a> </td>
            </tr>
            <tr> <td><a href="${createLink(controller: "status",action: "index")}">Статусы организаций</a> </td>
            </tr>

        </table>
        </div>

        %{--<ul>--}%
            %{--<li> <a href="${createLink(controller: "attestationOrg",action: "list") }">список аккредитующих организаций</a></li>--}%
            %{--<li> <a href="${createLink(controller: "trainingOrg",action: "list") }">список обучающих организаций</a></li>--}%
            %{--<li> <a href="${createLink(controller: "education",action: "list") }">образования</a></li>--}%
            %{--<li> <a href="${createLink(controller: "labourServiceInfo",action: "create") }">заполнить сведения об обучение по охране труда</a></li>--}%
            %{--<li> <a href="${createLink(uri: '/')}">на главную</a></li>--}%
            %{--<li> <a href="${createLink(uri: '/')}">на главную</a></li>--}%
            %{--<li> <a href="${createLink(uri: '/')}">на главную</a></li>--}%
            %{--<li> <a href="${createLink(uri: '/')}">на главную</a></li>--}%
            %{--<li> <a href="${createLink(uri: '/')}">на главную</a></li>--}%
        %{--</ul>--}%

    </div>
    </sec:ifAnyGranted>
		<div id="page-body" role="main" class="stat">
			<h1 style="text-align: center">Мониторинг по охране труда</h1>      <hr>
			%{--<p>Тестовая версия, ограниченный функционал</p>--}%

            <div style="text-align: center">
            <img style="text-align: center" src="${resource(dir: 'images', file: 'LOGO.jpg')}" alt="Grails"/>
                                         </div>

            %{--<div id="controller-list" role="navigation">--}%
				%{--<h2>Available Controllers:</h2>--}%
				%{--<ul>--}%
					%{--<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">--}%
						%{--<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>--}%
					%{--</g:each>--}%
				%{--</ul>--}%
			%{--</div>--}%

		</div>
	</body>
</html>
