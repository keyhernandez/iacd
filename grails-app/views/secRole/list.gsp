
<%@ page import="LosSalias.SecRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secRole.label', default: 'SecRole')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-secRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-secRole" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="authority" title="${message(code: 'secRole.authority.label', default: 'Authority')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${secRoleInstanceList}" status="i" var="secRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${secRoleInstance.id}">${fieldValue(bean: secRoleInstance, field: "authority")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${secRoleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
