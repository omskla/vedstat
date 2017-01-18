<%@ page import="vedstat.AttestationOrg" %>



<div class="fieldcontain ${hasErrors(bean: attestationOrgInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="attestationOrg.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${attestationOrgInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationOrgInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="attestationOrg.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${attestationOrgInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationOrgInstance, field: 'descryption', 'error')} ">
	<label for="descryption">
		<g:message code="attestationOrg.descryption.label" default="Descryption" />
		
	</label>
	<g:textField name="descryption" value="${attestationOrgInstance?.descryption}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationOrgInstance, field: 'tel', 'error')} ">
	<label for="tel">
		<g:message code="attestationOrg.tel.label" default="Tel" />
		
	</label>
	<g:textField name="tel" value="${attestationOrgInstance?.tel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationOrgInstance, field: 'adr', 'error')} ">
	<label for="adr">
		<g:message code="attestationOrg.adr.label" default="Adr" />
		
	</label>
	<g:textField name="adr" value="${attestationOrgInstance?.adr}"/>
</div>

