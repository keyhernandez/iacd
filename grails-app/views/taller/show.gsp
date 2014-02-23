
<%@ page import="salias.Taller" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'taller.label', default: 'Taller')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-taller" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-taller" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list taller">
			
                                
				<g:if test="${tallerInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="taller.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tallerInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
				<g:if test="${tallerInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="taller.categoria.label" default="Categoría" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:fieldValue bean="${tallerInstance}" field="categoria"/></span>
					
				</li>
				</g:if>
			
                          <g:if test="${tallerInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="taller.descripcion.label" default="Descripción" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${tallerInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
                          
				<g:if test="${tallerInstance?.clases}">
				<li class="fieldcontain">
					<span id="clases-label" class="property-label"><g:message code="taller.clases.label" default="Clases" /></span>
					
						<g:each in="${tallerInstance.clases}" var="c">
						<span class="property-value" aria-labelledby="clases-label"><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				
			
			
			</ol>
                        <a href="javascript:history.go(-1)">Atrás</a>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tallerInstance?.id}" />
					<g:link class="edit" action="edit" id="${tallerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
