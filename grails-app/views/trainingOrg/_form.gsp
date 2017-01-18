<%@ page import="vedstat.TrainingOrg" %>



<div class="fieldcontain ${hasErrors(bean: trainingOrgInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="trainingOrg.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${trainingOrgInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trainingOrgInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="trainingOrg.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${trainingOrgInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trainingOrgInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="trainingOrg.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${trainingOrgInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trainingOrgInstance, field: 'tel', 'error')} ">
	<label for="tel">
		<g:message code="trainingOrg.tel.label" default="Tel" />
		
	</label>
	<g:textField name="tel" value="${trainingOrgInstance?.tel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trainingOrgInstance, field: 'adr', 'error')} ">
	<label for="adr">
		<g:message code="trainingOrg.adr.label" default="Adr" />
		
	</label>
	<g:textField name="adr" value="${trainingOrgInstance?.adr}"/>
</div>

