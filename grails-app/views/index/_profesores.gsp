<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
 <section id="nav1">
     
      <ul>
        <li><a class="list" href="${createLink(controller:'Persona',action:'create')}">Registrar Profesor</a></li>
        <li><a class="list" href="${createLink(controller:'Taller',action:'create')}">Asignar Profesor a Taller</a></li>
        <li><a class="list" href="${createLink(controller:'Taller',action:'create')}">Registrar pago a profesor</a></li>
      </ul>
    </section>