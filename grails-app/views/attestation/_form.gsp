<%@ page import="vedstat.Attestation" %>



<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'infDate', 'error')} required">
	<label for="infDate">
		<g:message code="attestation.infDate.label" default="Inf Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="infDate" precision="day"  value="${attestationInstance?.infDate}"   years="${2012..2017}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWorkingPlace', 'error')} ">
	<label for="kolWorkingPlace">
		<g:message code="attestation.kolWorkingPlace.label" default="Kol Working Place" />
		
	</label>
	<g:field name="kolWorkingPlace" type="number" value="${attestationInstance.kolWorkingPlace}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWorkingPlaceToAttest', 'error')} ">
	<label for="kolWorkingPlaceToAttest">
		<g:message code="attestation.kolWorkingPlaceToAttest.label" default="Kol Working Place To Attest" />
		
	</label>
	<g:field name="kolWorkingPlaceToAttest" type="number" value="${attestationInstance.kolWorkingPlaceToAttest}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'attestationOrg', 'error')} ">
	<label for="attestationOrg">
		<g:message code="attestation.attestationOrg.label" default="Attestation Org" />
		
	</label>
	<g:select id="attestationOrg" name="attestationOrg.id" from="${vedstat.AttestationOrg.listOrderByCode()}" optionKey="id" value="${attestationInstance?.attestationOrg?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'dateSert', 'error')} ">
	<label for="dateSert">
		<g:message code="attestation.dateSert.label" default="Date Sert" />
		
	</label>
	<g:field name="dateSert" type="number" value="${attestationInstance.dateSert}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolAttestationPlace', 'error')} ">
	<label for="kolAttestationPlace">
		<g:message code="attestation.kolAttestationPlace.label" default="Kol Attestation Place" />
		
	</label>
	<g:field name="kolAttestationPlace" type="number" value="${attestationInstance.kolAttestationPlace}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWorkerAttestationPlace', 'error')} ">
	<label for="kolWorkerAttestationPlace">
		<g:message code="attestation.kolWorkerAttestationPlace.label" default="Kol Worker Attestation Place" />
		
	</label>
	<g:field name="kolWorkerAttestationPlace" type="number" value="${attestationInstance.kolWorkerAttestationPlace}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWomenAttestation', 'error')} ">
	<label for="kolWomenAttestation">
		<g:message code="attestation.kolWomenAttestation.label" default="Kol Women Attestation" />
		
	</label>
	<g:field name="kolWomenAttestation" type="number" value="${attestationInstance.kolWomenAttestation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolRabMest1_2', 'error')} ">
	<label for="kolRabMest1_2">
		<g:message code="attestation.kolRabMest1_2.label" default="Kol Rab Mest12" />
		
	</label>
	<g:field name="kolRabMest1_2" type="number" value="${attestationInstance.kolRabMest1_2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWorker1_2', 'error')} ">
	<label for="kolWorker1_2">
		<g:message code="attestation.kolWorker1_2.label" default="Kol Worker12" />
		
	</label>
	<g:field name="kolWorker1_2" type="number" value="${attestationInstance.kolWorker1_2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWomen1_2', 'error')} ">
	<label for="kolWomen1_2">
		<g:message code="attestation.kolWomen1_2.label" default="Kol Women12" />
		
	</label>
	<g:field name="kolWomen1_2" type="number" value="${attestationInstance.kolWomen1_2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolRabMest3', 'error')} ">
	<label for="kolRabMest3">
		<g:message code="attestation.kolRabMest3.label" default="Kol Rab Mest3" />
		
	</label>
	<g:field name="kolRabMest3" type="number" value="${attestationInstance.kolRabMest3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWorker3', 'error')} ">
	<label for="kolWorker3">
		<g:message code="attestation.kolWorker3.label" default="Kol Worker3" />
		
	</label>
	<g:field name="kolWorker3" type="number" value="${attestationInstance.kolWorker3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWomen3', 'error')} ">
	<label for="kolWomen3">
		<g:message code="attestation.kolWomen3.label" default="Kol Women3" />
		
	</label>
	<g:field name="kolWomen3" type="number" value="${attestationInstance.kolWomen3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolRabMest4', 'error')} ">
	<label for="kolRabMest4">
		<g:message code="attestation.kolRabMest4.label" default="Kol Rab Mest4" />
		
	</label>
	<g:field name="kolRabMest4" type="number" value="${attestationInstance.kolRabMest4}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWorker4', 'error')} ">
	<label for="kolWorker4">
		<g:message code="attestation.kolWorker4.label" default="Kol Worker4" />
		
	</label>
	<g:field name="kolWorker4" type="number" value="${attestationInstance.kolWorker4}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWomen4', 'error')} ">
	<label for="kolWomen4">
		<g:message code="attestation.kolWomen4.label" default="Kol Women4" />
		
	</label>
	<g:field name="kolWomen4" type="number" value="${attestationInstance.kolWomen4}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolRabMestTravm3', 'error')} ">
	<label for="kolRabMestTravm3">
		<g:message code="attestation.kolRabMestTravm3.label" default="Kol Rab Mest Travm3" />
		
	</label>
	<g:field name="kolRabMestTravm3" type="number" value="${attestationInstance.kolRabMestTravm3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWorkerTravm3', 'error')} ">
	<label for="kolWorkerTravm3">
		<g:message code="attestation.kolWorkerTravm3.label" default="Kol Worker Travm3" />
		
	</label>
	<g:field name="kolWorkerTravm3" type="number" value="${attestationInstance.kolWorkerTravm3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWomenTravm3', 'error')} ">
	<label for="kolWomenTravm3">
		<g:message code="attestation.kolWomenTravm3.label" default="Kol Women Travm3" />
		
	</label>
	<g:field name="kolWomenTravm3" type="number" value="${attestationInstance.kolWomenTravm3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolRabMestSizFail', 'error')} ">
	<label for="kolRabMestSizFail">
		<g:message code="attestation.kolRabMestSizFail.label" default="Kol Rab Mest Siz Fail" />
		
	</label>
	<g:field name="kolRabMestSizFail" type="number" value="${attestationInstance.kolRabMestSizFail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWorkerSizFail', 'error')} ">
	<label for="kolWorkerSizFail">
		<g:message code="attestation.kolWorkerSizFail.label" default="Kol Worker Siz Fail" />
		
	</label>
	<g:field name="kolWorkerSizFail" type="number" value="${attestationInstance.kolWorkerSizFail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'kolWomenSizFail', 'error')} ">
	<label for="kolWomenSizFail">
		<g:message code="attestation.kolWomenSizFail.label" default="Kol Women Siz Fail" />
		
	</label>
	<g:field name="kolWomenSizFail" type="number" value="${attestationInstance.kolWomenSizFail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'isMeropriatie', 'error')} ">
    <label for="isMeropriatie">
        <g:message code="attestation.isMeropriatie.label" default="Is Meropriatie" />

    </label>
    <g:checkBox name="isMeropriatie" value="${attestationInstance?.isMeropriatie}" />
</div>
<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'isGosExpertiza', 'error')} ">
	<label for="isGosExpertiza">
		<g:message code="attestation.isGosExpertiza.label" default="Is Gos Expertiza" />
		
	</label>
	<g:checkBox name="isGosExpertiza" value="${attestationInstance?.isGosExpertiza}" />
</div>



<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'isCertDoverie', 'error')} ">
	<label for="isCertDoverie">
		<g:message code="attestation.isCertDoverie.label" default="Is Cert Doverie" />
		
	</label>
	<g:checkBox name="isCertDoverie" value="${attestationInstance?.isCertDoverie}" />
</div>

<div class="fieldcontain ${hasErrors(bean: attestationInstance, field: 'org', 'error')} required">
	<label for="org">
		<g:message code="attestation.org.label" default="Org" />
		<span class="required-indicator">*</span>
	</label>
    <g:textField name="orgStr" readonly="true" value="${attestationInstance?.org}"  ></g:textField>
    <g:hiddenField id="org" name="org.id" value="${attestationInstance?.org?.id}" ></g:hiddenField>

	%{--<g:select id="org" name="org.id" from="${vedstat.Org.list()}" optionKey="id" required="" value="${attestationInstance?.org?.id}" disabled="true" />--}%
</div>

