<%@ page import="salias.Taller" %>



<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'categoria', 'error')} ">
	<label for="categoria">
		<g:message code="taller.categoria.label" default="Categoria" />
		
	</label>
	<g:textField name="categoria" value="${tallerInstance?.categoria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="taller.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tallerInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'facturas1', 'error')} ">
	<label for="facturas1">
		<g:message code="taller.facturas1.label" default="Facturas1" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tallerInstance?.facturas1?}" var="f">
    <li><g:link controller="factura" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="factura" action="create" params="['taller.id': tallerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'factura.label', default: 'Factura')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'horarios1', 'error')} ">
	<label for="horarios1">
		<g:message code="taller.horarios1.label" default="Horarios1" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tallerInstance?.horarios1?}" var="h">
    <li><g:link controller="horario" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="horario" action="create" params="['taller.id': tallerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'horario.label', default: 'Horario')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="taller.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${tallerInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="taller.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="precio" name="precio.id" from="${salias.Precio.list()}" optionKey="id" required="" value="${tallerInstance?.precio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'profesores', 'error')} ">
	<label for="profesores">
		<g:message code="taller.profesores.label" default="Profesores" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tallerInstance?.profesores?}" var="p">
    <li><g:link controller="tallerProfesor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tallerProfesor" action="create" params="['taller.id': tallerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tallerProfesor.label', default: 'TallerProfesor')])}</g:link>
</li>
</ul>

</div>

