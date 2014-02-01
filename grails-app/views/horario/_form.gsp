<%@ page import="salias.Horario" %>



<div class="fieldcontain ${hasErrors(bean: horarioInstance, field: 'clases1', 'error')} ">
	<label for="clases1">
		<g:message code="horario.clases1.label" default="Clases1" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${horarioInstance?.clases1?}" var="c">
    <li><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="clase" action="create" params="['horario.id': horarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clase.label', default: 'Clase')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: horarioInstance, field: 'horaFin', 'error')} required">
	<label for="horaFin">
		<g:message code="horario.horaFin.label" default="Hora Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaFin" precision="day"  value="${horarioInstance?.horaFin}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: horarioInstance, field: 'horaInicio', 'error')} required">
	<label for="horaInicio">
		<g:message code="horario.horaInicio.label" default="Hora Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaInicio" precision="day"  value="${horarioInstance?.horaInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: horarioInstance, field: 'salon', 'error')} required">
	<label for="salon">
		<g:message code="horario.salon.label" default="Salon" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="salon" name="salon.id" from="${salias.Salon.list()}" optionKey="id" required="" value="${horarioInstance?.salon?.id}" class="many-to-one"/>
</div>

