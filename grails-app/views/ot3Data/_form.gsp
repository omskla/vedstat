<%@ page import="vedstat.Ot3Data" %>



<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'quarter', 'error')} ">
	<label for="quarter">
		<g:message code="ot3Data.quarter.label" default="Quarter" />
		
	</label>
	<g:select name="quarter" from="${ot3DataInstance.constraints.quarter.inList}" value="${ot3DataInstance?.quarter}" valueMessagePrefix="ot3Data.quarter" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'yyyy', 'error')} ">
	<label for="yyyy">
		<g:message code="ot3Data.yyyy.label" default="Yyyy" />
		
	</label>
	<g:select name="yyyy" from="${ot3DataInstance.constraints.yyyy.inList}" value="${ot3DataInstance?.yyyy}" valueMessagePrefix="ot3Data.yyyy" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'itogo', 'error')} ">
	<label for="itogo">
		<g:message code="ot3Data.itogo.label" default="Itogo" />
		
	</label>
	<g:field name="itogo" type="number" value="${ot3DataInstance.itogo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'more50', 'error')} ">
	<label for="more50">
		<g:message code="ot3Data.more50.label" default="More50" />
		
	</label>
	<g:field name="more50" type="number" value="${ot3DataInstance.more50}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'more50Ot', 'error')} ">
	<label for="more50Ot">
		<g:message code="ot3Data.more50Ot.label" default="More50 Ot" />
		
	</label>
	<g:field name="more50Ot" type="number" value="${ot3DataInstance.more50Ot}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'itogoWorkers', 'error')} ">
	<label for="itogoWorkers">
		<g:message code="ot3Data.itogoWorkers.label" default="Itogo Workers" />
		
	</label>
	<g:field name="itogoWorkers" type="number" value="${ot3DataInstance.itogoWorkers}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'kolRabAttest', 'error')} ">
	<label for="kolRabAttest">
		<g:message code="ot3Data.kolRabAttest.label" default="Kol Rab Attest" />
		
	</label>
	<g:field name="kolRabAttest" type="number" value="${ot3DataInstance.kolRabAttest}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'kolRabMestOt', 'error')} ">
	<label for="kolRabMestOt">
		<g:message code="ot3Data.kolRabMestOt.label" default="Kol Rab Mest Ot" />
		
	</label>
	<g:field name="kolRabMestOt" type="number" value="${ot3DataInstance.kolRabMestOt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'kolRabOtHelp', 'error')} ">
	<label for="kolRabOtHelp">
		<g:message code="ot3Data.kolRabOtHelp.label" default="Kol Rab Ot Help" />
		
	</label>
	<g:field name="kolRabOtHelp" type="number" value="${ot3DataInstance.kolRabOtHelp}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'kolRabOtSMI', 'error')} ">
	<label for="kolRabOtSMI">
		<g:message code="ot3Data.kolRabOtSMI.label" default="Kol Rab Ot SMI" />
		
	</label>
	<g:field name="kolRabOtSMI" type="number" value="${ot3DataInstance.kolRabOtSMI}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'kolobrash', 'error')} ">
	<label for="kolobrash">
		<g:message code="ot3Data.kolobrash.label" default="Kolobrash" />
		
	</label>
	<g:field name="kolobrash" type="number" value="${ot3DataInstance.kolobrash}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'kolMeropr', 'error')} ">
	<label for="kolMeropr">
		<g:message code="ot3Data.kolMeropr.label" default="Kol Meropr" />
		
	</label>
	<g:field name="kolMeropr" type="number" value="${ot3DataInstance.kolMeropr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'kolzased', 'error')} ">
	<label for="kolzased">
		<g:message code="ot3Data.kolzased.label" default="Kolzased" />
		
	</label>
	<g:field name="kolzased" type="number" value="${ot3DataInstance.kolzased}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ot3DataInstance, field: 'area', 'error')} required">
	<label for="area">
		<g:message code="ot3Data.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="area" name="area.id" from="${vedstat.MunicArea.list()}"  optionKey="id"  value="${ot3DataInstance?.area?.id}" disabled=" " class="many-to-one"/>
</div>

