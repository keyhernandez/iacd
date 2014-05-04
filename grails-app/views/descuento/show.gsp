
<%@ page import="salias.Descuento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'descuento.label', default: 'Descuento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-descuento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-descuento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
		
			<ol class="property-list descuento">
			
				<g:if test="${descuentoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="descuento.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${descuentoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${descuentoInstance?.porcentaje}">
				<li class="fieldcontain">
					<span id="porcentaje-label" class="property-label"><g:message code="descuento.porcentaje.label" default="Porcentaje" /></span>
					
						<span class="property-value" aria-labelledby="porcentaje-label"><g:fieldValue bean="${descuentoInstance}" field="porcentaje"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
