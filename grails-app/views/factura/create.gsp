<%@ page import="salias.Factura" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#create-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <div id="create-factura" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${facturaInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${facturaInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>
<%-- the form id to submit with the ajax link --%>
    <g:set value="createForm" var="formId"/>
    <g:set value="createForm" var="formId1"/>
     <g:set value="createForm" var="formId2"/>
<%-- the element id to refresh the page wit the ajax response --%>
    <g:set value="elementToReplace" var="elementToReplace"/>
     <g:set value="elementToReplace1" var="elementToReplace1"/>
     <g:set value="elementToReplace2" var="elementToReplace2"/>
    <g:form action="save" name="${formId}">
      <fieldset class="form" id="${elementToReplace}">
      
        <g:render template="form"/>
       
      </fieldset>
      <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
