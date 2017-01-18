<%@ page import="vedstat.HeadOrg; vedstat.Status; vedstat.Org" %>



<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="org.description.label" default="Description" />

    </label>
    <g:textField  name="description" value="${orgInstance?.description}" style="width: 600px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'orgType', 'error')} ">
    <label for="orgType">
        <g:message code="org.orgType.label" default="Org Type" />

    </label>
    <g:select id="orgType" name="orgType.id" from="${vedstat.OrgType.list()}" optionKey="id" value="${orgInstance?.orgType?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'area', 'error')} ">
    <label for="area">
        <g:message code="org.area.label" default="Area" />

    </label>
    <g:select id="area" name="area.id" from="${vedstat.MunicArea.list()}" optionKey="id" value="${orgInstance?.area?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>


<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'inn', 'error')} ">
    <label for="inn">
        <g:message code="orgInformation.inn.label" default="Inn" />

    </label>
    <g:textField name="inn" value="${orgInstance?.inn}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'okved', 'error')} ">
    <label for="okved">
        <g:message code="orgInformation.okved.label" default="Okved" />

    </label>
    <g:textField name="okved" value="${orgInstance?.okved}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'headOrg', 'error')} ">
    <label for="headOrg">
        <g:message code="org.headOrg.label" default="Head Org" />

    </label>
    <g:select id="headOrg" name="headOrg.id" from="${HeadOrg.list()}" optionKey="id" value="${orgInstance?.headOrg?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>



<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'status', 'error')} ">
    <label for="status">
        <g:message code="org.status.label" default="Статус" />

    </label>
    %{--<g:textField name="status" value="${orgInstance?.status}"/>--}%
    <g:select id="status" name="status.id" from="${Status.list()}" optionKey="id" value="${orgInstance?.status?.id}" class="many-to-one" noSelection="['null': 'выберите значение...']"/>


</div>





