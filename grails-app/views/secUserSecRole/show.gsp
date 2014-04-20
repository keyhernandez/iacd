
<%@ page import="LosSalias.SecUserSecRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secUserSecRole.label', default: 'SecUserSecRole')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-secUserSecRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-secUserSecRole" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			
			<ol class="property-list secUserSecRole">
			
				<g:if test="${secUserSecRoleInstance?.secRole}">
				<li class="fieldcontain">
					<span id="secRole-label" class="property-label"><g:message code="secUserSecRole.secRole.label" default="Sec Role" /></span>
					
						<span class="property-value" aria-labelledby="secRole-label"><g:link controller="secRole" action="show" id="${secUserSecRoleInstance?.secRole?.id}">${secUserSecRoleInstance?.secRole?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${secUserSecRoleInstance?.secUser}">
				<li class="fieldcontain">
					<span id="secUser-label" class="property-label"><g:message code="secUserSecRole.secUser.label" default="Sec User" /></span>
					
						<span class="property-value" aria-labelledby="secUser-label"><g:link controller="secUser" action="show" id="${secUserSecRoleInstance?.secUser?.id}">${secUserSecRoleInstance?.secUser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
