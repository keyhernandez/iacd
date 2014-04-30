
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

            <table>
                <thead>
                    <tr>

                        <g:sortableColumn property="taller" title="${message(code: 'clase.taller.label', default: 'Taller')}" />

                        


                        

                        

                    </tr>
                </thead>
                <tbody>
                    <g:each in="${claseInstanceList}" status="i" var="claseInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link controller="factura" action="listByClass" id="${claseInstance.id}">${claseInstance}</g:link></td>	
                            
                              

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
