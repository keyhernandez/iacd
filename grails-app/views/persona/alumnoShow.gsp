
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

            <ul class="nav nav-tabs nav-tabs">

                <li class="active"><a href="#tab1" data-toggle="tab"><strong>Datos Personales</strong></a></li>

                <li><a href="#tab2" data-toggle="tab"><strong>Talleres Inscritos</strong></a></li>

                <li><a href="#tab3" data-toggle="tab"><strong>Solvencia</strong></a></li>
                    <g:if test="${Persona.talleresInscritos(personaInstance?.id)}">
                    <li><a href="#tab4" data-toggle="tab"><strong>Talleres Disponibles</strong></a></li>                   

                    </g:if>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">  
                    <table >

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

                <div class="tab-pane" id="tab2"> <g:render template="talleres" />
                </div>

                <div class="tab-pane" id="tab3"><g:render template="solvencia" />
                </div>

                <g:if test="${Persona.talleresInscritos(personaInstance?.id)}">
                    <div class="tab-pane" id="tab4">
                        <section style="width: 1100px; height: 500px; overflow-y: scroll;">
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
            <ul class="pager">
                <li class="previous"><a href="javascript:history.go(-1)">&larr; Atrás</a></li>
                <li class="next"><a href="javascript:history.go(1)">Siguiente &rarr;</a></li>
            </ul>


        </div>
    </body>
</html>
