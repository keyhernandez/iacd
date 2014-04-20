
<%@ page import="salias.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-factura" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			
			<ol class="property-list factura">
			
				<g:if test="${facturaInstance?.clase2}">
				<li class="fieldcontain">
					<span id="clase2-label" class="property-label"><g:message code="factura.clase2.label" default="Clase2" /></span>
					
						<span class="property-value" aria-labelledby="clase2-label"><g:link controller="clase" action="show" id="${facturaInstance?.clase2?.id}">${facturaInstance?.clase2?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.concepto}">
				<li class="fieldcontain">
					<span id="concepto-label" class="property-label"><g:message code="factura.concepto.label" default="Concepto" /></span>
					
						<span class="property-value" aria-labelledby="concepto-label"><g:fieldValue bean="${facturaInstance}" field="concepto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="factura.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${facturaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.formaPago}">
				<li class="fieldcontain">
					<span id="formaPago-label" class="property-label"><g:message code="factura.formaPago.label" default="Forma Pago" /></span>
					
						<span class="property-value" aria-labelledby="formaPago-label"><g:link controller="formaPago" action="show" id="${facturaInstance?.formaPago?.id}">${facturaInstance?.formaPago?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.grupo}">
				<li class="fieldcontain">
					<span id="grupo-label" class="property-label"><g:message code="factura.grupo.label" default="Grupo" /></span>
					
						<span class="property-value" aria-labelledby="grupo-label"><g:fieldValue bean="${facturaInstance}" field="grupo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="factura.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${facturaInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="factura.persona.label" default="Persona" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${facturaInstance?.persona?.id}">${facturaInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
