
<%@ page import="salias.FormaPago" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'formaPago.label', default: 'FormaPago')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-formaPago" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-formaPago" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descuento" title="${message(code: 'formaPago.descuento.label', default: 'Descuento')}" />
					
						<g:sortableColumn property="efectivo" title="${message(code: 'formaPago.efectivo.label', default: 'Efectivo')}" />
					
						<th><g:message code="formaPago.factura.label" default="Factura" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'formaPago.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="monto" title="${message(code: 'formaPago.monto.label', default: 'Monto')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${formaPagoInstanceList}" status="i" var="formaPagoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${formaPagoInstance.id}">${fieldValue(bean: formaPagoInstance, field: "descuento")}</g:link></td>
					
						<td>${fieldValue(bean: formaPagoInstance, field: "efectivo")}</td>
					
						<td>${fieldValue(bean: formaPagoInstance, field: "factura")}</td>
					
						<td><g:formatDate date="${formaPagoInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: formaPagoInstance, field: "monto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${formaPagoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
