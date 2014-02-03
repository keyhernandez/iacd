<%@ page import="salias.Persona" %>




<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} ">
    <label for="nombre">
        <g:message code="persona.nombre.label" default="Nombre" />

    </label>
    <g:textField name="nombre" value="${personaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'plantilla', 'error')} ">
    <label for="plantilla">
        <g:message code="persona.plantilla.label" default="Plantilla" />

    </label>
    <g:textField name="plantilla" value="${personaInstance?.plantilla}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'cedula', 'error')} ">
    <label for="cedula">
        <g:message code="persona.cedula.label" default="Cedula" />
</label>
<g:textField name="cedula" value="${personaInstance?.cedula}"/>
        
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'correo', 'error')} ">
    <label for="correo">
        <g:message code="persona.correo.label" default="Correo" />

    </label>
    <g:textField name="correo" value="${personaInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'tipoPersona', 'error')} ">
    <g:hiddenField name="tipoPersona" value="Profesor"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'fechaNac', 'error')} required">
    <label for="fechaNac">
        <g:message code="persona.fechaNac.label" default="Fecha de Nacimiento" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fechaNac" precision="day" relativeYears="[-4..-100]"  value="${personaInstance?.fechaNac}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'sexo', 'error')} ">
    <label for="sexo">
        <g:message code="persona.sexo.label" default="Sexo" />

    </label>
        <g:select name="sexo" from="${['Femenino', 'Masculino']}" value="${personaInstance?.sexo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'telefonos', 'error')} ">
    <label for="telefonos">
        <g:message code="persona.telefonos.label" default="Telefonos" />

    </label>

<%-- ajax link to add new entries --%>
    <input type="button" rel="nofollow" class="actionButton" href="javascript:void(0)" 
    onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'profesorAddTelefono')}')" 
    value="${message(code: 'default.addNew.label', default:'+') }"/>
    
    <g:each in="${personaInstance?.telefonos?}" var="a" status="i">
        <div>
         <%-- set the domain reference that it can be mapped by the controller --%>
            <g:set var="domainReference" value="telefonos[${i}]."/>
            <%-- ajax link to remove entries --%>
            <label class="fieldcontain"><g:message code="telefono.label" default="Telefono" /></label>
            <input type="button" class="actionButton" 
            onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'profesorRemoveTelefono', params:[removeIx: i])}')" 
            value="${message(code: 'default.remove.label', default:'-') }"/>
            <g:hiddenField name="telefonos[${i}].id" value="${a?.id}"/>
            <g:render template="/telefono/form" model="[telefonoInstance: a]"/>
        </div>
    </g:each>

<%-- to restore the state of the form after ajax post/response --%>
    <g:hiddenField name="formId" value="${formId}"/>
    <g:hiddenField name="elementToReplace" value="${elementToReplace}"/>

</div>
