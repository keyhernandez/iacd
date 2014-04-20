<nav id="Navbar" class="navbar navbar-fixed-top navbar-inverse" role="navigation">
  <div class="container">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>

      <a class="navbar-brand" href="${createLink(uri: '/')}">
        <img class="logo" src="${resource(plugin: 'kickstart-with-bootstrap', dir:'kickstart/img', file:'logoLosSalias.png')}" alt="${meta(name:'app.name')}" width="24px" height="24px"/> 
        Los Salias
        <small> </small>
      </a>
    </div>

    <div class="collapse navbar-collapse navbar-ex1-collapse" role="navigation">

      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <span class="glyphicon glyphicon-cog"> </span>  Administrar <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li class="">
              
            <g:link controller="taller"><i class="icon-th-list"></i> Talleres</g:link>
          </li>
            <li class="controller"><g:link controller="salon"><span class="glyphicon glyphicon-map-marker"></span> Salones</g:link></li>
          <li class="controller"><g:link controller="precio"><span class="glyphicon glyphicon-usd"></span> Precios</g:link></li>
            <li class="controller"><g:link controller="horario"><span class="glyphicon glyphicon-dashboard"></span> Horarios</g:link></li>
            <li class="controller"><g:link controller="clase"><span class="glyphicon glyphicon-list-alt"></span> Clases</g:link></li>
      <%--  <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
          <li class="controller">
          <g:link controller="${c.logicalPropertyName}">
            <g:if test="${c.fullName.contains('HomeController')}">
              <i class="icon-home"></i>
            </g:if>
            <g:elseif test="${c.fullName.contains('DemoPageController')}">
              <i class="icon-beaker"></i>
            </g:elseif>
            <g:elseif test="${c.fullName.contains('DbdocController')}">
              <i class="icon-sitemap"></i>
            </g:elseif>

          </g:link>
          </li>
        </g:each>--%>
      </ul>
      </li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <g:render template="/_menu/search"/> 
        <g:render template="/_menu/admin"/>														
        <g:render template="/_menu/info"/>														
        <g:render template="/_menu/user"/><!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
        <g:render template="/_menu/language"/>														
      </ul>			

    </div>
  </div>
</nav>
