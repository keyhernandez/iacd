<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="es" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--   <r:require module="bootstrap"/>-->
    <title><g:layoutTitle default="IACD"/></title>
 <!--   <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'logoLosSalias.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dojo/dojo.js" data-dojo-config="parseOnLoad: true"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'myScripts.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.js')}"></script>

  <g:javascript library="jquery"/>
  <r:require modules="bootstrap"/>
  <r:require modules="bootstrap_utils"/>

  <r:layoutResources />
  <g:layoutHead/>

</head>
<body>


<g:render template="/_menu/navbar"/>




<!-- Enable to overwrite Header by individual page -->
<g:if test="${ pageProperty(name:'page.header') }">
  <g:pageProperty name="page.header" />
</g:if>
<g:else>
  <g:render template="/layouts/header"/>														
</g:else>
<g:render template="/layouts/content"/>


<g:javascript library="application"/>

<r:layoutResources />
<g:render template="/layouts/footer"/>
</body>
</html>
