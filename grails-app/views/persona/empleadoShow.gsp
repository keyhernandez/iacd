
<%@ page import="salias.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-persona" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list persona">
			
				<g:if test="${personaInstance?.asistencias}">
				<li class="fieldcontain">
					<span id="asistencias-label" class="property-label"><g:message code="persona.asistencias.label" default="Asistencias" /></span>
					
						<g:each in="${personaInstance.asistencias}" var="a">
						<span class="property-value" aria-labelledby="asistencias-label"><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.cedula}">
				<li class="fieldcontain">
					<span id="cedula-label" class="property-label"><g:message code="persona.cedula.label" default="Cedula" /></span>
					
						<span class="property-value" aria-labelledby="cedula-label"><g:fieldValue bean="${personaInstance}" field="cedula"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.clases}">
				<li class="fieldcontain">
					<span id="clases-label" class="property-label"><g:message code="persona.clases.label" default="Clases" /></span>
					
						<g:each in="${personaInstance.clases}" var="c">
						<span class="property-value" aria-labelledby="clases-label"><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.correo}">
				<li class="fieldcontain">
					<span id="correo-label" class="property-label"><g:message code="persona.correo.label" default="Correo" /></span>
					
						<span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${personaInstance}" field="correo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.tipoPersona}">
				<li class="fieldcontain">
					<span id="tipoPersona-label" class="property-label"><g:message code="persona.tipoPersona.label" default="Es Empleado" /></span>
					
						<span class="property-value" aria-labelledby="tipoPersona-label"><g:formatBoolean boolean="${personaInstance?.tipoPersona}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.facturas}">
				<li class="fieldcontain">
					<span id="facturas-label" class="property-label"><g:message code="persona.facturas.label" default="Facturas" /></span>
					
						<g:each in="${personaInstance.facturas}" var="f">
						<span class="property-value" aria-labelledby="facturas-label"><g:link controller="factura" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.fechaNac}">
				<li class="fieldcontain">
					<span id="fechaNac-label" class="property-label"><g:message code="persona.fechaNac.label" default="Fecha Nac" /></span>
					
						<span class="property-value" aria-labelledby="fechaNac-label"><g:formatDate date="${personaInstance?.fechaNac}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="persona.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${personaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="persona.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${personaInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.plantilla}">
				<li class="fieldcontain">
					<span id="plantilla-label" class="property-label"><g:message code="persona.plantilla.label" default="Plantilla" /></span>
					
						<span class="property-value" aria-labelledby="plantilla-label"><g:fieldValue bean="${personaInstance}" field="plantilla"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="persona.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${personaInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="persona.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${personaInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personaInstance?.id}" />
					<g:link class="edit" action="edit" id="${personaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
