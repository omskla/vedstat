<%@ page import="vedstat.GroupOkved" %>



<div class="fieldcontain ${hasErrors(bean: groupOkvedInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="groupOkved.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${groupOkvedInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupOkvedInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="groupOkved.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${groupOkvedInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupOkvedInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="groupOkved.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${groupOkvedInstance?.code}"/>
</div>

