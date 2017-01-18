<%@ page import="vedstat.OrgInformation" %>



<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'infDate', 'error')} required">
	<label for="infDate">
		<g:message code="orgInformation.infDate.label" default="Inf Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="infDate" precision="day"  value="${orgInformationInstance?.infDate}"  years="${2012..2017}" />
</div>



<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'headOrg', 'error')} ">
	<label for="headOrg">
		<g:message code="orgInformation.headOrg.label" default="Head Org" />
		
	</label>
	<g:textField name="headOrg" value="${orgInformationInstance?.headOrg}" style="width: 500px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'tel', 'error')} ">
	<label for="tel">
		<g:message code="orgInformation.tel.label" default="Tel" />
		
	</label>
	<g:textField name="tel" value="${orgInformationInstance?.tel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'fax', 'error')} ">
	<label for="fax">
		<g:message code="orgInformation.fax.label" default="Fax" />
		
	</label>
	<g:textField name="fax" value="${orgInformationInstance?.fax}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'adress', 'error')}  ">
	<label for="adress">
		<g:message code="orgInformation.adress.label" default="Adress" />
		
	</label>
	<g:textField name="adress" value="${orgInformationInstance?.adress}" style="width: 500px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'adressfact', 'error')}  ">
    <label for="adressfact">
        <g:message code="orgInformation.adressfact.label" default="Adress" />

    </label>
    <g:textField name="adressfact" value="${orgInformationInstance?.adressfact}" style="width: 500px"/>
</div>



<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="orgInformation.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${orgInformationInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'staff', 'error')} ">
    <label for="staff">
        <g:message code="workInfo.staff.label" default="Staff" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="staff" type="number" value="${orgInformationInstance.staff}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'women', 'error')} ">
    <label for="women">
        <g:message code="workInfo.women.label" default="Women" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="women" type="number" value="${orgInformationInstance.women}" required=""/>
</div>




%{--<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'groupOkved', 'error')} ">--}%
	%{--<label for="groupOkved">--}%
		%{--<g:message code="orgInformation.groupOkved.label" default="Group Okved" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select id="groupOkved" name="groupOkved.id" from="${vedstat.GroupOkved.list()}" optionKey="id" value="${orgInformationInstance?.groupOkved?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: orgInformationInstance, field: 'org', 'error')} required">
	<label for="org">
		<g:message code="orgInformation.org.label" default="Org" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="org" name="org.id" from="${vedstat.Org.list()}" optionKey="id" required="" value="${orgInformationInstance?.org?.id}" class="many-to-one"/>--}%
    <g:textField name="orgStr" readonly="readonly" value="${orgInformationInstance?.org}"  ></g:textField>
    <g:hiddenField id="org" name="org.id" value="${orgInformationInstance?.org?.id}" ></g:hiddenField>
</div>

