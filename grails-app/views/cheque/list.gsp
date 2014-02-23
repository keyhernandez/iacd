
<%@ page import="salias.Cheque" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cheque" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cheque" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="banco" title="${message(code: 'cheque.banco.label', default: 'Banco')}" />
					
						<th><g:message code="cheque.factura.label" default="Factura" /></th>
					
						<g:sortableColumn property="monto" title="${message(code: 'cheque.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'cheque.numero.label', default: 'Numero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chequeInstanceList}" status="i" var="chequeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chequeInstance.id}">${fieldValue(bean: chequeInstance, field: "banco")}</g:link></td>
					
						<td>${fieldValue(bean: chequeInstance, field: "factura")}</td>
					
						<td>${fieldValue(bean: chequeInstance, field: "monto")}</td>
					
						<td>${fieldValue(bean: chequeInstance, field: "numero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chequeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
