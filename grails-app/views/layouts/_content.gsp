<section id="Content" class="container">
	
  <div class="panel panel-default">

  <div class="panel-body">
    
	<!-- Secondary menu in one row (e.g., actions for current controller) -->
	<g:if test="${!layout_nosecondarymenu}">
		<g:render template="/_menu/submenubar"/>														
	</g:if>

	<!-- print system messages (infos, warnings, etc) - not validation errors -->
	<g:if test="${flash.message && !layout_noflashmessage}">
		<div class="alert alert-info">${flash.message}</div>
	</g:if>
 <g:layoutBody />
	<!-- Show page's content -->
	
	<g:pageProperty name="page.body" />
  </div>
</div>
  
     
</section>
