<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>register</title>
</head>
<body>
<div class="body">
    <h1>Введите логин и пароль</h1>
    %{--<g:if test="${message}">--}%
        %{--<div class="message">${message}</div>--}%
    %{--</g:if>--}%
    %{--<g:hasErrors bean="${command}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${command}" as="list" />--}%
        %{--</div>--}%
    %{--</g:hasErrors>--}%
    %{--<g:form action="build">--}%
        %{--<div class="dialog">--}%
            %{--<table>--}%
                %{--<tbody>--}%
                %{--<tr class="prop">--}%
                    %{--<td valign="top" class="name">--}%
                        %{--<label for="firstName">Логин:</label>--}%
                    %{--</td>--}%
                    %{--<td valign="top">--}%
                        %{--<input type="text" id="firstName" name="firstName" value="${contact.firstName}" />--}%
                    %{--</td>--}%
                %{--</tr>--}%
                %{--<tr class="prop">--}%
                    %{--<td valign="top" class="name">--}%
                        %{--<label for="lastName">Пароль:</label>--}%
                    %{--</td>--}%
                    %{--<td valign="top">--}%
                        %{--<input type="text" id="lastName" name="lastName" value="${contact.lastName}" />--}%
                    %{--</td>--}%
                %{--</tr>--}%
                %{--</tbody>--}%
            %{--</table>--}%
        %{--</div>--}%
        %{--<div class="buttons">--}%
            %{--<span class="button">--}%
                %{--<g:submitButton class="next" name="next" value="Next" />--}%
                %{--<g:submitButton class="cancel" name="cancel" value="Cancel" />--}%
            %{--</span>--}%
        %{--</div>--}%
    %{--</g:form>--}%
</div>
</body>
</html>