<%@ page import="salias.Taller" %>



<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'categoria', 'error')} ">
	<label for="categoria">
		<g:message code="taller.categoria.label" default="Categoria" />
		
	</label>
	<g:textField name="categoria" value="${tallerInstance?.categoria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'clases', 'error')} ">
	<label for="clases">
		<g:message code="taller.clases.label" default="Clases" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tallerInstance?.clases?}" var="c">
    <li><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="clase" action="create" params="['taller.id': tallerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clase.label', default: 'Clase')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="taller.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tallerInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="taller.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${tallerInstance?.nombre}"/>
</div>

