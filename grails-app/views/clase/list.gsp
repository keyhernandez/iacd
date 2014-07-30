
<%@ page import="salias.Clase" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'clase.label', default: 'Clase')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-clase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="list-clase" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:jasperReport jasper="reporte2" format="PDF" name="Estatus de Solvencia" >

                <input type="hidden" name="imagesPath" value="web-app/reports/salias1.jpeg" />
            </g:jasperReport>
            </br>
            <table>
                <thead>
                    <tr>

                        <g:sortableColumn property="taller" title="${message(code: 'clase.taller.label', default: 'Taller')}" />

                        <th><g:message code="clase.persona.label" default="Profesor" /></th>

                            <g:sortableColumn property="fechaInicio" title="${message(code: 'clase.fechaInicio.label', default: 'Fecha Inicio')}" />

                            <g:sortableColumn property="fechaFin" title="${message(code: 'clase.fechaFin.label', default: 'Fecha Fin')}" />



                        <th><g:message code="clase.horario.label" default="Horario" /></th>







                    </tr>
                </thead>
                <tbody>
                    <g:each in="${claseInstanceList}" status="i" var="claseInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${claseInstance.id}">${fieldValue(bean: claseInstance, field: "taller")}</g:link></td>	

                            <td>${fieldValue(bean: claseInstance, field: "persona")}</td>
                            <td><g:formatDate date="${claseInstance.fechaInicio}" /></td>

                            <td>${fieldValue(bean: claseInstance, field: "fechaFin")}</td>



                            <td>${fieldValue(bean: claseInstance, field: "horario")}</td>


                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${claseInstanceTotal}" />
            </div>


        </div>
    </body>
</html>
