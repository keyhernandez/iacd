<%@ page import="salias.Taller" %>



<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="taller.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${tallerInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'categoria', 'error')} ">
	<label for="categoria">
		<g:message code="taller.categoria.label" default="Categoría" />
		
	</label>
        <g:select name="categoria" from="${['Deporte', 'Cultura']}" value="${tallerInstance?.categoria}" />
</div>

<div class="fieldcontain ${hasErrors(bean: tallerInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="taller.descripcion.label" default="Descripción" />
		
	</label>
	<g:textArea name="descripcion" value="${tallerInstance?.descripcion}"/>
</div>


