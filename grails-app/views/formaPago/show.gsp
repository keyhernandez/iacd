
<%@ page import="salias.FormaPago" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'formaPago.label', default: 'FormaPago')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-formaPago" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-formaPago" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list formaPago">
			
				<g:if test="${formaPagoInstance?.depositos}">
				<li class="fieldcontain">
					<span id="depositos-label" class="property-label"><g:message code="formaPago.depositos.label" default="Depositos" /></span>
					
						<g:each in="${formaPagoInstance.depositos}" var="d">
						<span class="property-value" aria-labelledby="depositos-label"><g:link controller="deposito" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${formaPagoInstance?.descuento}">
				<li class="fieldcontain">
					<span id="descuento-label" class="property-label"><g:message code="formaPago.descuento.label" default="Descuento" /></span>
					
						<span class="property-value" aria-labelledby="descuento-label"><g:fieldValue bean="${formaPagoInstance}" field="descuento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formaPagoInstance?.efectivo}">
				<li class="fieldcontain">
					<span id="efectivo-label" class="property-label"><g:message code="formaPago.efectivo.label" default="Efectivo" /></span>
					
						<span class="property-value" aria-labelledby="efectivo-label"><g:fieldValue bean="${formaPagoInstance}" field="efectivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formaPagoInstance?.factura}">
				<li class="fieldcontain">
					<span id="factura-label" class="property-label"><g:message code="formaPago.factura.label" default="Factura" /></span>
					
						<span class="property-value" aria-labelledby="factura-label"><g:link controller="factura" action="show" id="${formaPagoInstance?.factura?.id}">${formaPagoInstance?.factura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${formaPagoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="formaPago.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${formaPagoInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${formaPagoInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="formaPago.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${formaPagoInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formaPagoInstance?.tarjetas}">
				<li class="fieldcontain">
					<span id="tarjetas-label" class="property-label"><g:message code="formaPago.tarjetas.label" default="Tarjetas" /></span>
					
						<g:each in="${formaPagoInstance.tarjetas}" var="t">
						<span class="property-value" aria-labelledby="tarjetas-label"><g:link controller="tarjeta" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${formaPagoInstance?.id}" />
					<g:link class="edit" action="edit" id="${formaPagoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
