<%@ page import="vedstat.QueryDb" %>



<div class="fieldcontain ${hasErrors(bean: queryDbInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="queryDb.name.label" default="Name" />
		
	</label>
	<g:textField style="width: 600px;" name="name" value="${queryDbInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: queryDbInstance, field: 'queryStr', 'error')} ">
	<label for="queryStr">
		<g:message code="queryDb.queryStr.label" default="Query Str" />
		
	</label>
	<g:textArea style="width: 600px; height: 500px;"  name="queryStr" cols="140" rows="15" maxlength="100000" value="${queryDbInstance?.queryStr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: queryDbInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="queryDb.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${queryDbInstance?.code}"/>
</div>

