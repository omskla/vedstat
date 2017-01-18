<%@ page import="vedstat.TypeOtWorker" %>



<div class="fieldcontain ${hasErrors(bean: typeOtWorkerInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="typeOtWorker.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${typeOtWorkerInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: typeOtWorkerInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="typeOtWorker.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${typeOtWorkerInstance?.code}"/>
</div>

