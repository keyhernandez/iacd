<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
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
  <label for="tab-1">Pestaña 1</label>
  <!--Pestaña 2 inactiva por defecto-->
  <input id="tab-2" type="radio" name="tab-group" />
  <label for="tab-2">Pestaña 2</label>
  <!--Pestaña 3 inactiva por defecto-->
  <input id="tab-3" type="radio" name="tab-group" />
  <label for="tab-3">Pestaña 3</label>
  <input id="tab-3" type="radio" name="tab-group" />

  <!--Contenido a mostrar/ocultar-->
  <div id="content">
   <!--Contenido de la Pestaña 1-->
   <div id="content-1">
    <p class="left"><img src="http://ximg.es/160x120" alt="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum sit reprehenderit iusto harum minima. Assumenda, accusamus, perspiciatis inventore tempora qui pariatur quisquam? Deleniti, placeat ea nostrum officiis obcaecati temporibus quod. Ullam, in, adipisci autem at fugit ab tempore enim ratione nesciunt alias corporis vitae quo quod nostrum itaque vero iure?</p>
    <p class="left last"><img src="http://ximg.es/160x120" alt="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore, id blanditiis deserunt in molestiae excepturi incidunt molestias dolor sunt dolore obcaecati non repellat mollitia error placeat est exercitationem sit voluptates iure autem saepe voluptas harum unde perferendis modi provident labore voluptatum. Repudiandae, aspernatur sit harum quod vero quos sequi voluptas!</p>
   </div>
   <!--Contenido de la Pestaña 2-->
   <div id="content-2">
    <p class="column-left"><img src="http://ximg.es/200x150" alt="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, est, nisi enim voluptates dicta quibusdam recusandae eveniet provident non at nostrum nesciunt laudantium omnis aliquam debitis magni expedita cumque tempore.</p>
    <p class="column-right"><img src="http://ximg.es/200x150" alt="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed, molestiae, officia repellendus quasi cumque dolor eius deserunt possimus aliquid neque nam assumenda veniam soluta enim commodi aperiam reprehenderit quia incidunt.</p>
   
   </div>
   <!--Contenido de la Pestaña 3-->
   <div id="content-3">
 
			<h1>Welcome to Grails</h1>
			<p>Congratulations, you have successfully started your first Grails application! At the moment
			   this is the default page, feel free to modify it to either redirect to a controller or display whatever
			   content you may choose. Below is a list of controllers that are currently deployed in this application,
			   click on each to execute its default action:</p>

			
		
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
		
   </div>
   
  </div>
 </div>
   
	</body>
</html>
