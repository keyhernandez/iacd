
<%@ page import="salias.Asistencia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-asistencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-asistencia" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			
			<ol class="property-list asistencia">
			
				<g:if test="${asistenciaInstance?.clase}">
				<li class="fieldcontain">
					<span id="clase-label" class="property-label"><g:message code="asistencia.clase.label" default="Clase" /></span>
					
						<span class="property-value" aria-labelledby="clase-label"><g:link controller="clase" action="show" id="${asistenciaInstance?.clase?.id}">${asistenciaInstance?.clase?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${asistenciaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="asistencia.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${asistenciaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${asistenciaInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="asistencia.persona.label" default="Persona" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${asistenciaInstance?.persona?.id}">${asistenciaInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
