
<%@ page import="salias.Salon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'salon.label', default: 'Salon')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-salon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-salon" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			
			<ol class="property-list salon">
			
				<g:if test="${salonInstance?.classe}">
				<li class="fieldcontain">
					<span id="classe-label" class="property-label"><g:message code="salon.classe.label" default="Classe" /></span>
					
						<g:each in="${salonInstance.classe}" var="c">
						<span class="property-value" aria-labelledby="classe-label"><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${salonInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="salon.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${salonInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
