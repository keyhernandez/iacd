<%@ page import="salias.Precio" %>

<div class="fieldcontain ${hasErrors(bean: precioInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="precio.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: precioInstance, field: 'monto')}" required=""/>
</div>

