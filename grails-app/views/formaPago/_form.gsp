<%@ page import="salias.FormaPago" %>



<div class="fieldcontain ${hasErrors(bean: formaPagoInstance, field: 'descuento', 'error')} required">
	<label for="descuento">
		<g:message code="formaPago.descuento.label" default="Descuento" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="descuento" type="number" value="${formaPagoInstance.descuento}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: formaPagoInstance, field: 'efectivo', 'error')} required">
	<label for="efectivo">
		<g:message code="formaPago.efectivo.label" default="Efectivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="efectivo" value="${fieldValue(bean: formaPagoInstance, field: 'efectivo')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: formaPagoInstance, field: 'factura', 'error')} required">
	<label for="factura">
		<g:message code="formaPago.factura.label" default="Factura" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="factura" name="factura.id" from="${salias.Factura.list()}" optionKey="id" required="" value="${formaPagoInstance?.factura?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: formaPagoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="formaPago.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${formaPagoInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: formaPagoInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="formaPago.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: formaPagoInstance, field: 'monto')}" required=""/>
</div>

