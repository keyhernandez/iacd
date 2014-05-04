
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

        <div id="show-persona" class="content scaffold-show" role="main">
            <h1>${personaInstance?.nombre}</h1>

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

                <g:if test="${Persona.talleresInscritos(personaInstance?.id)}">
                    <input id="tab-4" type="radio" name="tab-group" />
                    <label for="tab-4">Talleres Disponibles</label>
                </g:if>
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
                    <g:if test="${Persona.talleresInscritos(personaInstance?.id)}">
                        <div id="content-4">
                            <section style="width: 1000px; height: 500px; overflow-y: scroll;">
                                <table class="tablaSolvencia">
                                    <g:if test="${Clase.talleresDisponibles(new Date())}">
                                        <tr> </tr>
                                        <g:each in="${Clase.talleresDisponibles(new Date())}" var="x">
                                            <tr>
                                                <td><span class="property-value" aria-labelledby="clases-label"><g:link controller="clase" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></span>
                                                    </td>
                                                    <td> 

                                                    <section class="cssform">
                                                        <g:link class="btn btn-primary btn-block" controller="Factura" action="inscripcionCreate" params="${[foo:personaInstance?.id,bar:x.id]}">Inscripción</g:link>
                                                        </section>


                                                </td>
                                            </tr>
                                        </g:each>
                                    </g:if>
                                </table>
                            </section>
                        </div>
                    </g:if>

                </div>
            </div>
            <ul class="pager">
                <li class="previous"><a href="javascript:history.go(-1)">&larr; Atrás</a></li>
                <li class="next"><a href="javascript:history.go(1)">Siguiente &rarr;</a></li>
            </ul>


        </div>
    </body>
</html>
