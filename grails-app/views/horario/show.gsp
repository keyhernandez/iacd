
<%@ page import="salias.Horario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'horario.label', default: 'Horario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-horario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-horario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list horario">
			
				<g:if test="${horarioInstance?.clases1}">
				<li class="fieldcontain">
					<span id="clases1-label" class="property-label"><g:message code="horario.clases1.label" default="Clases1" /></span>
					
						<g:each in="${horarioInstance.clases1}" var="c">
						<span class="property-value" aria-labelledby="clases1-label"><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${horarioInstance?.horaFin}">
				<li class="fieldcontain">
					<span id="horaFin-label" class="property-label"><g:message code="horario.horaFin.label" default="Hora Fin" /></span>
					
						<span class="property-value" aria-labelledby="horaFin-label"><g:formatDate date="${horarioInstance?.horaFin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${horarioInstance?.horaInicio}">
				<li class="fieldcontain">
					<span id="horaInicio-label" class="property-label"><g:message code="horario.horaInicio.label" default="Hora Inicio" /></span>
					
						<span class="property-value" aria-labelledby="horaInicio-label"><g:formatDate date="${horarioInstance?.horaInicio}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${horarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${horarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
