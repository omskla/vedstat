
<%@ page import="vedstat.MunicArea" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'municArea.label', default: 'MunicArea')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-municArea" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
<sec:ifAllGranted roles="ROLE_ADMIN">
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>       </sec:ifAllGranted>
			</ul>
		</div>
		<div id="show-municArea" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list municArea">
			
				<g:if test="${municAreaInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="municArea.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${municAreaInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="municArea.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${municAreaInstance}" field="code"/></span>
					
				</li>
				</g:if>
			%{----}%
				%{--<g:if test="${municAreaInstance?.declension}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="declension-label" class="property-label"><g:message code="municArea.declension.label" default="Declension" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="declension-label"><g:fieldValue bean="${municAreaInstance}" field="declension"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			
				<g:if test="${municAreaInstance?.head}">
				<li class="fieldcontain">
					<span id="head-label" class="property-label"><g:message code="municArea.head.label" default="Head" /></span>
					
						<span class="property-value" aria-labelledby="head-label"><g:fieldValue bean="${municAreaInstance}" field="head"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.telHead}">
				<li class="fieldcontain">
					<span id="telHead-label" class="property-label"><g:message code="municArea.telHead.label" default="Tel Head" /></span>
					
						<span class="property-value" aria-labelledby="telHead-label"><g:fieldValue bean="${municAreaInstance}" field="telHead"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.specOt}">
				<li class="fieldcontain">
					<span id="specOt-label" class="property-label"><g:message code="municArea.specOt.label" default="Spec Ot" /></span>
					
						<span class="property-value" aria-labelledby="specOt-label"><g:fieldValue bean="${municAreaInstance}" field="specOt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.postSpecOt}">
				<li class="fieldcontain">
					<span id="postSpecOt-label" class="property-label"><g:message code="municArea.postSpecOt.label" default="Post Spec Ot" /></span>
					
						<span class="property-value" aria-labelledby="postSpecOt-label"><g:fieldValue bean="${municAreaInstance}" field="postSpecOt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.telSpecOt}">
				<li class="fieldcontain">
					<span id="telSpecOt-label" class="property-label"><g:message code="municArea.telSpecOt.label" default="Tel Spec Ot" /></span>
					
						<span class="property-value" aria-labelledby="telSpecOt-label"><g:fieldValue bean="${municAreaInstance}" field="telSpecOt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.dtSpecOt}">
				<li class="fieldcontain">
					<span id="dtSpecOt-label" class="property-label"><g:message code="municArea.dtSpecOt.label" default="Dt Spec Ot" /></span>
					
						<span class="property-value" aria-labelledby="dtSpecOt-label"><g:formatDate date="${municAreaInstance?.dtSpecOt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.educationSpecOt}">
				<li class="fieldcontain">
					<span id="educationSpecOt-label" class="property-label"><g:message code="municArea.educationSpecOt.label" default="Education Spec Ot" /></span>
					
						<span class="property-value" aria-labelledby="educationSpecOt-label"><g:fieldValue bean="${municAreaInstance}" field="educationSpecOt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.specTrud}">
				<li class="fieldcontain">
					<span id="specTrud-label" class="property-label"><g:message code="municArea.specTrud.label" default="Spec Trud" /></span>
					
						<span class="property-value" aria-labelledby="specTrud-label"><g:fieldValue bean="${municAreaInstance}" field="specTrud"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.postSpecTrud}">
				<li class="fieldcontain">
					<span id="postSpecTrud-label" class="property-label"><g:message code="municArea.postSpecTrud.label" default="Post Spec Trud" /></span>
					
						<span class="property-value" aria-labelledby="postSpecTrud-label"><g:fieldValue bean="${municAreaInstance}" field="postSpecTrud"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.telSpecTrud}">
				<li class="fieldcontain">
					<span id="telSpecTrud-label" class="property-label"><g:message code="municArea.telSpecTrud.label" default="Tel Spec Trud" /></span>
					
						<span class="property-value" aria-labelledby="telSpecTrud-label"><g:fieldValue bean="${municAreaInstance}" field="telSpecTrud"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.dtSpecTrud}">
				<li class="fieldcontain">
					<span id="dtSpecTrud-label" class="property-label"><g:message code="municArea.dtSpecTrud.label" default="Dt Spec Trud" /></span>
					
						<span class="property-value" aria-labelledby="dtSpecTrud-label"><g:formatDate date="${municAreaInstance?.dtSpecTrud}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${municAreaInstance?.educationSpecTrud}">
				<li class="fieldcontain">
					<span id="educationSpecTrud-label" class="property-label"><g:message code="municArea.educationSpecTrud.label" default="Education Spec Trud" /></span>
					
						<span class="property-value" aria-labelledby="educationSpecTrud-label"><g:fieldValue bean="${municAreaInstance}" field="educationSpecTrud"/></span>
					
				</li>
				</g:if>

                <g:if test="${municAreaInstance?.preds}">
                    <li class="fieldcontain">
                        <span id="preds-label" class="property-label"><g:message code="municArea.preds.label" default="Spec Trud" /></span>

                        <span class="property-value" aria-labelledby="specTrud-label"><g:fieldValue bean="${municAreaInstance}" field="preds"/></span>

                    </li>
                </g:if>

                <g:if test="${municAreaInstance?.postPreds}">
                    <li class="fieldcontain">
                        <span id="postPreds-label" class="property-label"><g:message code="municArea.postPreds.label" default="Post Spec Trud" /></span>

                        <span class="property-value" aria-labelledby="postpostPreds-label"><g:fieldValue bean="${municAreaInstance}" field="postPreds"/></span>

                    </li>
                </g:if>

                <g:if test="${municAreaInstance?.telPreds}">
                    <li class="fieldcontain">
                        <span id="telPreds-label" class="property-label"><g:message code="municArea.telPreds.label" default="telPreds" /></span>

                        <span class="property-value" aria-labelledby="telPreds-label"><g:fieldValue bean="${municAreaInstance}" field="telPreds"/></span>

                    </li>
                </g:if>



			
			</ol>
<sec:ifAllGranted roles="ROLE_ADMIN">
            <g:form url="[resource:municAreaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${municAreaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
    </sec:ifAllGranted>
		</div>
	</body>
</html>
