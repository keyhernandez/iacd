<%@ page import="salias.Salon" %>

<div class="fieldcontain ${hasErrors(bean: salonInstance, field: 'nombre', 'error')}  form-group">
	<label for="nombre" class="col-lg-4 control-label">
		<g:message code="salon.nombre.label" default="Nombre" />
		
        </label>
         <div class="col-lg-3">
	<g:textField name="nombre" value="${salonInstance?.nombre}" class="form-control"/>
         </div>
</div>

