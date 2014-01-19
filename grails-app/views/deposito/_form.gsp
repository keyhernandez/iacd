<%@ page import="salias.Deposito" %>



<div class="fieldcontain ${hasErrors(bean: depositoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="deposito.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${depositoInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: depositoInstance, field: 'formaPago', 'error')} required">
	<label for="formaPago">
		<g:message code="deposito.formaPago.label" default="Forma Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="formaPago" name="formaPago.id" from="${salias.FormaPago.list()}" optionKey="id" required="" value="${depositoInstance?.formaPago?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: depositoInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="deposito.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: depositoInstance, field: 'monto')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: depositoInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="deposito.numero.label" default="Numero" />
		
	</label>
	<g:textField name="numero" value="${depositoInstance?.numero}"/>
</div>

