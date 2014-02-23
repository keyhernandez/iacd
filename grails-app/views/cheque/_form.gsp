<%@ page import="salias.Cheque" %>

<g:if test="${!domainReference}">
    <g:set var="domainReference" value=""/>
</g:if>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'banco', 'error')} ">
	<label for="banco">
		<g:message code="cheque.banco.label" default="Banco" />
		
	</label>
	<g:textField name="${domainReference}banco" value="${chequeInstance?.banco}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="cheque.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="${domainReference}monto" value="${fieldValue(bean: chequeInstance, field: 'monto')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="cheque.numero.label" default="Numero" />
		
	</label>
	<g:textField name="${domainReference}numero" value="${chequeInstance?.numero}"/>
</div>

