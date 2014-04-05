<%@ page import="salias.Telefono" %>

<g:if test="${!domainReference}">
    <g:set var="domainReference" value=""/>
</g:if>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'codigo', 'error')} form-group">
	<label for="codigo" class="col-lg-4 control-label">
		<g:message code="telefono.codigo.label" default="Codigo" />
		
	</label>
  <div class="col-lg-2">
        <g:select class="form-control" name="${domainReference}codigo" from="${['0212', '0412', '0414', '0416','0424', '0426']}" value="${telefonoInstance?.codigo}" />
  </div>
  </div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'numero', 'error')} form-group">
	<label for="numero" class="col-lg-4 control-label">
		<g:message code="telefono.numero.label" default="Numero" />
		
	</label>
   <div class="col-lg-2">
	<g:textField class="form-control" name="${domainReference}numero" value="${telefonoInstance?.numero}"/>
</div>
</div>

<!--<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="telefono.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${salias.Persona.list()}" optionKey="id" required="" value="${telefonoInstance?.persona?.id}" class="many-to-one"/>
</div>
-->
