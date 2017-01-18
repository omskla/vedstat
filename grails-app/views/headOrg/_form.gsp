<%@ page import="vedstat.HeadOrg" %>



<div class="fieldcontain ${hasErrors(bean: headOrgInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="headOrg.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${headOrgInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: headOrgInstance, field: 'descryption', 'error')} ">
	<label for="descryption">
		<g:message code="headOrg.descryption.label" default="Descryption" />
		
	</label>
	<g:textField name="descryption" value="${headOrgInstance?.descryption}"/>
</div>

