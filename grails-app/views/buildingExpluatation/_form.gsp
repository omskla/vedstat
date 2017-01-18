<%@ page import="vedstat.BuildingExpluatation" %>



<div class="fieldcontain ${hasErrors(bean: buildingExpluatationInstance, field: 'infDate', 'error')} required">
    <label for="infDate">
        <g:message code="buildingExpluatation.infDate.label" default="Inf Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="infDate" precision="day" value="${buildingExpluatationInstance?.infDate}"
                  years="${2012..2017}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: buildingExpluatationInstance, field: 'isKomissiaOsmotr', 'error')} ">
    <label for="isKomissiaOsmotr">
        <g:message code="buildingExpluatation.isKomissiaOsmotr.label" default="Is Komissia Osmotr"/>

    </label>
    <g:checkBox name="isKomissiaOsmotr" value="${buildingExpluatationInstance?.isKomissiaOsmotr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: buildingExpluatationInstance, field: 'isPrikazHeadOtv', 'error')} ">
    <label for="isPrikazHeadOtv">
        <g:message code="buildingExpluatation.isPrikazHeadOtv.label" default="Is Prikaz Head Otv"/>

    </label>
    <g:checkBox name="isPrikazHeadOtv" value="${buildingExpluatationInstance?.isPrikazHeadOtv}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: buildingExpluatationInstance, field: 'isAktOsmotrBuilding', 'error')} ">
    <label for="isAktOsmotrBuilding">
        <g:message code="buildingExpluatation.isAktOsmotrBuilding.label" default="Is Akt Osmotr Building"/>

    </label>
    <g:checkBox name="isAktOsmotrBuilding" value="${buildingExpluatationInstance?.isAktOsmotrBuilding}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: buildingExpluatationInstance, field: 'istehJur', 'error')} ">
    <label for="istehJur">
        <g:message code="buildingExpluatation.istehJur.label" default="Isteh Jur"/>

    </label>
    <g:checkBox name="istehJur" value="${buildingExpluatationInstance?.istehJur}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: buildingExpluatationInstance, field: 'isArenda', 'error')} ">
    <label for="isArenda">
        <g:message code="buildingExpluatation.isArenda.label" default="Isteh Jur"/>

    </label>
    <g:checkBox name="isArenda" value="${buildingExpluatationInstance?.isArenda}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: buildingExpluatationInstance, field: 'summ', 'error')} ">
    <label for="summ">
        <g:message code="FSS.summ.label" default="Summ"/>

    </label>
    <g:textField pattern="[0-9]+(\\,[0-9][0-9]?)?" name="summ"
                 value="${formatNumber(number: buildingExpluatationInstance.summ, format: '#0.00')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: buildingExpluatationInstance, field: 'summPerWorker', 'error')} ">
    <label for="summPerWorker">
        <g:message code="FSS.summPerWorker.label" default="Summ Per Worker"/>

    </label>
    <g:textField pattern="[0-9]+(\\,[0-9][0-9]?)?" name="summPerWorker"
                 value="${fieldValue(bean: buildingExpluatationInstance, field: 'summPerWorker')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: buildingExpluatationInstance, field: 'summToOt', 'error')} ">
    <label for="summToOt">
        <g:message code="FSS.summToOt.label" default="Summ To Ot"/>

    </label>
    <g:textField name="summToOt" pattern="[0-9]+(\\,[0-9][0-9]?)?"
                 value="${fieldValue(bean: buildingExpluatationInstance, field: 'summToOt')}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: buildingExpluatationInstance, field: 'org', 'error')} required">
    <label for="org">
        <g:message code="buildingExpluatation.org.label" default="Org"/>
        <span class="required-indicator">*</span>
    </label>
    %{--<g:select id="org" name="org.id" from="${vedstat.Org.list()}" optionKey="id" required="" value="${buildingExpluatationInstance?.org?.id}" class="many-to-one"/>--}%
    <g:textField name="orgStr" readonly="readonly" value="${buildingExpluatationInstance?.org}"></g:textField>
    <g:hiddenField id="org" name="org.id" value="${buildingExpluatationInstance?.org?.id}"></g:hiddenField>
</div>

