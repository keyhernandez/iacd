
<%@ page import="salias.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-factura" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<table>
				<thead>
					<tr>
					
						<th><g:message code="factura.clase2.label" default="Clase2" /></th>
					
						<g:sortableColumn property="concepto" title="${message(code: 'factura.concepto.label', default: 'Concepto')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'factura.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="factura.formaPago.label" default="Forma Pago" /></th>
					
						<g:sortableColumn property="grupo" title="${message(code: 'factura.grupo.label', default: 'Grupo')}" />
					
						<g:sortableColumn property="observaciones" title="${message(code: 'factura.observaciones.label', default: 'Observaciones')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${facturaInstanceList}" status="i" var="facturaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${facturaInstance.id}">${fieldValue(bean: facturaInstance, field: "clase2")}</g:link></td>
					
						<td>${fieldValue(bean: facturaInstance, field: "concepto")}</td>
					
						<td><g:formatDate date="${facturaInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: facturaInstance, field: "formaPago")}</td>
					
						<td>${fieldValue(bean: facturaInstance, field: "grupo")}</td>
					
						<td>${fieldValue(bean: facturaInstance, field: "observaciones")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${facturaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
