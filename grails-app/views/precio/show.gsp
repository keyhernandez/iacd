
<%@ page import="salias.Precio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'precio.label', default: 'Precio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-precio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-precio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			
			<ol class="property-list precio">
			
				<g:if test="${precioInstance?.clasee}">
				<li class="fieldcontain">
					<span id="clasee-label" class="property-label"><g:message code="precio.clasee.label" default="Clasee" /></span>
					
						<g:each in="${precioInstance.clasee}" var="c">
						<span class="property-value" aria-labelledby="clasee-label"><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${precioInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="precio.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${precioInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
