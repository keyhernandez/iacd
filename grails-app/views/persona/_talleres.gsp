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
      
            <fieldset class="buttons">
              <g:link class="create" controller="Asistencia" action="create" params="${[foo:personaInstance?.id,bar:f?.clase2?.id]}">Asistencia</g:link>

            </fieldset>

          
      </tr>
      
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
    </g:each>



  </g:if>


  <g:else>

    <section class="message" role="status"><g:message code="persona.facturas.label" default="No posee talleres inscritos" /> </section>
    <table class="tablaSolvencia">
      <tr> <h4>Talleres Disponibles</h4></tr>
      <g:each in="${Clase.talleresDisponibles(new Date())}" var="x">
        <tr>
          <td><span class="property-value" aria-labelledby="clases-label"><g:link controller="clase" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></span>
          </td>
          <td> 
            <fieldset class="buttons">
              <g:link class="create" action="incripcionCreate">Inscripcion</g:link>

            </fieldset>

          </td>
        </tr>
      </g:each>
    </table>
  </g:else>
</section>