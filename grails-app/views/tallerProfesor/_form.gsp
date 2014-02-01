<%@ page import="salias.TallerProfesor" %>



<div class="fieldcontain ${hasErrors(bean: tallerProfesorInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="tallerProfesor.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${salias.Persona.list()}" optionKey="id" required="" value="${tallerProfesorInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tallerProfesorInstance, field: 'taller', 'error')} required">
	<label for="taller">
		<g:message code="tallerProfesor.taller.label" default="Taller" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="taller" name="taller.id" from="${salias.Taller.list()}" optionKey="id" required="" value="${tallerProfesorInstance?.taller?.id}" class="many-to-one"/>
</div>

