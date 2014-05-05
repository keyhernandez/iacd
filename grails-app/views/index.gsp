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
            .without-top {
            padding-top:30px;
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
        
 
  <h1>Bienvenido</h1>
  
       <center>
  <div class="row">
  <div class=" col-xs-3">
    <div class="thumbnail">
      <img src="${resource(dir: 'images', file: 'copa_aletas.jpg')}" alt="My Image" />
      <div class="caption">
        <h3>Alumnos</h3>
          <p><a href="${createLink(controller:'persona',action: 'alumnoCreate')}" class="btn btn-primary" role="button">Registrar</a> 
             <a href="${createLink(controller:'persona',action: 'alumnoList')}" class="btn btn-default" role="button">Consultar</a></p>
      
      </div>
    </div>
  </div>

  <div class="col-xs-3 span8 offset2">
    <div class="thumbnail">
      <img src="${resource(dir: 'images', file: 'salias3.jpg')}" alt="My Image" />
      <div class="caption">
        <h3>Profesores</h3>
        <p><a href="${createLink(controller:'persona',action: 'profesorCreate')}" class="btn btn-primary" role="button">Registrar</a> 
             <a href="${createLink(controller:'persona',action: 'profesorList')}" class="btn btn-default" role="button">Consultar</a></p>
      
      </div>
    </div>
  </div>

  <div class="col-xs-3">
    <div class="thumbnail">
      <img src="${resource(dir: 'images', file: 'salias2.jpg')}" alt="" />
      <div class="caption">
        <h3>Talleres</h3>
         <p><a href="${createLink(controller:'taller',action: 'create')}" class="btn btn-primary" role="button">Registrar</a> 
             <a href="${createLink(controller:'taller',action: 'list')}" class="btn btn-default" role="button">Consultar</a></p>
      
      </div>
    </div>
  </div>
  <div class="col-xs-3">
    <div class="thumbnail">
      <img src="${resource(dir: 'images', file: 'salias5.jpg')}" alt="" />
      <div class="caption">
        <h3>Clases</h3>
         <p><a href="${createLink(controller:'clase',action: 'create')}" class="btn btn-primary" role="button">Registrar</a> 
             <a href="${createLink(controller:'clase',action: 'list')}" class="btn btn-default" role="button">Consultar</a></p>
      </div>
    </div>
  </div>
</div>

</center>
    </body>
</html>
