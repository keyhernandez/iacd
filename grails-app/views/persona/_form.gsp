<%@ page import="salias.Persona" %>



<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'asistencias', 'error')} ">
	<label for="asistencias">
		<g:message code="persona.asistencias.label" default="Asistencias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personaInstance?.asistencias?}" var="a">
    <li><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="asistencia" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asistencia.label', default: 'Asistencia')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'cedula', 'error')} ">
	<label for="cedula">
		<g:message code="persona.cedula.label" default="Cedula" />
		
	</label>
	<g:textField name="cedula" value="${personaInstance?.cedula}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'clases', 'error')} ">
	<label for="clases">
		<g:message code="persona.clases.label" default="Clases" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personaInstance?.clases?}" var="c">
    <li><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="clase" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clase.label', default: 'Clase')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'correo', 'error')} ">
	<label for="correo">
		<g:message code="persona.correo.label" default="Correo" />
		
	</label>
	<g:textField name="correo" value="${personaInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'tipoPersona', 'error')} ">
	<label for="tipoPersona">
		<g:message code="persona.tipoPersona.label" default="Es Empleado" />
		
	</label>
	<g:checkBox name="tipoPersona" value="${personaInstance?.tipoPersona}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'facturas', 'error')} ">
	<label for="facturas">
		<g:message code="persona.facturas.label" default="Facturas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personaInstance?.facturas?}" var="f">
    <li><g:link controller="factura" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="factura" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'factura.label', default: 'Factura')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'fechaNac', 'error')} required">
	<label for="fechaNac">
		<g:message code="persona.fechaNac.label" default="Fecha Nac" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNac" precision="day"  value="${personaInstance?.fechaNac}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="persona.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${personaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="persona.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${personaInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'plantilla', 'error')} ">
	<label for="plantilla">
		<g:message code="persona.plantilla.label" default="Plantilla" />
		
	</label>
	<g:textField name="plantilla" value="${personaInstance?.plantilla}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'sexo', 'error')} ">
	<label for="sexo">
		<g:message code="persona.sexo.label" default="Sexo" />
		
	</label>
	<g:textField name="sexo" value="${personaInstance?.sexo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="persona.telefonos.label" default="Telefonos" />
		
	</label>
	
<%-- ajax link to add new entries --%>
<input type="button" rel="nofollow" class="actionButton" href="javascript:void(0)" 
    onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'addTelefono')}')" 
    value="${message(code: 'default.addNew.label', default:'+') }"/>
<g:each in="${personaInstance?.telefonos?}" var="a" status="i">
    <div>
     <%-- set the domain reference that it can be mapped by the controller --%>
     <g:set var="domainReference" value="telefonos[${i}]."/>
     <%-- ajax link to remove entries --%>
     <label class="fieldcontain"><g:message code="telefono.label" default="Telefono" /></label>
     <input type="button" class="actionButton" 
             onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'removeTelefono', params:[removeIx: i])}')" 
             value="${message(code: 'default.remove.label', default:'-') }"/>
     <g:hiddenField name="telefonos[${i}].id" value="${a?.id}"/>
     <g:render template="/telefono/form" model="[telefonoInstance: a]"/>
    </div>
</g:each>

<%-- to restore the state of the form after ajax post/response --%>
<g:hiddenField name="formId" value="${formId}"/>
<g:hiddenField name="elementToReplace" value="${elementToReplace}"/>

</div>

