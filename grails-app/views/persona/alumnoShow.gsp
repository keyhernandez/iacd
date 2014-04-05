
<%@ page import="salias.Persona" %>
<%@ page import="salias.Clase" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
  <title>Alumno: ${personaInstance?.nombre}</title>
</head>
<body>
  <a href="#show-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="alumnoList">Listar Alumnos</g:link></li>
      <li><g:link class="create" action="alumnoCreate">Registrar Alumno</g:link></li>
      <li><g:link class="create" controller="factura" action="create">Inscribir Alumno en Taller</g:link></li>
    </ul>
  </div>
  <div id="show-persona" class="content scaffold-show" role="main">
    <h1>${personaInstance?.nombre}</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div id="container1">
      <!--Pestaña 1 activa por defecto-->
      <input id="tab-1" type="radio" name="tab-group" checked="checked" />
      <label for="tab-1">Datos Personales</label>
      <!--Pestaña 2 inactiva por defecto-->
      <input id="tab-2" type="radio" name="tab-group" />
      <label for="tab-2">Talleres Inscritos</label>
      <!--Pestaña 3 inactiva por defecto-->
      <input id="tab-3" type="radio" name="tab-group" />
      <label for="tab-3">Solvencia</label>
      <!--Contenido a mostrar/ocultar-->
      <div id="content1">
        <!--Contenido de la Pestaña 1-->
        <div id="content-1">
          <table style="width:50em">

            <g:if test="${personaInstance?.cedula}">
              <tr>
                <td>
                  <strong>
                    <span id="cedula-label" class="property-label"><g:message code="persona.cedula.label" default="Cedula" /></span>
                  </strong>
                </td>
                <td>
                  <span class="property-value" aria-labelledby="cedula-label"><g:fieldValue bean="${personaInstance}" field="cedula"/></span>

                </td>
              </tr>
            </g:if>

            <g:if test="${personaInstance?.correo}">
              <tr>
                <td><strong>
                    <span id="correo-label" class="property-label"><g:message code="persona.correo.label" default="Correo" /></span>
                  </strong>
                </td>
                <td>
                  <span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${personaInstance}" field="correo"/></span>

                </td>
              </tr>
            </g:if>

            <g:if test="${personaInstance?.fechaNac}">
              <tr>
                <td><strong>
                    <span id="fechaNac-label" class="property-label"><g:message code="persona.fechaNac.label" default="Fecha de Nacimiento" /></span>
                  </strong>
                </td>
                <td>
                  <span class="property-value" aria-labelledby="fechaNac-label"><g:formatDate format="dd/MM/yyyy" date="${personaInstance?.fechaNac}" /></span>

                </td>
              </tr>
            </g:if>

            <g:if test="${personaInstance?.nombre}">
              <tr>
                <td><strong>
                    <span id="nombre-label" class="property-label"><g:message code="persona.nombre.label" default="Nombre" /></span>
                  </strong>
                </td>
                <td>
                  <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${personaInstance}" field="nombre"/></span>

                </td>
              </tr>
            </g:if>


            <g:if test="${personaInstance?.plantilla}">
              <tr>
                <td><strong>
                    <span id="plantilla-label" class="property-label"><g:message code="persona.plantilla.label" default="Plantilla" /></span>
                  </strong>
                </td>
                <td>
                  <span class="property-value" aria-labelledby="plantilla-label"><g:fieldValue bean="${personaInstance}" field="plantilla"/></span>

                </td>
              </tr>
            </g:if>

            <g:if test="${personaInstance?.sexo}">
              <tr>
                <td><strong>
                    <span id="sexo-label" class="property-label"><g:message code="persona.sexo.label" default="Sexo" /></span>
                  </strong>
                </td>
                <td>
                  <span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${personaInstance}" field="sexo"/></span>

                </td>
              </tr>
            </g:if>

            <g:if test="${personaInstance?.telefonos}">
              <tr>
                <td><strong>
                    <span id="telefonos-label" class="property-label"><g:message code="persona.telefonos.label" default="Telefonos" /></span>
                  </strong>
                </td>
                <td>
              <g:each in="${personaInstance.telefonos}" var="t">
                <span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefono" action="edit" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
              </g:each>

              </td>
              </tr>
            </g:if>

          </table>
        </div>
        <!-- Talleres Inscritos-->
        <div id="content-2">
          <g:render template="talleres" />

        </div>
        <!-- Solvencia-->
        <div id="content-3">
          <g:render template="solvencia" />
        </div>

      </div>
    </div>
   <ul class="pager">
  <li class="previous"><a href="javascript:history.go(-1)">&larr; Atrás</a></li>
  <li class="next"><a href="javascript:history.go(1)">Siguiente &rarr;</a></li>
</ul>

    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${personaInstance?.id}" />
        <g:link class="edit" action="alumnoEdit" id="${personaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
