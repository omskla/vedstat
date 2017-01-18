
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'attestation.label', default: 'Attestation')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-attestation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<div id="list-attestation" class="content scaffold-list" role="main">
    <h1 style="text-align: center">Поддержка</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table  class="stat">
        <thead>

            <th style="width: 41%;text-align: center" >Должность</th>
            <th style="width: 25%;text-align: center">ФИО</th>
            <th style="width: 19%;text-align: center">Контакты</th>
        <th style="width: 15%;text-align: center">e-mail</th>
        </thead>
        <tbody>
<tr>
    <td>Ведущий специалист консультационно-методического кабинета по охране труда
      </td>
    <td><b> Мягких Ольга Валерьевна</b></td>
    <td>5146, 25-37-45</td>
    <td>motsot@omskmintrud.ru</td>

</tr>


<tr>
    <td>
        Главный специалист отдела охраны труда и
        государственной экспертизы условий труда
        департамента по труду Министерства труда
        и социального развития Омской области </td>
    <td> <b>Коваленко Наталья Яковлевна</b></td>
    <td>5179, 25-32-89</td>
    <td>nykovalenko@mintrud.omskportal.ru</td>
        </tr>
%{--<tr>--}%
    %{--<td>--}%
        %{--Начальник сектора сопровождения КУ "Соцзащита", программист  </td>--}%
    %{--<td><b>Луценко Александр Валерьевич</b></td>--}%
    %{--<td> 5076, 357000 доб.5076</td>--}%
    %{--<td> alucenko@mintrud.omskportal.ru</td>--}%
%{--</tr>--}%
        </tbody>
    </table>

</div>
</body>
</html>
