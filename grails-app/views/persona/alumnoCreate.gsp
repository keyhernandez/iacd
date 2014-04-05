<%@ page import="salias.Persona" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
  <title>Registrar Alumno</title>
  <script src="js/bootstrap-datepicker.js"></script>
  <script type="text/javascript">
      // When the document is ready
      $(document).ready(function () {
                
          $('#example1').datepicker({
              format: "dd/mm/yyyy"
          });  
            
      });
  </script>
</head>
<body>
  <a href="#create-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="alumnoList">Listar Alumnos</g:link></li>
    </ul>
  </div>
  <div id="create-persona" class="content scaffold-create" role="main">
    <h1>Registrar Alumno</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${personaInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${personaInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>
<%-- the form id to submit with the ajax link --%>
    <g:set value="createForm" var="formId"/>
<%-- the element id to refresh the page wit the ajax response --%>
    <g:set value="elementToReplace" var="elementToReplace"/>
    <g:form action="alumnoSave" name="${formId}" class="form-horizontal" role="form">

      <fieldset class="form" id="${elementToReplace}">
        <g:render template="alumnoForm"/>
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
