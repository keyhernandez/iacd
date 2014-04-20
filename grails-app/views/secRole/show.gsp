
<%@ page import="LosSalias.SecRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secRole.label', default: 'SecRole')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-secRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-secRole" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			
			<ol class="property-list secRole">
			
				<g:if test="${secRoleInstance?.authority}">
				<li class="fieldcontain">
					<span id="authority-label" class="property-label"><g:message code="secRole.authority.label" default="Authority" /></span>
					
						<span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${secRoleInstance}" field="authority"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
