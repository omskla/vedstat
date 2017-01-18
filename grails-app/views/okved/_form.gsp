<%@ page import="vedstat.Okved" %>



<div class="fieldcontain ${hasErrors(bean: okvedInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="okved.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${okvedInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: okvedInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="okved.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${okvedInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: okvedInstance, field: 'descryption', 'error')} ">
	<label for="descryption">
		<g:message code="okved.descryption.label" default="Descryption" />
		
	</label>
	<g:textField name="descryption" value="${okvedInstance?.descryption}"/>
</div>

