
<%@ page import="salias.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title>Lista de Empleados</title>
	</head>
	<body>
		<a href="#list-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-persona" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cedula" title="${message(code: 'persona.cedula.label', default: 'Cédula')}" />
					
                                                
						<g:sortableColumn property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}" />
						<g:sortableColumn property="correo" title="${message(code: 'persona.correo.label', default: 'Correo')}" />
					
						<g:sortableColumn property="fechaNac" title="${message(code: 'persona.fechaNac.label', default: 'Fecha Nacimiento')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personaInstanceList}" status="i" var="personaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="empleadoShow" id="${personaInstance.id}">${fieldValue(bean: personaInstance, field: "cedula")}</g:link></td>
					
                                                
						<td>${fieldValue(bean: personaInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "correo")}</td>
					
						<td><g:formatDate date="${personaInstance.fechaNac}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
