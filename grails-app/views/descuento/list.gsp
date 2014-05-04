
<%@ page import="salias.Descuento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'descuento.label', default: 'Descuento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-descuento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-descuento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<div class="panel panel-default">

			<table class="table">
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'descuento.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="porcentaje" title="${message(code: 'descuento.porcentaje.label', default: 'Porcentaje')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${descuentoInstanceList}" status="i" var="descuentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${descuentoInstance.id}">${fieldValue(bean: descuentoInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: descuentoInstance, field: "porcentaje")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                    
			<div class="pagination">
				<g:paginate total="${descuentoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
