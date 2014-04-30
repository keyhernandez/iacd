<%@ page import="salias.Asistencia" %>



<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'clase', 'error')} required form-group">
	<label for="clase" class="col-lg-4 control-label">
		<g:message code="asistencia.clase.label" default="Clase" />
		<span class="required-indicator">*</span>
	</label>
  <div class="col-lg-3">
	<g:select id="clase" name="clase.id" from="${salias.Clase.findById(asistenciaInstance?.clase?.id)}" optionKey="id" required="" value="${asistenciaInstance?.clase?.id}" class="form-control"/>
</div>
  </div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'fecha', 'error')} required form-group">
	<label for="fecha" class="col-lg-4 control-label">
		<g:message code="asistencia.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
  <div class="col-lg-6">
                    <p  class="form-control-static" >${new Date().format('dd/MM/yyyy')}</p>
  <g:hiddenField id="fecha"  name="fecha"   value="${g.formatDate(value:new Date(), format:'dd/MM/yyyy')}"/>       
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'persona', 'error')} required form-group">
	<label for="persona" class="col-lg-4 control-label">
		<g:message code="asistencia.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
  <div class="col-lg-3">
	<g:select id="persona" name="persona.id" from="${salias.Clase.findById(asistenciaInstance?.clase?.id)}" optionKey="id" required="" value="${asistenciaInstance?.persona?.id}" class="form-control"/>
</div>
  </div>

