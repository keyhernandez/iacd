<%@ page import="salias.Factura" %>




<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'clase2', 'error')} required">
	<label for="clase2">
		<g:message code="factura.clase2.label" default="Clase2" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="clase2" name="clase2.id" from="${salias.Clase.list()}" optionKey="id" required="" value="${facturaInstance?.clase2?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'concepto', 'error')} ">
	<label for="concepto">
		<g:message code="factura.concepto.label" default="Concepto" />
		
	</label>
	<g:textField name="concepto" value="${facturaInstance?.concepto}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'descuento', 'error')} required">
	<label for="descuento">
		<g:message code="factura.descuento.label" default="Descuento" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="descuento" type="number" value="${facturaInstance.descuento}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'efectivo', 'error')} required">
	<label for="efectivo">
		<g:message code="factura.efectivo.label" default="Efectivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="efectivo" value="${fieldValue(bean: facturaInstance, field: 'efectivo')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="factura.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${facturaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'grupo', 'error')} ">
	<label for="grupo">
		<g:message code="factura.grupo.label" default="Grupo" />
		
	</label>
	<g:textField name="grupo" value="${facturaInstance?.grupo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="factura.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: facturaInstance, field: 'monto')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="factura.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" value="${facturaInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="factura.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${salias.Persona.list()}" optionKey="id" required="" value="${facturaInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'tarjetas', 'error')} ">
	<label for="tarjetas">
		<g:message code="factura.tarjetas.label" default="Tarjetas" />
		
	</label>
	
<%-- ajax link to add new entries --%>
<input type="button" rel="nofollow" class="actionButton" href="javascript:void(0)" 
    onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'addTarjeta')}')" 
    value="${message(code: 'default.addNew.label', default:'+') }"/>
<g:each in="${facturaInstance?.tarjetas?}" var="a" status="i">
    <div>
     <%-- set the domain reference that it can be mapped by the controller --%>
     <g:set var="domainReference" value="tarjetas[${i}]."/>
     <%-- ajax link to remove entries --%>
     <label class="fieldcontain"><g:message code="tarjeta.label" default="Tarjeta" /></label>
     <input type="button" class="actionButton" 
             onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'removeTarjeta', params:[removeIx: i])}')" 
             value="${message(code: 'default.remove.label', default:'-') }"/>
     <g:hiddenField name="tarjetas[${i}].id" value="${a?.id}"/>
     <g:render template="/tarjeta/form" model="[tarjetaInstance: a]"/>
    </div>
</g:each>

<%-- to restore the state of the form after ajax post/response --%>
<g:hiddenField name="formId" value="${formId}"/>
<g:hiddenField name="elementToReplace" value="${elementToReplace}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'depositos', 'error')} ">
	<label for="depositos">
		<g:message code="factura.depositos.label" default="Depositos" />
		
	</label>
	
<%-- ajax link to add new entries --%>
<input type="button" rel="nofollow" class="actionButton" href="javascript:void(0)" 
    onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'addDeposito')}')" 
    value="${message(code: 'default.addNew.label', default:'+') }"/>
<g:each in="${facturaInstance?.depositos?}" var="a" status="i">
    <div>
     <%-- set the domain reference that it can be mapped by the controller --%>
     <g:set var="domainReference" value="depositos[${i}]."/>
     <%-- ajax link to remove entries --%>
     <label class="fieldcontain"><g:message code="deposito.label" default="Deposito" /></label>
     <input type="button" class="actionButton" 
             onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'removeDeposito', params:[removeIx: i])}')" 
             value="${message(code: 'default.remove.label', default:'-') }"/>
     <g:hiddenField name="depositos[${i}].id" value="${a?.id}"/>
     <g:render template="/deposito/form" model="[depositoInstance: a]"/>
    </div>
</g:each>

<%-- to restore the state of the form after ajax post/response --%>
<g:hiddenField name="formId" value="${formId}"/>
<g:hiddenField name="elementToReplace" value="${elementToReplace}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'cheques', 'error')} ">
	<label for="cheques">
		<g:message code="factura.cheques.label" default="Cheques" />
		
	</label>
	
<%-- ajax link to add new entries --%>
<input type="button" rel="nofollow" class="actionButton" href="javascript:void(0)" 
    onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'addCheque')}')" 
    value="${message(code: 'default.addNew.label', default:'+') }"/>
<g:each in="${facturaInstance?.cheques?}" var="a" status="i">
    <div>
     <%-- set the domain reference that it can be mapped by the controller --%>
     <g:set var="domainReference" value="cheques[${i}]."/>
     <%-- ajax link to remove entries --%>
     <label class="fieldcontain"><g:message code="cheque.label" default="Cheque" /></label>
     <input type="button" class="actionButton" 
             onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'removeCheque', params:[removeIx: i])}')" 
             value="${message(code: 'default.remove.label', default:'-') }"/>
     <g:hiddenField name="cheques[${i}].id" value="${a?.id}"/>
     <g:render template="/cheque/form" model="[chequeInstance: a]"/>
    </div>
</g:each>

<%-- to restore the state of the form after ajax post/response --%>
<g:hiddenField name="formId" value="${formId}"/>
<g:hiddenField name="elementToReplace" value="${elementToReplace}"/>

</div>
