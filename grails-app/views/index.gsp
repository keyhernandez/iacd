<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Complejo Cultural y Deportivo Los Salias</title>
    <style type="text/css" media="screen">
#status {
background-color: #eee;
border: .2em solid #fff;
margin: 2em 2em 1em;
padding: 1em;
width: 12em;
float: left;
-moz-box-shadow: 0px 0px 1.25em #ccc;
-webkit-box-shadow: 0px 0px 1.25em #ccc;
box-shadow: 0px 0px 1.25em #ccc;
-moz-border-radius: 0.6em;
-webkit-border-radius: 0.6em;
border-radius: 0.6em;
}

.ie6 #status {
display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
font-size: 0.9em;
list-style-type: none;
margin-bottom: 0.6em;
padding: 0;
}

#status li {
line-height: 1.3;
}

#status h1 {
text-transform: uppercase;
font-size: 1.1em;
margin: 0 0 0.3em;
}

#page-body {
margin: 2em 1em 1.25em 18em;
}

h2 {
margin-top: 1em;
margin-bottom: 0.3em;
font-size: 1em;
}

p {
line-height: 1.5;
margin: 0.25em 0;
}

#controller-list ul {
list-style-position: inside;
}

#controller-list li {
line-height: 1.3;
list-style-position: inside;
margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
#status {
display: none;
}

      #page-body {
        margin: 0 1em 1em;
      }

      #page-body h1 {
        margin-top: 0;
      }
      }
    </style>
  </head>
  <body>
    <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <!--<div id="status" role="complementary">
            <h1>Application Status</h1>
            <ul>
                    <li>App version: <g:meta name="app.version"/></li>
                    <li>Grails version: <g:meta name="app.grails.version"/></li>
                    <li>Groovy version: ${GroovySystem.getVersion()}</li>
                    <li>JVM version: ${System.getProperty('java.version')}</li>
                    <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
                    <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                    <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                    <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                    <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
            </ul>
            <h1>Installed Plugins</h1>
            <ul>
<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                            <li>${plugin.name} - ${plugin.version}</li>
</g:each>
            </ul>
    </div> -->





    <div id="container">
      <!--Pestaña 1 activa por defecto-->
      <input id="tab-1" type="radio" name="tab-group" checked="checked" />
      <label for="tab-1">Talleres</label>
      <!--Pestaña 2 inactiva por defecto-->
      <input id="tab-2" type="radio" name="tab-group" />
      <label for="tab-2">Alumnos </label>
      <!--Pestaña 3 inactiva por defecto-->
      <input id="tab-3" type="radio" name="tab-group" />
      <label for="tab-3">Profesores</label>
      <input id="tab-4" type="radio" name="tab-group" />
      <label for="tab-4">Empleado</label>
      <sec:ifAnyGranted roles="ROLE_ADMIN">
        <input id="tab-5" type="radio" name="tab-group" />
        <label for="tab-5">Administración</label>
      </sec:ifAnyGranted>
      <!--Contenido a mostrar/ocultar-->
      <div id="content">
        <!--Contenido de la Pestaña 1-->
        <div id="content-1">
          <g:render template="/index/talleres" />

        </div>
        <!--Contenido de la Pestaña 2-->
        <div id="content-2">
          <g:render template="/index/alumnos" />
        </div>
        <!--Contenido de la Pestaña 3-->
        <div id="content-3">
          <g:render template="/index/profesores" />

        </div>
        <div id="content-4">
          <g:render template="/index/empleado" />
          <p class="column-left"><img src="${resource(dir: 'images', file: 'salias.jpg')}" alt="">Lorem ipsisi enim voluptates dicta quibusdam recusandae eveniet provident non at nostrum nesciunt laudantium omnis aliquam debitis magni expedita cumque tempore.</p>
        </div>
        <!--Contenido de la Pestaña 3-->
        <sec:ifAnyGranted roles="ROLE_ADMIN">

          <div id="content-5">
            <g:render template="/index/administracion" />

          </div>
        </sec:ifAnyGranted>
      </div>
    </div>
  </body>
</html>
