
<%@ page import="salias.Horario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'horario.label', default: 'Horario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-horario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-horario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			
			<ol class="property-list horario">
			
				<g:if test="${horarioInstance?.clases1}">
				<li class="fieldcontain">
					<span id="clases1-label" class="property-label"><g:message code="horario.clases1.label" default="Clases1" /></span>
					
						<g:each in="${horarioInstance.clases1}" var="c">
						<span class="property-value" aria-labelledby="clases1-label"><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${horarioInstance?.horaInicio}">
				<li class="fieldcontain">
					<span id="horaInicio-label" class="property-label"><g:message code="horario.horaInicio.label" default="Hora Inicio" /></span>
					
						<span class="property-value" aria-labelledby="horaInicio-label">${horarioInstance?.horaInicio+":"+horarioInstance?.minutosInicio+" "+horarioInstance?.meridianoInicio} </span>
					
				</li>
				</g:if>
			
				<g:if test="${horarioInstance?.horaFin}">
				<li class="fieldcontain">
					<span id="horaFin-label" class="property-label"><g:message code="horario.horaFin.label" default="Hora Fin" /></span>
					
						<span class="property-value" aria-labelledby="horaFin-label">${horarioInstance?.horaFin+":"+horarioInstance?.minutosFin+" "+horarioInstance?.meridianoFin}</span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
