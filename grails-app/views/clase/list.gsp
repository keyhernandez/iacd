
<%@ page import="salias.Clase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clase.label', default: 'Clase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-clase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-clase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fechaFin" title="${message(code: 'clase.fechaFin.label', default: 'Fecha Fin')}" />
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'clase.fechaInicio.label', default: 'Fecha Inicio')}" />
					
						<th><g:message code="clase.horario.label" default="Horario" /></th>
					
						<th><g:message code="clase.mensualidad.label" default="Mensualidad" /></th>
					
						<th><g:message code="clase.persona.label" default="Persona" /></th>
					
						<th><g:message code="clase.precio.label" default="Precio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${claseInstanceList}" status="i" var="claseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${claseInstance.id}">${fieldValue(bean: claseInstance, field: "fechaFin")}</g:link></td>
					
						<td><g:formatDate date="${claseInstance.fechaInicio}" /></td>
					
						<td>${fieldValue(bean: claseInstance, field: "horario")}</td>
					
						<td>${fieldValue(bean: claseInstance, field: "mensualidad")}</td>
					
						<td>${fieldValue(bean: claseInstance, field: "persona")}</td>
					
						<td>${fieldValue(bean: claseInstance, field: "precio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${claseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
