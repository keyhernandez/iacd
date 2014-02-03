<%@ page import="salias.Clase" %>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'fechaFin', 'error')} required">
	<label for="fechaFin">
		<g:message code="clase.fechaFin.label" default="Fecha Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaFin" precision="day"  value="${claseInstance?.fechaFin}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'fechaInicio', 'error')} required">
	<label for="fechaInicio">
		<g:message code="clase.fechaInicio.label" default="Fecha Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${claseInstance?.fechaInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'horario', 'error')} required">
	<label for="horario">
		<g:message code="clase.horario.label" default="Horario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="horario" name="horario.id" from="${salias.Horario.list()}" optionKey="id" required="" value="${claseInstance?.horario?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="clase.persona.label" default="Profesor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${salias.Persona.profesores()}" optionKey="id" required="" value="${claseInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="clase.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="precio" name="precio.id" from="${salias.Precio.list()}" optionKey="id" required="" value="${claseInstance?.precio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'salon', 'error')} required">
	<label for="salon">
		<g:message code="clase.salon.label" default="Salon" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="salon" name="salon.id" from="${salias.Salon.list()}" optionKey="id" required="" value="${claseInstance?.salon?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'taller', 'error')} required">
	<label for="taller">
		<g:message code="clase.taller.label" default="Taller" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="taller" name="taller.id" from="${salias.Taller.list()}" optionKey="id" required="" value="${claseInstance?.taller?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'tipoProfesor', 'error')} ">
	<label for="tipoProfesor">
		<g:message code="clase.tipoProfesor.label" default="Tipo Profesor" />
		
	</label>
        <g:select name="tipoProfesor" from="${['Principal', 'Suplente']}" value="${claseInstance?.tipoProfesor}" />
</div>

