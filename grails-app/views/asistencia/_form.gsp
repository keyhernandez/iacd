<%@ page import="salias.Asistencia" %>



<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="asistencia.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${asistenciaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'horario', 'error')} required">
	<label for="horario">
		<g:message code="asistencia.horario.label" default="Horario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="horario" name="horario.id" from="${salias.Horario.list()}" optionKey="id" required="" value="${asistenciaInstance?.horario?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="asistencia.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${salias.Persona.list()}" optionKey="id" required="" value="${asistenciaInstance?.persona?.id}" class="many-to-one"/>
</div>

