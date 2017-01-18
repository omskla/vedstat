<%@ page import="vedstat.OrgType" %>



<div class="fieldcontain ${hasErrors(bean: orgTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="orgType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${orgTypeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgTypeInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="orgType.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${orgTypeInstance?.code}"/>
</div>

