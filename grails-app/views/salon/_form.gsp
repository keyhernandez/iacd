<%@ page import="salias.Salon" %>



<div class="fieldcontain ${hasErrors(bean: salonInstance, field: 'horarios', 'error')} ">
	<label for="horarios">
		<g:message code="salon.horarios.label" default="Horarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${salonInstance?.horarios?}" var="h">
    <li><g:link controller="horario" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="horario" action="create" params="['salon.id': salonInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'horario.label', default: 'Horario')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: salonInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="salon.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${salonInstance?.nombre}"/>
</div>

