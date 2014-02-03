<%@ page import="salias.Factura" %>

<script type="text/javascript">

    function addChild() {

    var htmlId = "numero";      

        var deleteIcon = "${resource(dir:'images/skin', file:'icon_delete.png')}";      

        var templateHtml = "<div id='" + htmlId + "' name='" + htmlId + "'>\n";

    templateHtml += "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";

        templateHtml += "<input type='text' id='etiquetas[1]' name='numero[1]' />\n";

        templateHtml += "<span onClick='$(\"#" + htmlId + "\").remove();'><img src='" + deleteIcon + "' /></span>\n";

        templateHtml += "</div>\n";

    $("#childList").append(templateHtml);

    /*   var posicion= childCount;
    * 

    */   

    }
</script>

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

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'fecha', 'error')} required">
    <label for="fecha">
        <g:message code="factura.fecha.label" default="Fecha" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fecha" precision="day"  value="${facturaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'formaPago', 'error')} required">
    <label for="formaPago">
        <g:message code="factura.formaPago.label" default="Forma Pago" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="formaPago" name="formaPago.id" from="${salias.FormaPago.list()}" optionKey="id" required="" value="${facturaInstance?.formaPago?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'grupo', 'error')} ">
    <label for="grupo">
        <g:message code="factura.grupo.label" default="Grupo" />

    </label>
    <g:textField name="grupo" value="${facturaInstance?.grupo}"/>
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
    <div>
<input type="button" value="Añadir etiqueta"  />

    </div>

 <div id="childList">

    <g:each var="numero" in="${depositoInstance?.numero}" status="i">

        <g:render template='numero' model="['numero':numero,'i':i]"/>  <!-- //se supone que aki inserta?? -->

    </g:each>

</div>

