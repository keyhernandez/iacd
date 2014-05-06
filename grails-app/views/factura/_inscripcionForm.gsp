<%@ page import="salias.Factura" %>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'persona', 'error')} required form-group">
    <label for="persona" class="col-lg-4 control-label">
        <g:message code="factura.persona.label" default="Alumno" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-6">
        <p id="persona" name="persona.id" class="form-control-static">${facturaInstance?.persona}</p>
        <g:hiddenField id="persona" name="persona.id" value="${facturaInstance?.persona?.id}" />
    </div>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'clase2', 'error')} required form-group">
    <label for="clase2" class="col-lg-4 control-label">
        <g:message code="factura.clase2.label" default="Clase" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-6">
        <p id="clase2" name="clase2.id" class="form-control-static">${facturaInstance?.clase2}</p>
        <g:hiddenField name="clase2.id" value="${facturaInstance?.clase2?.id}"/>        
    </div>
</div>

<g:hiddenField name="concepto" value="Inscripción"/>



<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'fecha', 'error')} required form-group">
    <label for="fecha" class="col-lg-4 control-label">
        <g:message code="factura.fecha.label" default="Fecha" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-4">
        <p  class="form-control-static" >${new Date().format('dd/MM/yyyy')}</p>
        <g:hiddenField id="fecha"  name="fecha"   value="${g.formatDate(value:new Date(), format:'dd/MM/yyyy')}"/> 
    </div>
</div>
<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'descuento', 'error')} required form-group">
    <label for="descuento" class="col-lg-4 control-label">
        <g:message code="factura.descuento.label" default="Descuento" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-4">
        
    <g:select onchange="${remoteFunction(controller:'factura', action:'descuentoSelected',update:'mont', params: '\'monto='+facturaInstance.clase2.precio+'&descuento=\'+ this.value' )}" id="descuento" name="descuento.id" from="${salias.Descuento.list()}" 
    optionKey="id" required="" value="${facturaInstance?.descuento?.id}" class="form-control" noSelection="${['':'Seleccione']}"/>
    </div>
</div>
<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'monto', 'error')} required form-group">
    <label for="monto" class="col-lg-4 control-label">
        <g:message code="factura.monto.label" default="Monto a Pagar" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-4">

        <div name="mont" id="mont" >
        <input type='text' id='monto' name='monto' value='${facturaInstance?.monto}' class='form-control' readonly='true'/>
        </div>
       
    </div>
</div>




<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'grupo', 'error')} form-group">
    <label for="grupo" class="col-lg-4 control-label">
        <g:message code="factura.grupo.label" default="Grupo" />

    </label>
    <div class="col-lg-4">
        <g:textField name="grupo" value="${facturaInstance?.grupo}" class="form-control"/>
    </div>
</div>



<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'tipoPago', 'error')} required form-group">
    <label for="tipoPago" class="col-lg-4 control-label">
        <g:message code="factura.tipoPago.label" default="Tipo Pago" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-4">

        <g:select name="tipoPago" from="${['Efectivo','Tarjeta','Depósito','Cheque']}" value="${facturaInstance?.tipoPago}" class="form-control"/>
    </div>
</div>


<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'observaciones', 'error')} form-group">
    <label for="observaciones" class="col-lg-4 control-label">
        <g:message code="factura.observaciones.label" default="Observaciones" />

    </label>
    <div class="col-lg-4">
        <g:textArea name="observaciones" value="${facturaInstance?.observaciones}" class="form-control"/>
    </div>
</div>
