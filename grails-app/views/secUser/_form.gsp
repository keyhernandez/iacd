<%@ page import="LosSalias.SecUser" %>



<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'username', 'error')} required form-group">
	<label for="username" class="col-lg-4 control-label">
		<g:message code="secUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-3">
                <g:textField name="username" required="" value="${secUserInstance?.username}" class="form-control"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'password', 'error')} required form-group">
	<label for="password" class="col-lg-4 control-label">
		<g:message code="secUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-3">
                <g:textField name="password" required="" value="${secUserInstance?.password}" class="form-control"/>
</div>
</div>
<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'person', 'error')} required form-group">
	<label for="person" class="col-lg-4 control-label">
		<g:message code="secUser.person.label" default="Empleado" />
		<span class="required-indicator">*</span>
	</label>
        <div class="col-lg-3">
	<g:select id="person" name="person.id" from="${salias.Persona.findAllByTipoPersona('Empleado')}" optionKey="id" required="" value="${secUserInstance?.person?.id}" class="form-control"/>
</div>
</div>
<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountExpired', 'error')} form-group">
	<label for="accountExpired" class="col-lg-4 control-label">
		<g:message code="secUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<div class="col-lg-3">
                <g:checkBox name="accountExpired" value="${secUserInstance?.accountExpired}" />
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountLocked', 'error')} form-group">
	<label for="accountLocked" class="col-lg-4 control-label">
		<g:message code="secUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<div class="col-lg-3">
                <g:checkBox name="accountLocked" value="${secUserInstance?.accountLocked}" />
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'enabled', 'error')} form-group">
	<label for="enabled" class="col-lg-4 control-label">
		<g:message code="secUser.enabled.label" default="Enabled" />
		
	</label>
	<div class="col-lg-3">
                <g:checkBox name="enabled" value="${secUserInstance?.enabled}" />
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'passwordExpired', 'error')} form-group">
	<label for="passwordExpired" class="col-lg-4 control-label">
		<g:message code="secUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<div class="col-lg-3">
                <g:checkBox name="passwordExpired" value="${secUserInstance?.passwordExpired}" />
</div>
</div>


