
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
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-factura" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
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
			
				<g:if test="${facturaInstance?.depositos}">
				<li class="fieldcontain">
					<span id="depositos-label" class="property-label"><g:message code="factura.depositos.label" default="Depositos" /></span>
					
						<g:each in="${facturaInstance.depositos}" var="d">
						<span class="property-value" aria-labelledby="depositos-label"><g:link controller="deposito" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.descuento}">
				<li class="fieldcontain">
					<span id="descuento-label" class="property-label"><g:message code="factura.descuento.label" default="Descuento" /></span>
					
						<span class="property-value" aria-labelledby="descuento-label"><g:fieldValue bean="${facturaInstance}" field="descuento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.efectivo}">
				<li class="fieldcontain">
					<span id="efectivo-label" class="property-label"><g:message code="factura.efectivo.label" default="Efectivo" /></span>
					
						<span class="property-value" aria-labelledby="efectivo-label"><g:fieldValue bean="${facturaInstance}" field="efectivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="factura.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${facturaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.grupo}">
				<li class="fieldcontain">
					<span id="grupo-label" class="property-label"><g:message code="factura.grupo.label" default="Grupo" /></span>
					
						<span class="property-value" aria-labelledby="grupo-label"><g:fieldValue bean="${facturaInstance}" field="grupo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="factura.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${facturaInstance}" field="monto"/></span>
					
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
			
				<g:if test="${facturaInstance?.tarjetas}">
				<li class="fieldcontain">
					<span id="tarjetas-label" class="property-label"><g:message code="factura.tarjetas.label" default="Tarjetas" /></span>
					
						<g:each in="${facturaInstance.tarjetas}" var="t">
						<span class="property-value" aria-labelledby="tarjetas-label"><g:link controller="tarjeta" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
                          
                          	<g:if test="${facturaInstance?.cheques}">
				<li class="fieldcontain">
					<span id="cheques-label" class="property-label"><g:message code="factura.cheques.label" default="Cheques" /></span>
					
						<g:each in="${facturaInstance.cheques}" var="c">
						<span class="property-value" aria-labelledby="cheques-label"><g:link controller="cheque" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${facturaInstance?.id}" />
					<g:link class="edit" action="edit" id="${facturaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
