<%@ page import="LosSalias.SecUserSecRole" %>



<div class="fieldcontain ${hasErrors(bean: secUserSecRoleInstance, field: 'secRole', 'error')} required  form-group">
	<label for="secRole" class="col-lg-4 control-label">
		<g:message code="secUserSecRole.secRole.label" default="Rol" />
		<span class="required-indicator">*</span>
	</label>
        <div class="col-lg-3">
	<g:select id="secRole" name="secRole.id" from="${LosSalias.SecRole.list()}" optionKey="id" required="" value="${secUserSecRoleInstance?.secRole?.id}" class="form-control"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserSecRoleInstance, field: 'secUser', 'error')} required  form-group">
	<label for="secUser" class="col-lg-4 control-label">
		<g:message code="secUserSecRole.secUser.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
        <div class="col-lg-3">
	<g:select id="secUser" name="secUser.id" from="${LosSalias.SecUser.list()}" optionKey="id" required="" value="${secUserSecRoleInstance?.secUser?.id}" class="form-control"/>
</div>
</div>
