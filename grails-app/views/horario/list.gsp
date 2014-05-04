
<%@ page import="salias.Horario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'horario.label', default: 'Horario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-horario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-horario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="horaInicio" title="${message(code: 'horario.horaInicio.label', default: 'Hora Inicio')}" />
					
						<g:sortableColumn property="horaFin" title="${message(code: 'horario.horaFin.label', default: 'Hora Fin')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${horarioInstanceList}" status="i" var="horarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${horarioInstance.id}">${horarioInstance.horaInicio+":"+horarioInstance.minutosInicio+" "+horarioInstance.meridianoInicio} </g:link></td>
					
						<td>${horarioInstance.horaFin+":"+horarioInstance.minutosFin+" "+horarioInstance.meridianoFin}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${horarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
