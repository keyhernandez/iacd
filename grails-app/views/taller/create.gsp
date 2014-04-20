<%@ page import="salias.Taller" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'taller.label', default: 'Taller')}" />
  <title>Registrar Taller</title>
</head>
<body>
  <a href="#create-taller" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="list">Listar Talleres</g:link></li>
    </ul>
  </div>
  <div id="create-taller" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    
    <g:hasErrors bean="${tallerInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${tallerInstance}" var="error">
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
