
<%@ page import="LosSalias.SecUserSecRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secUserSecRole.label', default: 'SecUserSecRole')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-secUserSecRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-secUserSecRole" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<table>
				<thead>
					<tr>
					
						<th><g:message code="secUserSecRole.secRole.label" default="Sec Role" /></th>
					
						<th><g:message code="secUserSecRole.secUser.label" default="Sec User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${secUserSecRoleInstanceList}" status="i" var="secUserSecRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${secUserSecRoleInstance.id}">${fieldValue(bean: secUserSecRoleInstance, field: "secRole")}</g:link></td>
					
						<td>${fieldValue(bean: secUserSecRoleInstance, field: "secUser")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${secUserSecRoleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
