<%@ page import="LosSalias.SecRole" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'secRole.label', default: 'SecRole')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-secRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="create-secRole" class="content scaffold-create" role="main">
            <h1>Crear Rol</h1>

            <g:hasErrors bean="${secRoleInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${secRoleInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="save" class="form-horizontal" role="form">
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-6">
                        <g:submitButton name="create" class="btn btn-default btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />	
                    </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
