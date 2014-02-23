<%@ page import="salias.Deposito" %>

<g:if test="${!domainReference}">
    <g:set var="domainReference" value=""/>
</g:if>


<div class="fieldcontain ${hasErrors(bean: depositoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="deposito.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="${domainReference}fecha" precision="day"  value="${depositoInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: depositoInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="deposito.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="${domainReference}monto" value="${fieldValue(bean: depositoInstance, field: 'monto')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: depositoInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="deposito.numero.label" default="Numero" />
		
	</label>
	<g:textField name="${domainReference}numero" value="${depositoInstance?.numero}"/>
</div>

