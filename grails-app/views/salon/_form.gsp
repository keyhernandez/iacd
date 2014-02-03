<%@ page import="salias.Salon" %>

<div class="fieldcontain ${hasErrors(bean: salonInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="salon.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${salonInstance?.nombre}"/>
</div>

