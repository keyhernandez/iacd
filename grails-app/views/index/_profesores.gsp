<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
 <section id="nav1">
     
      <ul>
        <li><a class="list" href="${createLink(controller:'Persona',action:'profesorCreate')}">Registrar Profesor</a></li>
        <li><a class="list" href="${createLink(controller:'TallerProfesor',action:'create')}">Asignar Profesor a Taller</a></li>
         <li><a class="list" href="${createLink(controller:'Taller',action:'create')}">Registrar Asistencia</a></li>
        <li><a class="list" href="${createLink(controller:'Taller',action:'create')}">Registrar pago a profesor</a></li>
        <li><a class="list" href="${createLink(controller:'Persona',action:'profesorList')}">Ver Profesores</a></li>
      </ul>
    </section>
                    <h1>Welcome to Grails</h1>

                    <h2>Available Controllers:</h2>
                    <ul>
                        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                            </g:each>
                    </ul>