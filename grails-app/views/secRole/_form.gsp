<%@ page import="LosSalias.SecRole" %>



<div class="fieldcontain ${hasErrors(bean: secRoleInstance, field: 'authority', 'error')} required form-group">
	<label for="authority" class="col-lg-4 control-label">
		<g:message code="secRole.authority.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
        <div class="col-lg-3">
	<g:textField name="authority" required="" value="${secRoleInstance?.authority}" class="form-control"/>
</div>
</div>

