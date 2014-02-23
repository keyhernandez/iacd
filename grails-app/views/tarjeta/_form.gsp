<%@ page import="salias.Tarjeta" %>

<g:if test="${!domainReference}">
    <g:set var="domainReference" value=""/>
</g:if>



<div class="fieldcontain ${hasErrors(bean: tarjetaInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="tarjeta.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="${domainReference}monto" value="${fieldValue(bean: tarjetaInstance, field: 'monto')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarjetaInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="tarjeta.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="${domainReference}tipo" value="${tarjetaInstance?.tipo}"/>
</div>

