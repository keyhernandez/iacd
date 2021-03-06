
<%@ page import="salias.Precio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'precio.label', default: 'Precio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-precio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-precio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="monto" title="${message(code: 'precio.monto.label', default: 'Monto')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${precioInstanceList}" status="i" var="precioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${precioInstance.id}">${fieldValue(bean: precioInstance, field: "monto")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${precioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
