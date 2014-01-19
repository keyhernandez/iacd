<%@ page import="salias.Cheque" %>



<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'banco', 'error')} ">
	<label for="banco">
		<g:message code="cheque.banco.label" default="Banco" />
		
	</label>
	<g:textField name="banco" value="${chequeInstance?.banco}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'formaPago', 'error')} required">
	<label for="formaPago">
		<g:message code="cheque.formaPago.label" default="Forma Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="formaPago" name="formaPago.id" from="${salias.FormaPago.list()}" optionKey="id" required="" value="${chequeInstance?.formaPago?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="cheque.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: chequeInstance, field: 'monto')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="cheque.numero.label" default="Numero" />
		
	</label>
	<g:textField name="numero" value="${chequeInstance?.numero}"/>
</div>

