<%@ page import="vedstat.VerificationStatus" %>



<div class="fieldcontain ${hasErrors(bean: verificationStatusInstance, field: 'code', 'error')} ">
    <label for="code">
        <g:message code="verificationStatus.code.label" default="Code"/>

    </label>
    <g:textField name="code" value="${verificationStatusInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: verificationStatusInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="verificationStatus.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${verificationStatusInstance?.description}"/>
</div>

