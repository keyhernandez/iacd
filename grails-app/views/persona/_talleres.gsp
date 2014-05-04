<%@ page import="salias.Persona" %>
<%@ page import="salias.Clase" %>  
<section style="width: 1000px; height: 500px; overflow-y: scroll;">


    <g:if test="${Persona.talleresInscritos(personaInstance?.id)}">

        <g:each in="${Persona.talleresInscritos(personaInstance.id)}" var="f" >

            <table class="tablaSolvencia">
                <tr> 
                <h4><span class="property-value" aria-labelledby="facturas-label">
                        <g:link controller="clase" action="show" id="${f.clase2.id}">${f?.clase2?.encodeAsHTML()}</g:link>
                        </span></h4>

                </tr>

                <fieldset class="buttons">
                    <tr>  <g:each in="${Persona.asistenciasPorTaller(f.clase2.id,personaInstance.id)}" var="ff" status="j" >
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

                <g:link class="btn btn-primary btn-block" controller="Asistencia" action="create" params="${[foo:personaInstance?.id,bar:f?.clase2?.id]}"><span class="glyphicon glyphicon-plus"></span> Asistencia</g:link>

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
                            <g:link class="btn btn-primary btn-block" controller="Factura" action="inscripcionCreate" params="${[foo:personaInstance?.id,bar:x.id]}">Inscripción</g:link>
                            </section>
                        </td>
                    </tr>
            </g:each>
        </g:if>
    </table>
</g:else>
</section>