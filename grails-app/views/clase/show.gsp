
<%@ page import="salias.Clase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clase.label', default: 'Clase')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list clase">
			
				<g:if test="${claseInstance?.asistencia}">
				<li class="fieldcontain">
					<span id="asistencia-label" class="property-label"><g:message code="clase.asistencia.label" default="Asistencia" /></span>
					
						<g:each in="${claseInstance.asistencia}" var="a">
						<span class="property-value" aria-labelledby="asistencia-label"><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.facturas}">
				<li class="fieldcontain">
					<span id="facturas-label" class="property-label"><g:message code="clase.facturas.label" default="Facturas" /></span>
					
						<g:each in="${claseInstance.facturas}" var="f">
						<span class="property-value" aria-labelledby="facturas-label"><g:link controller="factura" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.fechaFin}">
				<li class="fieldcontain">
					<span id="fechaFin-label" class="property-label"><g:message code="clase.fechaFin.label" default="Fecha Fin" /></span>
					
						<span class="property-value" aria-labelledby="fechaFin-label"><g:formatDate date="${claseInstance?.fechaFin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="clase.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate date="${claseInstance?.fechaInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.horario}">
				<li class="fieldcontain">
					<span id="horario-label" class="property-label"><g:message code="clase.horario.label" default="Horario" /></span>
					
						<span class="property-value" aria-labelledby="horario-label"><g:link controller="horario" action="show" id="${claseInstance?.horario?.id}">${claseInstance?.horario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="clase.persona.label" default="Persona" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${claseInstance?.persona?.id}">${claseInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="clase.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:link controller="precio" action="show" id="${claseInstance?.precio?.id}">${claseInstance?.precio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.salon}">
				<li class="fieldcontain">
					<span id="salon-label" class="property-label"><g:message code="clase.salon.label" default="Salon" /></span>
					
						<span class="property-value" aria-labelledby="salon-label"><g:link controller="salon" action="show" id="${claseInstance?.salon?.id}">${claseInstance?.salon?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.taller}">
				<li class="fieldcontain">
					<span id="taller-label" class="property-label"><g:message code="clase.taller.label" default="Taller" /></span>
					
						<span class="property-value" aria-labelledby="taller-label"><g:link controller="taller" action="show" id="${claseInstance?.taller?.id}">${claseInstance?.taller?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.tipoProfesor}">
				<li class="fieldcontain">
					<span id="tipoProfesor-label" class="property-label"><g:message code="clase.tipoProfesor.label" default="Tipo Profesor" /></span>
					
						<span class="property-value" aria-labelledby="tipoProfesor-label"><g:fieldValue bean="${claseInstance}" field="tipoProfesor"/></span>
					
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
