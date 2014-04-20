<%@ page import="salias.Asistencia" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#edit-asistencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

  <div id="edit-asistencia" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>

    <g:hasErrors bean="${asistenciaInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${asistenciaInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>
    <g:form method="post" class="form-horizontal" role="form">
      <g:hiddenField name="id" value="${asistenciaInstance?.id}" />
      <g:hiddenField name="version" value="${asistenciaInstance?.version}" />
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <div class="form-group">
        <div class="col-lg-offset-4 col-lg-6">
          <g:actionSubmit class="btn btn-default btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </div>
      </div>
    </g:form>
  </div>
</body>
</html>
