<%@ page import="LosSalias.SecUserSecRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secUserSecRole.label', default: 'SecUserSecRole')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-secUserSecRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-secUserSecRole" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			
			<g:hasErrors bean="${secUserSecRoleInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${secUserSecRoleInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
