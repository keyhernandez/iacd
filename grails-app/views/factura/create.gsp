<%@ page import="salias.Factura" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
  <title>Mensualidad</title>
</head>
<body>
  <a href="#create-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
 
  <div id="create-factura" class="content scaffold-create" role="main">
    <h1>Mensualidad</h1>
   
    <g:hasErrors bean="${facturaInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${facturaInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>
    <g:form action="save" class="form-horizontal" role="form" >
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <div class="form-group">
        <div class="col-lg-offset-4 col-lg-6">
          <g:submitButton name="create" class="btn btn-default btn-success" value="Pagar" />	
        </div>
      </div> 
    </g:form>
  </div>
</body>
</html>
