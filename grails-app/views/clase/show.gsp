
<%@ page import="salias.Clase" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'clase.label', default: 'Clase')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-clase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="show-clase" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>

            <form class="form-horizontal" role="form">

                <g:if test="${claseInstance?.taller}">
                    <div class="form-group">
                        <li class="fieldcontain">
                            <span id="taller-label" class="property-label"><g:message code="clase.taller.label" default="Taller" /></span>

                            <span class="property-value" aria-labelledby="taller-label"><g:link controller="taller" action="show" id="${claseInstance?.taller?.id}">${claseInstance?.taller?.encodeAsHTML()}</g:link></span>

                        </li>
                    </div>
                </g:if>

                <g:if test="${claseInstance?.persona}">
                    <div class="form-group">
                        <li class="fieldcontain">
                            <span id="persona-label" class="property-label"><g:message code="clase.persona.label" default="Profesor" /></span>

                            <span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${claseInstance?.persona?.id}">${claseInstance?.persona?.encodeAsHTML()}</g:link></span>

                        </li>
                    </div>
                </g:if>
                <g:if test="${claseInstance?.tipoProfesor}">
                    <div class="form-group">
                        <li class="fieldcontain">
                            <span id="tipoProfesor-label" class="property-label"><g:message code="clase.tipoProfesor.label" default="Tipo Profesor" /></span>

                            <span class="property-value" aria-labelledby="tipoProfesor-label"><g:fieldValue bean="${claseInstance}" field="tipoProfesor"/></span>

                        </li>
                    </div>
                </g:if>

                <g:if test="${claseInstance?.fechaInicio}">
                    <div class="form-group">
                        <li class="fieldcontain">
                            <span id="fechaInicio-label" class="property-label"><g:message code="clase.fechaInicio.label" default="Fecha Inicio" /></span>

                            <span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate date="${claseInstance?.fechaInicio}" /></span>

                        </li>
                    </div>
                </g:if>

                <g:if test="${claseInstance?.fechaFin}">
                    <div class="form-group">
                        <li class="fieldcontain">
                            <span id="fechaFin-label" class="property-label"><g:message code="clase.fechaFin.label" default="Fecha Fin" /></span>

                            <span class="property-value" aria-labelledby="fechaFin-label"><g:formatDate date="${claseInstance?.fechaFin}" /></span>

                        </li>
                    </div>
                </g:if>

                <g:if test="${claseInstance?.horario}">
                    <div class="form-group">
                        <li class="fieldcontain">
                            <span id="horario-label" class="property-label"><g:message code="clase.horario.label" default="Horario" /></span>

                            <span class="property-value" aria-labelledby="horario-label"><g:link controller="horario" action="show" id="${claseInstance?.horario?.id}">${claseInstance?.horario?.encodeAsHTML()}</g:link></span>

                        </li>
                    </div>
                </g:if>


                <g:if test="${claseInstance?.precio}">
                    <div class="form-group">
                        <li class="fieldcontain">
                            <span id="precio-label" class="property-label"><g:message code="clase.precio.label" default="Precio Inscripcion" /></span>

                            <span class="property-value" aria-labelledby="precio-label"><g:link controller="precio" action="show" id="${claseInstance?.precio?.id}">${claseInstance?.precio?.encodeAsHTML()}</g:link></span>

                        </li>
                    </div>
                </g:if>


                <g:if test="${claseInstance?.mensualidad}">
                    <div class="form-group">
                        <li class="fieldcontain">
                            <span id="mensualidad-label" class="property-label"><g:message code="clase.mensualidad.label" default="Precio Mensualidad" /></span>

                            <span class="property-value" aria-labelledby="mensualidad-label"><g:link controller="precio" action="show" id="${claseInstance?.mensualidad?.id}">${claseInstance?.mensualidad?.encodeAsHTML()}</g:link></span>

                        </li>
                    </div>
                </g:if>


                <g:if test="${claseInstance?.salon}">
                    <div class="form-group">
                        <li class="fieldcontain">
                            <span id="salon-label" class="property-label"><g:message code="clase.salon.label" default="Salon" /></span>

                            <span class="property-value" aria-labelledby="salon-label"><g:link controller="salon" action="show" id="${claseInstance?.salon?.id}">${claseInstance?.salon?.encodeAsHTML()}</g:link></span>

                        </li>
                    </div>
                </g:if>





              
            </form>
            
            
            <g:jasperReport jasper="prueba" format="PDF" name="Planilla de Asistencia" >
                <input type="hidden" name="claseid" value="${claseInstance?.id}" />
                <input type="hidden" name="imagesPath" value="web-app/reports/salias1.jpeg" />
            </g:jasperReport>
            
          
        </div>
    </body>
</html>
