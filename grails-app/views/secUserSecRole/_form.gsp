<%@ page import="LosSalias.SecUserSecRole" %>



<div class="fieldcontain ${hasErrors(bean: secUserSecRoleInstance, field: 'secRole', 'error')} required">
	<label for="secRole">
		<g:message code="secUserSecRole.secRole.label" default="Sec Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secRole" name="secRole.id" from="${LosSalias.SecRole.list()}" optionKey="id" required="" value="${secUserSecRoleInstance?.secRole?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserSecRoleInstance, field: 'secUser', 'error')} required">
	<label for="secUser">
		<g:message code="secUserSecRole.secUser.label" default="Sec User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secUser" name="secUser.id" from="${LosSalias.SecUser.list()}" optionKey="id" required="" value="${secUserSecRoleInstance?.secUser?.id}" class="many-to-one"/>
</div>

