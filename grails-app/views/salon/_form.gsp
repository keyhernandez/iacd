<%@ page import="salias.Salon" %>



<div class="fieldcontain ${hasErrors(bean: salonInstance, field: 'classe', 'error')} ">
	<label for="classe">
		<g:message code="salon.classe.label" default="Classe" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${salonInstance?.classe?}" var="c">
    <li><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="clase" action="create" params="['salon.id': salonInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clase.label', default: 'Clase')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: salonInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="salon.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${salonInstance?.nombre}"/>
</div>

