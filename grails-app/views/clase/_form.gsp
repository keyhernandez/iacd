<%@ page import="salias.Clase" %>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'taller', 'error')} required  form-group">
  <label for="taller" class="col-lg-4 control-label">
    <g:message code="clase.taller.label" default="Taller" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-lg-4">
    <g:select id="taller" name="taller.id" from="${salias.Taller.list()}" optionKey="id" required="" value="${claseInstance?.taller?.id}" class="form-control"/>
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'fechaInicio', 'error')} required  form-group">
  <label for="fechaInicio" class="col-lg-4 control-label">
    <g:message code="clase.fechaInicio.label" default="Fecha Inicio" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-lg-4">
    <g:datePicker name="fechaInicio" precision="day"  value="${claseInstance?.fechaInicio}"  />
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'fechaFin', 'error')} required  form-group">
  <label for="fechaFin" class="col-lg-4 control-label">
    <g:message code="clase.fechaFin.label" default="Fecha Fin" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-lg-4">
    <g:datePicker name="fechaFin" precision="day"  value="${claseInstance?.fechaFin}"  />
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'horario', 'error')} required  form-group">
  <label for="horario" class="col-lg-4 control-label">
    <g:message code="clase.horario.label" default="Horario" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-lg-4">
    <g:select id="horario" name="horario.id" from="${salias.Horario.list()}" optionKey="id" required="" value="${claseInstance?.horario?.id}" class="form-control"/>
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'persona', 'error')} required  form-group">
  <label for="persona" class="col-lg-4 control-label">
    <g:message code="clase.persona.label" default="Profesor" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-lg-4">
    <g:select id="persona" name="persona.id" from="${salias.Persona.profesores()}" optionKey="id" required="" value="${claseInstance?.persona?.id}" class="form-control"/>
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'tipoProfesor', 'error')}  form-group">
  <label for="tipoProfesor" class="col-lg-4 control-label">
    <g:message code="clase.tipoProfesor.label" default="Tipo Profesor" />

  </label>
  <div class="col-lg-4">
    <g:select  name="tipoProfesor" from="${['Principal','Suplente']}" required="" value="${claseInstance?.tipoProfesor}" class="form-control"/>
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'precio', 'error')} required  form-group">
  <label for="precio" class="col-lg-4 control-label">
    <g:message code="clase.precio.label" default="Costo Inscripcion" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-lg-4">
    <g:select id="precio" name="precio.id" from="${salias.Precio.list()}" optionKey="id" required="" value="${claseInstance?.precio?.id}" class="form-control"/>
  </div>
</div>
<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'mensualidad', 'error')} required  form-group">
  <label for="mensualidad" class="col-lg-4 control-label">
    <g:message code="clase.mensualidad.label" default="Costo Mensualidad" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-lg-4">
    <g:select id="mensualidad" name="mensualidad.id" from="${salias.Precio.list()}" optionKey="id" required="" value="${claseInstance?.mensualidad?.id}" class="form-control"/>
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'salon', 'error')} required  form-group">
  <label for="salon" class="col-lg-4 control-label">
    <g:message code="clase.salon.label" default="Salon" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-lg-4">
    <g:select id="salon" name="salon.id" from="${salias.Salon.list()}" optionKey="id" required="" value="${claseInstance?.salon?.id}" class="form-control"/>
  </div>
</div>


