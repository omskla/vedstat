<%@ page import="vedstat.Org" %>



<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="org.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${orgInstance?.description}" style="width: 600px"/>
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




<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'orgInf', 'error')} ">
	<label for="orgInf">
		<g:message code="org.orgInf.label" default="Org Inf" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${orgInstance?.orgInf?}" var="o">
    <li><g:link controller="orgInformation" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="orgInformation" action="create" params="['org.id': orgInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'orgInformation.label', default: 'OrgInformation')])}</g:link>
</li>
</ul>

</div>


<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'labourServiceInfo', 'error')} ">
	<label for="labourServiceInfo">
		<g:message code="org.labourServiceInfo.label" default="Labour Service Info" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${orgInstance?.labourServiceInfo?}" var="l">
    <li><g:link controller="labourServiceInfo" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="labourServiceInfo" action="create" params="['org.id': orgInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'trainingLabourInfo', 'error')} ">
	<label for="trainingLabourInfo">
		<g:message code="org.trainingLabourInfo.label" default="Training Labour Info" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${orgInstance?.trainingLabourInfo?}" var="t">
    <li><g:link controller="trainingLabourInfo" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="trainingLabourInfo" action="create" params="['org.id': orgInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'instructions', 'error')} ">
    <label for="instructions">
        <g:message code="org.instructions.label" default="Instructions" />

    </label>

    <ul class="one-to-many">
        <g:each in="${orgInstance?.instructions?}" var="i">
            <li><g:link controller="instruction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="instruction" action="create" params="['org.id': orgInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'instruction.label', default: 'Instruction')])}</g:link>
        </li>
    </ul>

</div>



<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'attestation', 'error')} ">
	<label for="attestation">
		<g:message code="org.attestation.label" default="Attestation" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${orgInstance?.attestation?}" var="a">
    <li><g:link controller="attestation" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="attestation" action="create" params="['org.id': orgInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'attestation.label', default: 'Attestation')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'buildinhExpluatation', 'error')} ">
	<label for="buildinhExpluatation">
		<g:message code="org.buildinhExpluatation.label" default="Buildinh Expluatation" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${orgInstance?.buildinhExpluatation?}" var="b">
    <li><g:link controller="buildingExpluatation" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="buildingExpluatation" action="create" params="['org.id': orgInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation')])}</g:link>
</li>
</ul>

</div>


<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'unluck', 'error')} ">
    <label for="unluck">
        <g:message code="org.unluck.label" default="Unluck" />

    </label>

    <ul class="one-to-many">
        <g:each in="${orgInstance?.unluck?}" var="u">
            <li><g:link controller="unlucky" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="unlucky" action="create" params="['org.id': orgInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'unlucky.label', default: 'Unlucky')])}</g:link>
        </li>
    </ul>

</div>



<div class="fieldcontain ${hasErrors(bean: orgInstance, field: 'headOrg', 'error')} ">
	<label for="headOrg">
		<g:message code="org.headOrg.label" default="Head Org" />
		
	</label>
	<g:select id="headOrg" name="headOrg.id" from="${vedstat.HeadOrg.list()}" optionKey="id" value="${orgInstance?.headOrg?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>





