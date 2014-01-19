<%@ page import="salias.Factura" %>



<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'concepto', 'error')} ">
	<label for="concepto">
		<g:message code="factura.concepto.label" default="Concepto" />
		
	</label>
	<g:textField name="concepto" value="${facturaInstance?.concepto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="factura.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${facturaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'formaPago', 'error')} required">
	<label for="formaPago">
		<g:message code="factura.formaPago.label" default="Forma Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="formaPago" name="formaPago.id" from="${salias.FormaPago.list()}" optionKey="id" required="" value="${facturaInstance?.formaPago?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'grupo', 'error')} ">
	<label for="grupo">
		<g:message code="factura.grupo.label" default="Grupo" />
		
	</label>
	<g:textField name="grupo" value="${facturaInstance?.grupo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="factura.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" value="${facturaInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="factura.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${salias.Persona.list()}" optionKey="id" required="" value="${facturaInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'taller', 'error')} required">
	<label for="taller">
		<g:message code="factura.taller.label" default="Taller" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="taller" name="taller.id" from="${salias.Taller.list()}" optionKey="id" required="" value="${facturaInstance?.taller?.id}" class="many-to-one"/>
</div>

