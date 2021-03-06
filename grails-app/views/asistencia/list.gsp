
<%@ page import="salias.Asistencia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-asistencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-asistencia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<table>
				<thead>
					<tr>
					
						<th><g:message code="asistencia.clase.label" default="Clase" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'asistencia.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="asistencia.persona.label" default="Persona" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${asistenciaInstanceList}" status="i" var="asistenciaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${asistenciaInstance.id}">${fieldValue(bean: asistenciaInstance, field: "clase")}</g:link></td>
					
						<td><g:formatDate date="${asistenciaInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: asistenciaInstance, field: "persona")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${asistenciaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
