
<%@ page import="vedstat.Instruction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instruction.label', default: 'Instruction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-instruction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-instruction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <h3 style="text-align: center"> <b> ${instructionInstance?.org} </b> </h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list instruction">
			
				<g:if test="${instructionInstance?.infDate}">
				<li class="fieldcontain">
					<span id="infDate-label" class="property-label"><g:message code="instruction.infDate.label" default="Inf Date" /></span>
					
						<span class="property-value" aria-labelledby="infDate-label"><g:formatDate date="${instructionInstance?.infDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.itogoInstructions}">
				<li class="fieldcontain">
					<span id="itogoInstructions-label" class="property-label"><g:message code="instruction.itogoInstructions.label" default="Itogo Instructions" /></span>
					
						<span class="property-value" aria-labelledby="itogoInstructions-label"><g:fieldValue bean="${instructionInstance}" field="itogoInstructions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.procentInstructions}">
				<li class="fieldcontain">
					<span id="procentInstructions-label" class="property-label"><g:message code="instruction.procentInstructions.label" default="Procent Instructions" /></span>
					
						<span class="property-value" aria-labelledby="procentInstructions-label"><g:fieldValue bean="${instructionInstance}" field="procentInstructions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.regJournal}">
				<li class="fieldcontain">
					<span id="regJournal-label" class="property-label"><g:message code="instruction.regJournal.label" default="Reg Journal" /></span>
					
						<span class="property-value" aria-labelledby="regJournal-label"><g:formatBoolean boolean="${instructionInstance?.regJournal}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.issueJournal}">
				<li class="fieldcontain">
					<span id="issueJournal-label" class="property-label"><g:message code="instruction.issueJournal.label" default="Issue Journal" /></span>
					
						<span class="property-value" aria-labelledby="issueJournal-label"><g:formatBoolean boolean="${instructionInstance?.issueJournal}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.kolKabinetOt}">
				<li class="fieldcontain">
					<span id="kolKabinetOt-label" class="property-label"><g:message code="instruction.kolKabinetOt.label" default="Kol Kabinet Ot" /></span>
					
						<span class="property-value" aria-labelledby="kolKabinetOt-label"><g:fieldValue bean="${instructionInstance}" field="kolKabinetOt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.kolUgolOt}">
				<li class="fieldcontain">
					<span id="kolUgolOt-label" class="property-label"><g:message code="instruction.kolUgolOt.label" default="Kol Ugol Ot" /></span>
					
						<span class="property-value" aria-labelledby="kolUgolOt-label"><g:fieldValue bean="${instructionInstance}" field="kolUgolOt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.isKomitetOt}">
				<li class="fieldcontain">
					<span id="isKomitetOt-label" class="property-label"><g:message code="instruction.isKomitetOt.label" default="Is Komitet Ot" /></span>
					
						<span class="property-value" aria-labelledby="isKomitetOt-label"><g:formatBoolean boolean="${instructionInstance?.isKomitetOt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.kolUpolnomochOt}">
				<li class="fieldcontain">
					<span id="kolUpolnomochOt-label" class="property-label"><g:message code="instruction.kolUpolnomochOt.label" default="Kol Upolnomoch Ot" /></span>
					
						<span class="property-value" aria-labelledby="kolUpolnomochOt-label"><g:fieldValue bean="${instructionInstance}" field="kolUpolnomochOt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.yearKollectDog}">
				<li class="fieldcontain">
					<span id="yearKollectDog-label" class="property-label"><g:message code="instruction.yearKollectDog.label" default="Year Kollect Dog" /></span>
					
						<span class="property-value" aria-labelledby="yearKollectDog-label"><g:fieldValue bean="${instructionInstance}" field="yearKollectDog"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.procentSiz}">
				<li class="fieldcontain">
					<span id="procentSiz-label" class="property-label"><g:message code="instruction.procentSiz.label" default="Procent Siz" /></span>
					
						<span class="property-value" aria-labelledby="procentSiz-label"><g:fieldValue bean="${instructionInstance}" field="procentSiz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.notNeedSiz}">
				<li class="fieldcontain">
					<span id="notNeedSiz-label" class="property-label"><g:message code="instruction.notNeedSiz.label" default="Not Need Siz" /></span>
					
						<span class="property-value" aria-labelledby="notNeedSiz-label"><g:formatBoolean boolean="${instructionInstance?.notNeedSiz}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructionInstance?.org}">
				<li class="fieldcontain">
					<span id="org-label" class="property-label"><g:message code="instruction.org.label" default="Org" /></span>
					
						<span class="property-value" aria-labelledby="org-label"><g:link controller="org" action="show" id="${instructionInstance?.org?.id}">${instructionInstance?.org?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${instructionInstance?.id}" />
					<g:link class="edit" action="edit" id="${instructionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAllGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
