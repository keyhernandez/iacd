
<%@ page import="salias.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title>Empleado: ${personaInstance?.nombre}</title>
	</head>
	<body>
		<a href="#show-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-persona" class="content scaffold-show" role="main">
			<h1>${personaInstance?.nombre}</h1>
			
			<ol class="property-list persona">
			
		
			
				<g:if test="${personaInstance?.cedula}">
				<li class="fieldcontain">
					<span id="cedula-label" class="property-label"><g:message code="persona.cedula.label" default="Cedula" /></span>
					
						<span class="property-value" aria-labelledby="cedula-label"><g:fieldValue bean="${personaInstance}" field="cedula"/></span>
					
				</li>
				</g:if>
		
			
				<g:if test="${personaInstance?.correo}">
				<li class="fieldcontain">
					<span id="correo-label" class="property-label"><g:message code="persona.correo.label" default="Correo" /></span>
					
						<span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${personaInstance}" field="correo"/></span>
					
				</li>
				</g:if>
			
		
			

			
				<g:if test="${personaInstance?.fechaNac}">
				<li class="fieldcontain">
					<span id="fechaNac-label" class="property-label"><g:message code="persona.fechaNac.label" default="Fecha Nac" /></span>
					
						<span class="property-value" aria-labelledby="fechaNac-label"><g:formatDate date="${personaInstance?.fechaNac}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="persona.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${personaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${personaInstance?.plantilla}">
				<li class="fieldcontain">
					<span id="plantilla-label" class="property-label"><g:message code="persona.plantilla.label" default="Plantilla" /></span>
					
						<span class="property-value" aria-labelledby="plantilla-label"><g:fieldValue bean="${personaInstance}" field="plantilla"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="persona.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${personaInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="persona.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${personaInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
