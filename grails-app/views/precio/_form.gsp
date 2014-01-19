<%@ page import="salias.Precio" %>



<div class="fieldcontain ${hasErrors(bean: precioInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="precio.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: precioInstance, field: 'monto')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: precioInstance, field: 'taller', 'error')} required">
	<label for="taller">
		<g:message code="precio.taller.label" default="Taller" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="taller" name="taller.id" from="${salias.Taller.list()}" optionKey="id" required="" value="${precioInstance?.taller?.id}" class="many-to-one"/>
</div>

