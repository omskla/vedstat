<%@ page import="vedstat.MunicArea" %>



<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="municArea.description.label" default="Description" />
		
	</label>
	<g:textField class="input500" name="description" value="${municAreaInstance?.description}"/>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'code', 'error')} ">--}%
	%{--<label for="code">--}%
		%{--<g:message code="municArea.code.label" default="Code" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="code" value="${municAreaInstance?.code}"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'declension', 'error')} ">--}%
	%{--<label for="declension">--}%
		%{--<g:message code="municArea.declension.label" default="Declension" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="declension" value="${municAreaInstance?.declension}"/>--}%
%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'head', 'error')} ">
	<label for="head">
		<g:message code="municArea.head.label" default="Head" />
		
	</label>
	<g:textField  class="input500" name="head" value="${municAreaInstance?.head}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'telHead', 'error')} ">
	<label for="telHead">
		<g:message code="municArea.telHead.label" default="Tel Head" />
		
	</label>
	<g:textField name="telHead" value="${municAreaInstance?.telHead}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'specOt', 'error')} ">
	<label for="specOt">
		<g:message code="municArea.specOt.label" default="Spec Ot" />
		
	</label>
	<g:textField class="input500" name="specOt" value="${municAreaInstance?.specOt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'postSpecOt', 'error')} ">
	<label for="postSpecOt">
		<g:message code="municArea.postSpecOt.label" default="Post Spec Ot" />
		
	</label>
	<g:select from="['','Ведущий специалист','Главный специалист','Ведущий инспектор','Начальник сектора','Начальник отдела']"  name="postSpecOt" value="${municAreaInstance?.postSpecOt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'telSpecOt', 'error')} ">
	<label for="telSpecOt">
		<g:message code="municArea.telSpecOt.label" default="Tel Spec Ot" />
		
	</label>
	<g:textField name="telSpecOt" value="${municAreaInstance?.telSpecOt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'dtSpecOt', 'error')} ">
	<label for="dtSpecOt">
		<g:message code="municArea.dtSpecOt.label" default="Dt Spec Ot" />
		
	</label>
	<g:datePicker name="dtSpecOt" precision="day" years="${1999..2017}"  value="${municAreaInstance?.dtSpecOt}" default="none" noSelection="['': '']"  />
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'educationSpecOt', 'error')} ">
	<label for="educationSpecOt">
		<g:message code="municArea.educationSpecOt.label" default="Education Spec Ot" />
		
	</label>
	<g:textField name="educationSpecOt" class="input500" value="${municAreaInstance?.educationSpecOt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'specTrud', 'error')} ">
	<label for="specTrud">
		<g:message code="municArea.specTrud.label" default="Spec Trud" />
		
	</label>
	<g:textField name="specTrud" class="input500" value="${municAreaInstance?.specTrud}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'postSpecTrud', 'error')} ">
	<label for="postSpecTrud">
		<g:message code="municArea.postSpecTrud.label" default="Post Spec Trud" />
		
	</label>
	<g:select from="['','Ведущий специалист','Главный специалист','Ведущий инспектор','Начальник сектора','Начальник отдела']" name="postSpecTrud" value="${municAreaInstance?.postSpecTrud}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'telSpecTrud', 'error')} ">
	<label for="telSpecTrud">
		<g:message code="municArea.telSpecTrud.label" default="Tel Spec Trud" />
		
	</label>
	<g:textField name="telSpecTrud" value="${municAreaInstance?.telSpecTrud}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'dtSpecTrud', 'error')} ">
	<label for="dtSpecTrud">
		<g:message code="municArea.dtSpecTrud.label" default="Dt Spec Trud" />
		
	</label>
	<g:datePicker name="dtSpecTrud" precision="day"  value="${municAreaInstance?.dtSpecTrud}" years="${1999..2017}"  default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'educationSpecTrud', 'error')} ">
	<label for="educationSpecTrud">
		<g:message code="municArea.educationSpecTrud.label" default="Education Spec Trud" />
		
	</label>
	<g:textField name="educationSpecTrud" value="${municAreaInstance?.educationSpecTrud}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'preds', 'error')} ">
    <label for="preds">
        <g:message code="municArea.preds.label" default="preds" />

    </label>
    <g:textField name="preds" class="input500" value="${municAreaInstance?.preds}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'postPreds', 'error')} ">
    <label for="postPreds">
        <g:message code="municArea.postPreds.label" default="postPreds" />

    </label>
    <g:textField name="postPreds" value="${municAreaInstance?.postPreds}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municAreaInstance, field: 'telPreds', 'error')} ">
    <label for="telPreds">
        <g:message code="municArea.telPreds.label" default="telPreds" />

    </label>
    <g:textField name="telPreds" value="${municAreaInstance?.telPreds}"/>
</div>

