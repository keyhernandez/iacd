<%@ page import="salias.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title>Modificar Empleado</title>
	</head>
	<body>
		<a href="#edit-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="empleadoList">Listar Empleados</g:link></li>
				<li><g:link class="create" action="empleadoCreate">Registrar Empleado</g:link></li>
			</ul>
		</div>
		<div id="edit-persona" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${personaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<%-- the form id to submit with the ajax link --%>
			<g:set value="createForm" var="formId"/>
			<%-- the element id to refresh the page wit the ajax response --%>
			<g:set value="elementToReplace" var="elementToReplace"/>
			<g:form method="post" name="${formId}">
			    <g:hiddenField name="id" value="${personaInstance?.id}" />
			    <g:hiddenField name="version" value="${personaInstance?.version}" />
			    <fieldset class="form" id="${elementToReplace}">
			        <g:render template="empleadoForm"/>
			    </fieldset>
			    <fieldset class="buttons">
			        <g:actionSubmit class="save" action="empleadoUpdate" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			    </fieldset>
			</g:form>
		</div>
	</body>
</html>
