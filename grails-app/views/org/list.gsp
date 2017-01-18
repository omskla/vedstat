
<%@ page import="vedstat.Org" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'org.label', default: 'Org')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

        <script>

            function showSpinner(idAfter) {
                var td = document.getElementById(idAfter);
                td.innerHTML = '      <a><img src="${resource(dir: 'images', file: 'spinner.gif')}" /></a>';
            }

            function updateTd(data,idTd) {
                $.each(data, function (key, value) {
                    var td = document.getElementById(idTd);
                    if(key == 'action') {

                        if(value=='ohvatYear')
                            td.innerHTML = '<a href="${createLink(controller: "statistic",action: "downloadByTemplateName", params: [templateName: 'ohvat.xls']) }"><img src="${resource(dir: 'images', file: 'dossierbleu_download16.ico')}" /><span class = "mini">скачать</span></a>' ;
                    }
                    else
                        td.innerHTML = value;
                });
//        var td = document.getElementById("freqTravm");
//        td.innerHTML = '100000';
            }



        </script>

    </head>
	<body>
		<a href="#list-org" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
            <li>
                <a onclick="${remoteFunction(
                    controller: "statistic",
                    action: 'ohvatYear',
                    onLoading: 'showSpinner(\'png\')',
                    onSuccess:  "updateTd(data,\'png\')",
            )}"> <span class="stat"> охват 2012-2016 </span></a>


            </li>
                <li>
                    <span id="png"></span>
                    </li>

                <div style="text-align: right">
                <g:form>
                    <span class="stat">Фильтр по: </span><g:select name="searchCategory" from ="${vedstat.Org.SearchCategories?.values()}" keys="${vedstat.Org.SearchCategories.values()*.name()}" required="" value="${searchCategory}"/>
                    <input type="search" name="searchable" value="${searchKeyword}"/>
                    <g:actionSubmit action="list"  value="поиск..." />
                </g:form>
                </div>

            </ul>





        </div>
		<div id="list-org" class="content scaffold-list" role="main">
			%{--<h3 style="text-align: center"><g:message code="default.list.label" args="[entityName]" /></h3>--}%
             %{--<div class="search-bar">--}%
                 %{--<g:form>--}%
                     %{--Фильтр по:<g:select name="searchCategory" from ="${vedstat.Org.SearchCategories?.values()}" keys="${vedstat.Org.SearchCategories.values()*.name()}" required="" value="${searchCategory}"/>--}%
                     %{--<input type="search" name="searchable" value="${searchKeyword}"/>--}%
                     %{--<g:actionSubmit action="list"  value="Search"/>--}%
                 %{--</g:form>--}%
             %{--</div>--}%

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <g:if test="${params.message}">
                <div class="message" role="status">${params.message}</div>
            </g:if>
			<table>
				<thead>
					<tr>

                        <th><g:message code="orgInformation.okved.label" default="Org Type" /></th>
						<g:sortableColumn property="description" title="${message(code: 'org.description.label', default: 'Description')}" />
                        <th><g:message code="org.v" default="ИНН" /></th>
						%{--<th><g:message code="org.orgType.label" default="Org Type" /></th>--}%
					
						<th><g:message code="org.area.label" default="Area" /></th>
					
						<th><g:message code="org.headOrg.label" default="Head Org" /></th>
					

					
					</tr>
				</thead>
				<tbody>
				<g:each in="${orgInstanceList}" status="i" var="orgInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td class="stat"><g:link action="show" id="${orgInstance.id}">${fieldValue(bean: orgInstance, field: "okved")}</g:link></td>
						<td class="stat"><g:link action="show" id="${orgInstance.id}">${fieldValue(bean: orgInstance, field: "description")}</g:link></td>
                        <td class="stat">${fieldValue(bean: orgInstance, field: "inn")}</td>
						%{--<td>${fieldValue(bean: orgInstance, field: "orgType")}</td>--}%
					
						<td class="stat">${fieldValue(bean: orgInstance, field: "area")}</td>
					
						<td class="stat">${fieldValue(bean: orgInstance, field: "headOrg")}</td>
					

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${orgInstanceTotal}" params="${params}"/>
			</div>
		</div>
	</body>
</html>
