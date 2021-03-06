
<%@ page import="salias.Taller" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'taller.label', default: 'Taller')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-taller" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-taller" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			
			<ol class="property-list taller">
			
                                
				<g:if test="${tallerInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="taller.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tallerInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
				<g:if test="${tallerInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="taller.categoria.label" default="Categoría" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:fieldValue bean="${tallerInstance}" field="categoria"/></span>
					
				</li>
				</g:if>
			
                          <g:if test="${tallerInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="taller.descripcion.label" default="Descripción" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${tallerInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
                          
				<g:if test="${tallerInstance?.clases}">
				<li class="fieldcontain">
					<span id="clases-label" class="property-label"><g:message code="taller.clases.label" default="Clases" /></span>
					
						<g:each in="${tallerInstance.clases}" var="c">
						<span class="property-value" aria-labelledby="clases-label"><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				
			
			
			</ol>
                         <ul class="pager">
                <li class="previous"><a href="javascript:history.go(-1)">&larr; Atrás</a></li>

            </ul>
			
		</div>
	</body>
</html>
