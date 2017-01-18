<%@ page import="vedstat.TrainingLabourInfo" %>



<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'infDate', 'error')} required">
	<label for="infDate">
		<g:message code="trainingLabourInfo.infDate.label" default="Inf Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="infDate" precision="day"  value="${trainingLabourInfoInstance?.infDate}"  years="${2012..2017}" />
</div>

<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'kolTrainWorker', 'error')} ">
	<label for="kolTrainWorker">
		<g:message code="trainingLabourInfo.kolTrainWorker.label" default="Kol Train Worker" />
		
	</label>
	<g:field name="kolTrainWorker" type="number" value="${trainingLabourInfoInstance.kolTrainWorker}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'yearTrainHear', 'error')} ">
	<label for="yearTrainHear">
		<g:message code="trainingLabourInfo.yearTrainHear.label" default="Year Train Hear" />
		
	</label>
	<g:field name="yearTrainHear" type="number" value="${trainingLabourInfoInstance.yearTrainHear}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'orgTrainHead', 'error')} ">
	<label for="orgTrainHead">
		<g:message code="trainingLabourInfo.orgTrainHead.label" default="Org Train Head" />
		
	</label>
	<g:select id="orgTrainHead" name="orgTrainHead.id" from="${vedstat.TrainingOrg.listOrderByCode()}" optionKey="id" value="${trainingLabourInfoInstance?.orgTrainHead?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<tooltip:tip value="обучено специалистов по ОТ д.б. равно или меньше количества специалистов по охране труда из блока Сведения о службе охраны труда">

<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'kolTrainSpec', 'error')} ">
	<label for="kolTrainSpec">
		<g:message code="trainingLabourInfo.kolTrainSpec.label" default="Kol Train Spec" />
		
	</label>
	<g:field name="kolTrainSpec" type="number" value="${trainingLabourInfoInstance.kolTrainSpec}"/>
</div>
</tooltip:tip>
<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'yearTrainSpec', 'error')} ">
	<label for="yearTrainSpec">
		<g:message code="trainingLabourInfo.yearTrainSpec.label" default="Year Train Spec" />
		
	</label>
	<g:field name="yearTrainSpec" type="number" value="${trainingLabourInfoInstance.yearTrainSpec}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'orgTrainSpec', 'error')} ">
	<label for="orgTrainSpec">
		<g:message code="trainingLabourInfo.orgTrainSpec.label" default="Org Train Spec" />
		
	</label>
	<g:select id="orgTrainSpec" name="orgTrainSpec.id" from="${vedstat.TrainingOrg.listOrderByCode()}" optionKey="id" value="${trainingLabourInfoInstance?.orgTrainSpec?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>



<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'isPrikazOt', 'error')} ">
    <label for="isPrikazOt">
        <g:message code="trainingLabourInfo.isPrikazOt.label" default="Is Prikaz Ot" />

    </label>
    <g:checkBox name="isPrikazOt" value="${trainingLabourInfoInstance?.isPrikazOt}" />
</div>

<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'itogoObuchSpec', 'error')} ">
	<label for="itogoObuchSpec">
		<g:message code="trainingLabourInfo.itogoObuchSpec.label" default="Itogo Obuch Spec" />
		
	</label>
	<g:field name="itogoObuchSpec" type="number" value="${trainingLabourInfoInstance.itogoObuchSpec}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'itogoObuchSpecHead', 'error')} ">
	<label for="itogoObuchSpecHead">
		<g:message code="trainingLabourInfo.itogoObuchSpecHead.label" default="Itogo Obuch Spec Head" />
		
	</label>
	<g:field name="itogoObuchSpecHead" type="number" value="${trainingLabourInfoInstance.itogoObuchSpecHead}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'itogoObuchWorker', 'error')} ">
	<label for="itogoObuchWorker">
		<g:message code="trainingLabourInfo.itogoObuchWorker.label" default="Itogo Obuch Worker" />
		
	</label>
	<g:field name="itogoObuchWorker" type="number" value="${trainingLabourInfoInstance.itogoObuchWorker}"/>
</div>



<div class="fieldcontain ${hasErrors(bean: trainingLabourInfoInstance, field: 'org', 'error')} required">
	<label for="org">
		<g:message code="trainingLabourInfo.org.label" default="Org" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="org" name="org.id" from="${vedstat.Org.list()}" optionKey="id" required="" value="${trainingLabourInfoInstance?.org?.id}" class="many-to-one"/>--}%
    <g:textField name="orgStr" readonly="true" value="${trainingLabourInfoInstance?.org}"  ></g:textField>
    <g:hiddenField id="org" name="org.id" value="${trainingLabourInfoInstance?.org?.id}" ></g:hiddenField>
</div>

