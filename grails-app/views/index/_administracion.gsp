<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
 <section id="nav1">
     
      <ul>
        <li><a class="list" href="${createLink(controller:'Taller',action:'list')}">Gestión de Taller</a></li>
        <li><a class="list" href="${createLink(controller:'Clase',action:'list')}">Gestión de Clase</a></li>
        <li><a class="list" href="${createLink(controller:'Precio',action:'list')}">Gestión de Precios</a></li>
        <li><a class="list" href="${createLink(controller:'Salon',action:'list')}">Gestión de Salones</a></li>
         <li><a class="list" href="${createLink(controller:'Horario',action:'list')}">Gestión de Horarios</a></li>
      </ul>
    </section>
   

    <ul>
                        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                            </g:each>
                    </ul>  