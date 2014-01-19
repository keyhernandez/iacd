<%@ page import="salias.Telefono" %>

<g:if test="${!domainReference}">
    <g:set var="domainReference" value=""/>
</g:if>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="telefono.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="${domainReference}codigo" value="${telefonoInstance?.codigo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="telefono.numero.label" default="Numero" />
		
	</label>
	<g:textField name="${domainReference}numero" value="${telefonoInstance?.numero}"/>
</div>

<!--<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="telefono.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${salias.Persona.list()}" optionKey="id" required="" value="${telefonoInstance?.persona?.id}" class="many-to-one"/>
</div>
-->
