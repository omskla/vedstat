<%@ page import="vedstat.Instruction" %>



<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'infDate', 'error')} required">
	<label for="infDate">
		<g:message code="instruction.infDate.label" default="Inf Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="infDate" precision="day"  value="${instructionInstance?.infDate}"    years="${2012..2017}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'itogoInstructions', 'error')} ">
	<label for="itogoInstructions">
		<g:message code="instruction.itogoInstructions.label" default="Itogo Instructions" />
		
	</label>
	<g:field name="itogoInstructions" type="number" min="0" value="${instructionInstance.itogoInstructions}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'procentInstructions', 'error')} ">
	<label for="procentInstructions">
		<g:message code="instruction.procentInstructions.label" default="Procent Instructions" />
		
	</label>
	<g:field name="procentInstructions" type="number" min="0" max="100" value="${instructionInstance.procentInstructions}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'regJournal', 'error')} ">
	<label for="regJournal">
		<g:message code="instruction.regJournal.label" default="Reg Journal" />
		
	</label>
	<g:checkBox name="regJournal" value="${instructionInstance?.regJournal}" />
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'issueJournal', 'error')} ">
	<label for="issueJournal">
		<g:message code="instruction.issueJournal.label" default="Issue Journal" />
		
	</label>
	<g:checkBox name="issueJournal" value="${instructionInstance?.issueJournal}" />
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'kolKabinetOt', 'error')} ">
	<label for="kolKabinetOt">
		<g:message code="instruction.kolKabinetOt.label" default="Kol Kabinet Ot" />
		
	</label>
	<g:field name="kolKabinetOt" type="number" min="0" value="${instructionInstance.kolKabinetOt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'kolUgolOt', 'error')} ">
	<label for="kolUgolOt">
		<g:message code="instruction.kolUgolOt.label" default="Kol Ugol Ot" />
		
	</label>
	<g:field name="kolUgolOt" type="number" min="0" value="${instructionInstance.kolUgolOt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'isKomitetOt', 'error')} ">
	<label for="isKomitetOt">
		<g:message code="instruction.isKomitetOt.label" default="Is Komitet Ot" />
		
	</label>
	<g:checkBox name="isKomitetOt" value="${instructionInstance?.isKomitetOt}" />
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'kolUpolnomochOt', 'error')} ">
	<label for="kolUpolnomochOt">
		<g:message code="instruction.kolUpolnomochOt.label" default="Kol Upolnomoch Ot" />
		
	</label>
	<g:field name="kolUpolnomochOt" type="number" min="0" value="${instructionInstance.kolUpolnomochOt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'yearKollectDog', 'error')} ">
	<label for="yearKollectDog">
		<g:message code="instruction.yearKollectDog.label" default="Year Kollect Dog" />
		
	</label>
	<g:field name="yearKollectDog" type="number" min="1990" max="2030" value="${instructionInstance.yearKollectDog}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'procentSiz', 'error')} ">
	<label for="procentSiz">
		<g:message code="instruction.procentSiz.label" default="Procent Siz" />
		
	</label>
	<g:field name="procentSiz" type="number" min="0" max="101" value="${instructionInstance.procentSiz}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'notNeedSiz', 'error')} ">
	<label for="notNeedSiz">
		<g:message code="instruction.notNeedSiz.label" default="Not Need Siz" />
		
	</label>
	<g:checkBox name="notNeedSiz" value="${instructionInstance?.notNeedSiz}" />
</div>

<div class="fieldcontain ${hasErrors(bean: instructionInstance, field: 'org', 'error')} required">
	<label for="org">
		<g:message code="instruction.org.label" default="Org" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="org" name="org.id" from="${vedstat.Org.list()}" optionKey="id" required="" value="${instructionInstance?.org?.id}" class="many-to-one"/>--}%

    <g:textField name="orgStr" readonly="true" value="${instructionInstance?.org}"  ></g:textField>
    <g:hiddenField id="org" name="org.id" value="${instructionInstance?.org?.id}" ></g:hiddenField>

</div>

