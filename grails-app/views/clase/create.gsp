<%@ page import="salias.Clase" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'clase.label', default: 'Clase')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#create-clase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
 
  <div id="create-clase" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
   
   
    <g:form action="save" class="form-horizontal" role="form" >
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
