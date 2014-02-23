
<%@ page import="salias.Deposito" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'deposito.label', default: 'Deposito')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-deposito" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-deposito" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="deposito.factura.label" default="Factura" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'deposito.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="monto" title="${message(code: 'deposito.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'deposito.numero.label', default: 'Numero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${depositoInstanceList}" status="i" var="depositoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${depositoInstance.id}">${fieldValue(bean: depositoInstance, field: "factura")}</g:link></td>
					
						<td><g:formatDate date="${depositoInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: depositoInstance, field: "monto")}</td>
					
						<td>${fieldValue(bean: depositoInstance, field: "numero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${depositoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
