<%@ page import="salias.Precio" %>



<div class="fieldcontain ${hasErrors(bean: precioInstance, field: 'clasee', 'error')} ">
	<label for="clasee">
		<g:message code="precio.clasee.label" default="Clasee" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${precioInstance?.clasee?}" var="c">
    <li><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="clase" action="create" params="['precio.id': precioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clase.label', default: 'Clase')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: precioInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="precio.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: precioInstance, field: 'monto')}" required=""/>
</div>

