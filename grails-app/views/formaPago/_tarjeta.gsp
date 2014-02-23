<div id="tarjeta${i}" class="tarjeta-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='tarjetasList[${i}].id' value='${tarjeta?.id}'/>
    <g:hiddenField name='tarjetasList[${i}].deleted' value='false'/>
    <g:hiddenField name='tarjetasList[${i}].new' value='false'/>
 
    <g:textField name='tarjetasList[${i}].monto' value='${tarjeta?.monto}' />
 
    <span class="del-tarjeta">
        <img src="${resource(dir:'images/skin', file:'icon_delete.png')}"
            style="vertical-align:middle;"/>
    </span>
</div>