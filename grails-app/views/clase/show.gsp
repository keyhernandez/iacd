
<%@ page import="salias.Clase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clase.label', default: 'Clase')}" />
		<title>${claseInstance?.encodeAsHTML()}</title>
	</head>
	<body>
		<a href="#show-clase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-clase" class="content scaffold-show" role="main">
			<h1>${claseInstance?.taller?.encodeAsHTML()}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list clase">
			
			
				<g:if test="${claseInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="clase.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate format="dd/MM/yyyy" date="${claseInstance?.fechaInicio}" /></span>
					
				</li>
				</g:if>
				<g:if test="${claseInstance?.fechaFin}">
				<li class="fieldcontain">
					<span id="fechaFin-label" class="property-label"><g:message code="clase.fechaFin.label" default="Fecha Fin" /></span>
					
						<span class="property-value" aria-labelledby="fechaFin-label"><g:formatDate format="dd/MM/yyyy" date="${claseInstance?.fechaFin}" /></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${claseInstance?.horario}">
				<li class="fieldcontain">
					<span id="horario-label" class="property-label"><g:message code="clase.horario.label" default="Horario" /></span>
					
						<span class="property-value" aria-labelledby="horario-label">${claseInstance?.horario?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="clase.persona.label" default="Profesor" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="profesorShow" id="${claseInstance?.persona?.id}">${claseInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.tipoProfesor}">
				<li class="fieldcontain">
					<span id="tipoProfesor-label" class="property-label"><g:message code="clase.tipoProfesor.label" default="Tipo Profesor" /></span>
					
						<span class="property-value" aria-labelledby="tipoProfesor-label"><g:fieldValue bean="${claseInstance}" field="tipoProfesor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="clase.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label">${claseInstance?.precio?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.salon}">
				<li class="fieldcontain">
					<span id="salon-label" class="property-label"><g:message code="clase.salon.label" default="Salon" /></span>
					
						<span class="property-value" aria-labelledby="salon-label">${claseInstance?.salon?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${claseInstance?.id}" />
					<g:link class="edit" action="edit" id="${claseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
