<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dojo/dojo.js" data-dojo-config="parseOnLoad: true"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'myScripts.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.js')}"></script>
  <g:layoutHead/>


  <r:layoutResources />
</head>
<body>
  <div id="grailsLogo" role="banner">
    <sec:ifNotLoggedIn>
      <section >
      <a id="buttonLogin" href="${createLink(controller:'login',action:'auth')}">Login</a>    
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>  
       <a id="buttonLogin" href="${createLink(controller:'logout',action:'index')}">Logout</a>
    </sec:ifLoggedIn>
    </section>
    <a href="${createLink(uri: '/')}"><img src="${resource(dir: 'images', file: 'banner.jpg')}" alt="Grails" width="1000" height="140"/></a>

  </div>
  <div id="buscador" >
    <g:form controller="persona" action="search" class="navbar-search pull-right">
      <g:textField name="q" value="" class="search-query" placeholder="Buscar Persona"/>
    </g:form>
  </div>
<g:layoutBody/>
<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

<g:javascript library="application"/>

<r:layoutResources />

</body>
</html>
