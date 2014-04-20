<%@ page import="salias.Factura" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#edit-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

  <div id="edit-factura" class="content scaffold-edit" role="main">
    <h1>Transferencia de Clase</h1>

    <g:hasErrors bean="${facturaInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${facturaInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>
    <g:form method="post" class="form-horizontal" role="form">
      <g:hiddenField name="id" value="${facturaInstance?.id}" />
      <g:hiddenField name="version" value="${facturaInstance?.version}" />
      <fieldset class="form">
        <g:render template="transf"/>
      </fieldset>
      <div class="form-group">
        <div class="col-lg-offset-4 col-lg-6">
          <g:actionSubmit class="btn btn-default btn-success" action="update2" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </div>
      </div>
    </g:form>
  </div>
</body>
</html>
