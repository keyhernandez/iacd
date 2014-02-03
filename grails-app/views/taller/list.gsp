
<%@ page import="salias.Taller" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'taller.label', default: 'Taller')}" />
		<title>Talleres</title>
	</head>
	<body>
		<a href="#list-taller" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Registrar Taller</g:link></li>
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
                                            
						<g:sortableColumn property="nombre" title="${message(code: 'taller.nombre.label', default: 'Nombre')}" />
                                                
						<g:sortableColumn property="categoria" title="${message(code: 'taller.categoria.label', default: 'Categoría')}" />
                                                
						<g:sortableColumn property="descripcion" title="${message(code: 'taller.descripcion.label', default: 'Descripción')}" />
                                                
					</tr>
				</thead>
				<tbody>
				<g:each in="${tallerInstanceList}" status="i" var="tallerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tallerInstance.id}">${fieldValue(bean: tallerInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: tallerInstance, field: "categoria")}</td>
					
						<td>${fieldValue(bean: tallerInstance, field: "descripcion")}</td>
					
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
