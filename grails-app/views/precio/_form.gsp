<%@ page import="salias.Precio" %>

<div class="fieldcontain ${hasErrors(bean: precioInstance, field: 'monto', 'error')} required form-group">
  <label for="monto" class="col-lg-4 control-label">
    <g:message code="precio.monto.label" default="Monto" />
    <span class="required-indicator">*</span>
  </label>
  <div class="col-lg-3">
    <g:field name="monto" value="${fieldValue(bean: precioInstance, field: 'monto')}" required="" class="form-control"/>
  </div>
</div>

