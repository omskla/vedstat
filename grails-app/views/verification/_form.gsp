<%@ page import="vedstat.Verification" %>

<div class="fieldcontain ${hasErrors(bean: verificationInstance, field: 'org', 'error')} required">
    <label for="org">
        <g:message code="verification.org.label" default="Org"/>
        <span class="required-indicator">*</span>
    </label>
    %{--<g:select id="org" name="org.id" from="${vedstat.Org.list()}" optionKey="id" required=""--}%
    %{--value="${verificationInstance?.org?.id}" class="many-to-one"/>--}%
    <g:textField name="orgStr" style="width: 500px;" readonly="true" value="${verificationInstance?.org}"  ></g:textField>
    <g:hiddenField id="org" name="org.id" value="${verificationInstance?.org?.id}" ></g:hiddenField>

</div>


<div class="fieldcontain ${hasErrors(bean: verificationInstance, field: 'verificationDate', 'error')} required">
    <label for="verificationDate">
        <g:message code="verification.verificationDate.label" default="Verification Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="verificationDate" precision="day" value="${verificationInstance?.verificationDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: verificationInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="verification.description.label" default="Description"/>

    </label>
    <g:textArea rows="5" style="width: 500px;" name="description" value="${verificationInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: verificationInstance, field: 'isRepair', 'error')} ">
    <label for="isRepair">
        <g:message code="verification.isRepair.label" default="Is Repair"/>

    </label>
    <g:checkBox name="isRepair" value="${verificationInstance?.isRepair}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: verificationInstance, field: 'verificationStatus', 'error')} required">
    <label for="verificationStatus">
        <g:message code="verification.verificationStatus.label" default="Verification Status"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="verificationStatus" style="width: 500px;" name="verificationStatus.id" from="${vedstat.VerificationStatus.list()}"
              optionKey="id" required="" value="${verificationInstance?.verificationStatus?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>




