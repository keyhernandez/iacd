<%@ page import="salias.Factura" %>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'clase2', 'error')} required form-group">
	<label for="clase2" class="col-lg-4 control-label">
		<g:message code="factura.clase2.label" default="Clase" />
		<span class="required-indicator">*</span>
	</label>
  <div class="col-lg-4">
	<g:select id="clase2" name="clase2.id" from="${salias.Clase.findAllByTaller(facturaInstance?.clase2.taller)}" optionKey="id" required="" value="${facturaInstance?.clase2?.id}" class="form-control"/>
</div>
</div>