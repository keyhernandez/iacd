<%@ page import="salias.Asistencia" %>



<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'clase', 'error')} required">
	<label for="clase">
		<g:message code="asistencia.clase.label" default="Clase" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="clase" name="clase.id" from="${salias.Clase.findById(asistenciaInstance?.clase?.id)}" optionKey="id" required="" value="${asistenciaInstance?.clase?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="asistencia.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${asistenciaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="asistencia.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${salias.Persona.get(asistenciaInstance?.persona?.id)}" optionKey="id" required="" value="${asistenciaInstance?.persona?.id}" class="many-to-one"/>
</div>

