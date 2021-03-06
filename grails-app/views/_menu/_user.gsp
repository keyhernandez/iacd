<%--<ul class="nav pull-right">--%>
<%@ page import="LosSalias.SecUser" %>
<%@ page import="salias.Persona" %>
<li class="dropdown">
	
<sec:ifNotLoggedIn>

		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
			<!-- TODO: integrate Springsource Security etc. and show User's name ... -->
    		<i class="icon-user"></i>
    		Login<b class="caret"></b>
		</a>

		<ul class="dropdown-menu" role="menu">
			<li class="form-container">
				<g:form controller="login" uri="/j_spring_security_check" method='POST' id='loginForm' class='cssform' autocomplete='off'>
<%--				<form action="login" method="post" accept-charset="UTF-8">--%>
					<input class="form-control" style="margin-bottom: 15px;" type="text"		placeholder="Usuario" id="username" name='j_username'>
					<input class="form-control" style="margin-bottom: 15px;" type="password"	placeholder="Password" id="password" name='j_password'>
					<input style="float: left; margin-right: 10px;" type="checkbox" name="remember-me" id="remember-me" value="1">
					
					<input class="btn btn-primary btn-block" type="submit" id="sign-in" value="Ingresar" id="submit" >
				</g:form>
			</li>
			<li class="divider"></li>
			<li class="button-container">
				<!-- NOTE: the renderDialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
				<g:render template="/_common/modals/registerTextLink"/>
			</li>
		</ul>

</sec:ifNotLoggedIn>
<sec:ifLoggedIn>

		<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">
			<!-- TODO: Only show menu items based on permissions (e.g., Guest has no account page) -->
			<i class="icon-user icon-white"></i>
			<sec:username /> 
			
		</a>
		<ul class="dropdown-menu" role="menu">
			<!-- TODO: Only show menu items based on permissions -->
			<li class=""><a href="${createLink(controller:'SecUser',action:'show',id:SecUser.findByUsername(sec.loggedInUserInfo(field:'username')).id)}">
				<i class="icon-user"></i>
				Perfil
			</a></li>
			<%--<li class=""><a href="${createLink(uri: '/')}">
				<i class="icon-cogs"></i>
				<g:message code="user.settings.change.label"/>
			</a></li>
			--%>
			<li class="divider"></li>
			<li class=""><a href="${createLink(controller:'logout',action:'index')}">
				<i class="icon-off"></i>
				<g:message code="security.signoff.label"/>
			</a></li>
		</ul>
<%----%>
</sec:ifLoggedIn>

	</li>
<%--</ul>--%>

<noscript>
<ul class="nav pull-right">
	<li class="">
		<g:link controller="user" action="show"><g:message code="default.user.unknown.label"/></g:link>
	</li>
</ul>
</noscript>
