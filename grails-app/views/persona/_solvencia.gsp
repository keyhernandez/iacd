<%@ page import="salias.Persona" %>
<%@ page import="salias.Clase" %>  
<section style="width: 1000px; height: 500px; overflow-y: scroll;">
    <g:if test="${Persona.talleresInscritos(personaInstance?.id)}">
        <g:each in="${Persona.talleresInscritos(personaInstance.id)}" var="f">
            <br>
            <table  class="tablaSolvencia">  
                <tr>
                    <td colspan="2">
                        ${f?.clase2?.encodeAsHTML()} 
                        
                            <section class="ccsform">
                                <g:link class="btn btn-primary btn-block" controller="factura" action="transferencia" params="${[foo:personaInstance?.id,bar:f?.clase2?.id]}"> <span class="glyphicon glyphicon-random"></span>  Transferir</g:link>
                                </section>
                       
                        </td>
                        <td >
                        ${Persona.estaSolvente(f?.clase2?.id,personaInstance?.id)}
                    </td>
                    <td> 
                        
                        <section class="ccsform" >
                                <g:link class="btn btn-primary btn-block" controller="factura" action="create" params="${[foo:personaInstance?.id,bar:f?.clase2?.id]}"> <span class="glyphicon glyphicon-usd"></span> Pagar</g:link>
                                </section>
                          

                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>Fecha de Inicio: </strong>
                        <g:formatDate  date="${f.clase2.fechaInicio}" />
                    </td>
                    <td>
                        <strong>Fecha de Fin: </strong>
                        <g:formatDate  date="${f.clase2.fechaFin}" />
                    </td>
                    <td>
                        <strong>Fecha de Inscripción: </strong>
                        <g:formatDate  date="${f.fecha}" />
                    </td>
                    <td>
                        <strong>Monto Cancelado:  </strong> ${f.clase2.precio}
                    </td>
                </tr>
                <g:if test="${Persona.pagosRealizados(f.clase2?.id,personaInstance.id)}">
                    <tr>
                        <td colspan="2">
                            <strong>Mensualidades Canceladas</strong>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <strong>Fecha</strong>
                        </td>

                        <td >
                            <strong>Monto</strong>
                        </td>
                    </tr>
                    <tr>
                        <g:each in="${Persona.pagosRealizados(f.clase2?.id,personaInstance.id)}" var="p">
                        <tr> 
                            <td>
                                <g:formatDate  date="${p.fecha}" />
                            </td>
                            <td>
                                3000 Bs.
                            </td>
                        </tr>
                    </g:each>
                    </tr>
                </g:if>
            </table>

        </g:each>

        <div class="pagination">
            <g:paginate total="5" />
        </div>
    </g:if>

    <g:else>
<section class="alert alert-info"><g:message code="persona.facturas.label" default="No posee talleres inscritos" /></section>
        
        </g:else>



</section>