<%@ page import="vedstat.Education" %>



<div class="fieldcontain ${hasErrors(bean: educationInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="education.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${educationInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: educationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="education.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${educationInstance?.description}"/>
</div>

