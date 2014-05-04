<%@ page import="salias.Descuento" %>



<div class="fieldcontain ${hasErrors(bean: descuentoInstance, field: 'nombre', 'error')} form-group">
    <label for="nombre" class="col-lg-4 control-label">
        <g:message code="descuento.nombre.label" default="Nombre" />

    </label>
    <div class="col-lg-4">
        <g:textField name="nombre" value="${descuentoInstance?.nombre}" class="form-control"/>
    </div>
</div>

<div class="fieldcontain ${hasErrors(bean: descuentoInstance, field: 'porcentaje', 'error')} required form-group">
    <label for="porcentaje" class="col-lg-4 control-label">
        <g:message code="descuento.porcentaje.label" default="Porcentaje" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-4">
        <g:field name="porcentaje" type="number" value="${descuentoInstance.porcentaje}" required="" class="form-control"/>
    </div>
</div>

