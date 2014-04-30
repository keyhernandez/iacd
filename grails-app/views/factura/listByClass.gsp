
<%@ page import="salias.Factura" %>
<%@ page import="salias.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-factura" class="content scaffold-list" role="main">
                    <g:form>   
                    
                        <g:hiddenField name="id" value="${claseInstance.id}"/>
                        <export:formats formats="['excel','pdf']" />
			</g:form>
                        <h3>${fieldValue(bean: facturaInstance, field: "clase2")}</h3>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="factura.clase2.label" default="Clase2" /></th>
					
						<g:sortableColumn property="persona" title="${message(code: 'factura.concepto.label', default: 'Alumno')}" />
					
						<th><g:message code="factura.clase2.label" default="Solvencia" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${facturaInstanceList}" status="i" var="facturaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${facturaInstance.id}">${fieldValue(bean: facturaInstance, field: "clase2")}</g:link></td>
					
						<td>${fieldValue(bean: facturaInstance, field: "persona")}</td>
					
						
                                                <td>${Persona.estaSolvente(facturaInstance.clase2.id,facturaInstance.persona.id)}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
                        
			<div class="pagination">
				<g:paginate total="${facturaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
