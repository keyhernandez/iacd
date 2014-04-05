<g:form controller="persona" action="search" method="post" class="navbar-form navbar-left" >
	<div class="form-group fieldcontain text-center">
		<input name="q" type="text" class="form-control search-query" placeholder="${message(code: 'search.placeholder', default: 'Buscar persona ...')}" value="${query}">
	</div>
</g:form>
