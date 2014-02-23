<script type="text/javascript">
    var childCount = ${formaPagoInstance?.tarjetas.size()} + 0;
 
    function addTarjeta(){
      var clone = $("#tarjeta_clone").clone()
      var htmlId = 'tarjetasList['+childCount+'].';
      var tarjetaInput = clone.find("input[id$=number]");
 
      clone.find("input[id$=id]")
             .attr('id',htmlId + 'id')
             .attr('name',htmlId + 'id');
      clone.find("input[id$=deleted]")
              .attr('id',htmlId + 'deleted')
              .attr('name',htmlId + 'deleted');
      clone.find("input[id$=new]")
              .attr('id',htmlId + 'new')
              .attr('name',htmlId + 'new')
              .attr('value', 'true');
      phoneInput.attr('id',htmlId + 'number')
              .attr('name',htmlId + 'number');
      clone.find("select[id$=type]")
              .attr('id',htmlId + 'type')
              .attr('name',htmlId + 'type');
 
      clone.attr('id', 'tarjeta'+childCount);
      $("#childList").append(clone);
      clone.show();
      tarjetaInput.focus();
      childCount++;
    }
 
    //bind click event on delete buttons using jquery live
    $('.del-phone').live('click', function() {
        //find the parent div
        var prnt = $(this).parents(".tarjeta-div");
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if(newValue == 'true'){
            prnt.remove();
        }else{
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }        
    });
 
</script>
 
<div id="childList">
    <g:each var="tarjetas" in="${formaPagoInstance.tarjetas}" status="i">
        <!-- Render the phone template (_phone.gsp) here -->
        <g:render template='tarjetas' model="['tarjetas':tarjeta,'i':i,'hidden':false]"/>
        <!-- Render the phone template (_phone.gsp) here -->
    </g:each>
</div>
<input type="button" value="Add tarjeta" onclick="addTarjeta();" />