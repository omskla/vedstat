<%@ page import="vedstat.Unlucky" %>



<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'infDate', 'error')} required">
	<label for="infDate">
		<g:message code="unlucky.infDate.label" default="Inf Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="infDate" precision="day"  value="${unluckyInstance?.infDate}"  years="${2012..2017}" />
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'kolWorkerProfZab', 'error')} ">
	<label for="kolWorkerProfZab">
		<g:message code="unlucky.kolWorkerProfZab.label" default="Kol Worker Prof Zab" />
		
	</label>
	<g:field name="kolWorkerProfZab" type="number" value="${unluckyInstance.kolWorkerProfZab}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'kolWomenProfZab', 'error')} ">
	<label for="kolWomenProfZab">
		<g:message code="unlucky.kolWomenProfZab.label" default="Kol Women Prof Zab" />
		
	</label>
	<g:field name="kolWomenProfZab" type="number" value="${unluckyInstance.kolWomenProfZab}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'kolUnluck', 'error')} ">
	<label for="kolUnluck">
		<g:message code="unlucky.kolUnluck.label" default="Kol Unluck" />
		
	</label>
	<g:field name="kolUnluck" type="number" value="${unluckyInstance.kolUnluck}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'kolGroupUnluck', 'error')} ">
	<label for="kolGroupUnluck">
		<g:message code="unlucky.kolGroupUnluck.label" default="Kol Group Unluck" />
		
	</label>
	<g:field name="kolGroupUnluck" type="number" value="${unluckyInstance.kolGroupUnluck}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'kolDeathUnluck', 'error')} ">
	<label for="kolDeathUnluck">
		<g:message code="unlucky.kolDeathUnluck.label" default="Kol Death Unluck" />
		
	</label>
	<g:field name="kolDeathUnluck" type="number" value="${unluckyInstance.kolDeathUnluck}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'kolHardUnluck', 'error')} ">
	<label for="kolHardUnluck">
		<g:message code="unlucky.kolHardUnluck.label" default="Kol Hard Unluck" />
		
	</label>
	<g:field name="kolHardUnluck" type="number" value="${unluckyInstance.kolHardUnluck}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'itogo', 'error')} ">
	<label for="itogo">
		<g:message code="unlucky.itogo.label" default="Itogo" />
		
	</label>
	<g:field name="itogo" type="number" value="${unluckyInstance.itogo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'itogoWomen', 'error')} ">
	<label for="itogoWomen">
		<g:message code="unlucky.itogoWomen.label" default="Itogo Women" />
		
	</label>
	<g:field name="itogoWomen" type="number" value="${unluckyInstance.itogoWomen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'itogoDeath', 'error')} ">
	<label for="itogoDeath">
		<g:message code="unlucky.itogoDeath.label" default="Itogo Death" />
		
	</label>
	<g:field name="itogoDeath" type="number" value="${unluckyInstance.itogoDeath}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'itogoDeathWomen', 'error')} ">
	<label for="itogoDeathWomen">
		<g:message code="unlucky.itogoDeathWomen.label" default="Itogo Death Women" />
		
	</label>
	<g:field name="itogoDeathWomen" type="number" value="${unluckyInstance.itogoDeathWomen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'itogoHard', 'error')} ">
	<label for="itogoHard">
		<g:message code="unlucky.itogoHard.label" default="Itogo Hard" />
		
	</label>
	<g:field name="itogoHard" type="number" value="${unluckyInstance.itogoHard}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'itogoHardWomen', 'error')} ">
	<label for="itogoHardWomen">
		<g:message code="unlucky.itogoHardWomen.label" default="Itogo Hard Women" />
		
	</label>
	<g:field name="itogoHardWomen" type="number" value="${unluckyInstance.itogoHardWomen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'kolDaysNot', 'error')} ">
	<label for="kolDaysNot">
		<g:message code="unlucky.kolDaysNot.label" default="Kol Days Not" />
		
	</label>
	<g:field name="kolDaysNot" type="number" value="${unluckyInstance.kolDaysNot}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unluckyInstance, field: 'org', 'error')} required">
	<label for="org">
		<g:message code="unlucky.org.label" default="Org" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="org" name="org.id" from="${vedstat.Org.list()}" optionKey="id" required="" value="${unluckyInstance?.org?.id}" class="many-to-one"/>--}%
    <g:textField name="orgStr" readonly="true" value="${unluckyInstance?.org}"  ></g:textField>
    <g:hiddenField id="org" name="org.id" value="${unluckyInstance?.org?.id}" ></g:hiddenField>

</div>

