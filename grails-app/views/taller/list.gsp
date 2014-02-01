
<%@ page import="salias.Taller" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'taller.label', default: 'Taller')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-taller" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-taller" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="categoria" title="${message(code: 'taller.categoria.label', default: 'Categoria')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'taller.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'taller.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="taller.precio.label" default="Precio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tallerInstanceList}" status="i" var="tallerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tallerInstance.id}">${fieldValue(bean: tallerInstance, field: "categoria")}</g:link></td>
					
						<td>${fieldValue(bean: tallerInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: tallerInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: tallerInstance, field: "precio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tallerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
