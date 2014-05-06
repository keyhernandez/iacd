
<%@ page import="salias.Persona" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
        <title>Profesor: ${personaInstance?.nombre}</title>
    </head>
    <body>
        <a href="#show-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        
            <div id="show-persona" class="content scaffold-show" role="main">
                <h1>${personaInstance?.nombre}</h1>
           
                
                <ul class="nav nav-tabs nav-tabs">

                <li class="active"><a href="#tab1" data-toggle="tab"><strong>Datos Personales</strong></a></li>

                <li><a href="#tab2" data-toggle="tab"><strong>Talleres Dictados</strong></a></li>

              
            </ul>
                
                
                
           <div class="tab-content">
                <div class="tab-pane active" id="tab1"> 
                        <table style="width:50em">

                            <g:if test="${personaInstance?.cedula}">
                                <tr>
                                    <td>
                                    <span id="cedula-label" class="property-label"><g:message code="persona.cedula.label" default="Cedula" /></span>

                                    </td>
                                    <td>
                                    <span class="property-value" aria-labelledby="cedula-label"><g:fieldValue bean="${personaInstance}" field="cedula"/></span>

                                    </td>
                                </tr>
                            </g:if>

                            <g:if test="${personaInstance?.correo}">
                                <tr>
                                    <td>
                                    <span id="correo-label" class="property-label"><g:message code="persona.correo.label" default="Correo" /></span>

                                    </td>
                                    <td>
                                    <span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${personaInstance}" field="correo"/></span>

                                    </td>
                                </tr>
                            </g:if>

                            <g:if test="${personaInstance?.fechaNac}">
                                <tr>
                                    <td>
                                    <span id="fechaNac-label" class="property-label"><g:message code="persona.fechaNac.label" default="Fecha de Nacimiento" /></span>

                                    </td>
                                    <td>
                                    <span class="property-value" aria-labelledby="fechaNac-label"><g:formatDate format="dd/MM/yyyy" date="${personaInstance?.fechaNac}" /></span>

                                    </td>
                                </tr>
                            </g:if>

                            <g:if test="${personaInstance?.nombre}">
                                <tr>
                                    <td>
                                    <span id="nombre-label" class="property-label"><g:message code="persona.nombre.label" default="Nombre" /></span>

                                    </td>
                                    <td>
                                    <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${personaInstance}" field="nombre"/></span>

                                    </td>
                                </tr>
                            </g:if>


                            <g:if test="${personaInstance?.plantilla}">
                                <tr>
                                    <td>
                                    <span id="plantilla-label" class="property-label"><g:message code="persona.plantilla.label" default="Plantilla" /></span>

                                    </td>
                                    <td>
                                    <span class="property-value" aria-labelledby="plantilla-label"><g:fieldValue bean="${personaInstance}" field="plantilla"/></span>

                                    </td>
                                </tr>
                            </g:if>

                            <g:if test="${personaInstance?.sexo}">
                                <tr>
                                    <td>
                                    <span id="sexo-label" class="property-label"><g:message code="persona.sexo.label" default="Sexo" /></span>

                                    </td>
                                    <td>
                                    <span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${personaInstance}" field="sexo"/></span>

                                    </td>
                                </tr>
                            </g:if>

                            <g:if test="${personaInstance?.telefonos}">
                                <tr>
                                    <td>
                                    <span id="telefonos-label" class="property-label"><g:message code="persona.telefonos.label" default="Telefonos" /></span>

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
                  <div class="tab-pane" id="tab2">
                  <g:if test="${personaInstance?.clases}">
				 <section style="width: 1100px; height: 500px; overflow-y: scroll;">


    <g:if test="${Persona.talleresInscritos(personaInstance?.id)}">

        <g:each in="${Persona.talleresInscritos(personaInstance.id)}" var="f" >

            <table class="tablaSolvencia">
                <tr> 
                <h4><span class="property-value" aria-labelledby="facturas-label">
                        <g:link controller="clase" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link>
                        </span></h4>

                </tr>

               
                    <tr>  <g:each in="${Persona.asistenciasPorTaller(f.id,personaInstance.id)}" var="ff" status="j" >
                            <g:if test="${(j %4) !=0}">
                                <td>${ff}</td>
                            </g:if>
                            <g:else>
                            </tr>
                            <tr>
                                <td>${ff}</td>


                            </g:else>
                        </g:each>
                    </tr>
            </table>

            <section class="cssform" style="max-width: 100px">

                <g:link class="btn btn-primary btn-block" controller="Asistencia" action="create" params="${[foo:personaInstance?.id,bar:f?.id]}"><span class="glyphicon glyphicon-plus"></span> Asistencia</g:link>

            </section>
        </fieldset>
        </br>
    </g:each>



</g:if>


<g:else>


    <section class="alert alert-info"><g:message code="persona.facturas.label" default="No posee talleres inscritos" /></section>

    <table class="tablaSolvencia">
        <g:if test="${Clase.talleresDisponibles(new Date())}">
            <tr> <h4>Talleres Disponibles</h4></tr>
            <g:each in="${Clase.talleresDisponibles(new Date())}" var="x">
                <tr>
                    <td><span class="property-value" aria-labelledby="clases-label"><g:link controller="clase" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></span>
                        </td>
                        <td> 

                        <section class="cssform">
                            <g:link class="btn btn-primary btn-block" controller="Factura" action="inscripcionCreate" params="${[foo:personaInstance?.id,bar:x.id]}">Inscripcion</g:link>
                            </section>
                        </td>
                    </tr>
            </g:each>
        </g:if>
    </table>
</g:else>
</section>
				</g:if>
                     <g:else>
                  
                  <section class="message" role="status"><g:message code="persona.facturas.label" default="No posee talleres inscritos" /> </section>
                   </g:else>
                  </div>
                </div>
            </div>
          
        </div>
    </body>
</html>
