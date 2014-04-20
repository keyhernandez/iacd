<%@ page import="salias.Taller" %>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'nombre', 'error')}  form-group">
  <label for="nombre" class="col-lg-4 control-label">
    <g:message code="taller.nombre.label" default="Nombre" />

  </label>
  <div class="col-lg-3">
    <g:textField name="nombre" value="${tallerInstance?.nombre}" class="form-control"/>
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'categoria', 'error')}  form-group">
  <label for="categoria" class="col-lg-4 control-label">
    <g:message code="taller.categoria.label" default="Categoría" />

  </label>
  <div class="col-lg-3">
    <g:select name="categoria" from="${['Deporte', 'Cultura']}" value="${tallerInstance?.categoria}" class="form-control" />
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'descripcion', 'error')}  form-group">
  <label for="descripcion" class="col-lg-4 control-label">
    <g:message code="taller.descripcion.label" default="Descripción" />

  </label>
  <div class="col-lg-3">
    <g:textArea name="descripcion" value="${tallerInstance?.descripcion}" class="form-control" />
  </div>
</div>

