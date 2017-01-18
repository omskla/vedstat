<%@ page import="vedstat.LabourServiceInfo" %>



<div class="fieldcontain ${hasErrors(bean: labourServiceInfoInstance, field: 'infDate', 'error')} required">
	<label for="infDate">
		<g:message code="labourServiceInfo.infDate.label" default="Inf Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="infDate" precision="day"  value="${labourServiceInfoInstance?.infDate}"  years="${2012..2017}" />
</div>

<div class="fieldcontain ${hasErrors(bean: labourServiceInfoInstance, field: 'kolLabourWorker', 'error')} ">
	<label for="kolLabourWorker">
		<g:message code="labourServiceInfo.kolLabourWorker.label" default="Kol Labour Worker" />
		
	</label>
	<g:field name="kolLabourWorker" type="number" value="${labourServiceInfoInstance.kolLabourWorker}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourServiceInfoInstance, field: 'typeOtWorker', 'error')} ">
	<label for="typeOtWorker">
		<g:message code="labourServiceInfo.typeOtWorker.label" default="Type Ot Worker" />
		
	</label>
	<g:select id="typeOtWorker" name="typeOtWorker.id" from="${vedstat.TypeOtWorker.list()}" optionKey="id" value="${labourServiceInfoInstance?.typeOtWorker?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourServiceInfoInstance, field: 'fioWorker', 'error')} ">
	<label for="fioWorker">
		<g:message code="labourServiceInfo.fioWorker.label" default="Fio Worker" />
		
	</label>
	<g:textField name="fioWorker" value="${labourServiceInfoInstance?.fioWorker}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourServiceInfoInstance, field: 'tel', 'error')} ">
	<label for="tel">
		<g:message code="labourServiceInfo.tel.label" default="Tel" />
		
	</label>
	<g:textField name="tel" value="${labourServiceInfoInstance?.tel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourServiceInfoInstance, field: 'workExperience', 'error')} ">
	<label for="workExperience">
		<g:message code="labourServiceInfo.workExperience.label" default="Work Experience" />
		
	</label>
	<g:field name="workExperience"  value="${labourServiceInfoInstance.workExperience}" type=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourServiceInfoInstance, field: 'education', 'error')} ">
	<label for="education">
		<g:message code="labourServiceInfo.education.label" default="Education" />
		
	</label>
	<g:select id="education" name="education.id" from="${vedstat.Education.list()}" optionKey="id" value="${labourServiceInfoInstance?.education?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>


<div class="fieldcontain ${hasErrors(bean: labourServiceInfoInstance, field: 'isPrikazOt', 'error')} ">
	<label for="isPrikazOt">
		<g:message code="labourServiceInfo.isPrikazOt.label" default="Is Prikaz Ot" />
		
	</label>
	<g:checkBox name="isPrikazOt" value="${labourServiceInfoInstance?.isPrikazOt}" />
</div>

<div class="fieldcontain ${hasErrors(bean: labourServiceInfoInstance, field: 'org', 'error')} required">
	<label for="org">
		<g:message code="labourServiceInfo.org.label" default="Org" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="org" name="org.id" from="${vedstat.Org.list()}" optionKey="id" required="" value="${labourServiceInfoInstance?.org?.id}" class="many-to-one"/>--}%
    <g:textField name="orgStr" readonly="true" value="${labourServiceInfoInstance?.org}"  ></g:textField>
    <g:hiddenField id="org" name="org.id" value="${labourServiceInfoInstance?.org?.id}" ></g:hiddenField>

</div>

