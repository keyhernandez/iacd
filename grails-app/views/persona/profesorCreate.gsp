<%@ page import="salias.Persona" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="create-persona" class="content scaffold-create" role="main">
                <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personaInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${personaInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                </ul>
            </g:hasErrors>
            <%-- the form id to submit with the ajax link --%>
            <g:set value="createForm" var="formId"/>
            <%-- the element id to refresh the page wit the ajax response --%>
            <g:set value="elementToReplace" var="elementToReplace"/>
            <g:form action="save" name="${formId}">
                <fieldset class="form" id="${elementToReplace}">
                    <%@ page import="salias.Persona" %>



                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'asistencias', 'error')} ">
                        <label for="asistencias">
                            <g:message code="persona.asistencias.label" default="Asistencias" />

                        </label>

                        <ul class="one-to-many">
                            <g:each in="${personaInstance?.asistencias?}" var="a">
                                <li><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            <li class="add">
                                <g:link controller="asistencia" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asistencia.label', default: 'Asistencia')])}</g:link>
                                </li>
                            </ul>

                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'cedula', 'error')} ">
                        <label for="cedula">
                            <g:message code="persona.cedula.label" default="Cedula" />

                        </label>
                        <g:textField name="cedula" value="${personaInstance?.cedula}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'clases', 'error')} ">
                        <label for="clases">
                            <g:message code="persona.clases.label" default="Clases" />

                        </label>

                        <ul class="one-to-many">
                            <g:each in="${personaInstance?.clases?}" var="c">
                                <li><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            <li class="add">
                                <g:link controller="clase" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clase.label', default: 'Clase')])}</g:link>
                                </li>
                            </ul>

                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'correo', 'error')} ">
                        <label for="correo">
                            <g:message code="persona.correo.label" default="Correo" />

                        </label>
                        <g:textField name="correo" value="${personaInstance?.correo}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'tipoPersona', 'error')} ">
                        <label for="tipoPersona">
                            <g:message code="persona.tipoPersona.label" default="Tipo Persona" />

                        </label>
                        <g:textField name="tipoPersona" value="${personaInstance?.tipoPersona}" />
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'facturas', 'error')} ">
                        <label for="facturas">
                            <g:message code="persona.facturas.label" default="Facturas" />

                        </label>

                        <ul class="one-to-many">
                            <g:each in="${personaInstance?.facturas?}" var="f">
                                <li><g:link controller="factura" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            <li class="add">
                                <g:link controller="factura" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'factura.label', default: 'Factura')])}</g:link>
                                </li>
                            </ul>

                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'fechaNac', 'error')} required">
                        <label for="fechaNac">
                            <g:message code="persona.fechaNac.label" default="Fecha Nac" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:datePicker name="fechaNac" precision="day"  value="${personaInstance?.fechaNac}"  />
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} ">
                        <label for="nombre">
                            <g:message code="persona.nombre.label" default="Nombre" />

                        </label>
                        <g:textField name="nombre" value="${personaInstance?.nombre}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'password', 'error')} ">
                        <label for="password">
                            <g:message code="persona.password.label" default="Password" />

                        </label>
                        <g:textField name="password" value="${personaInstance?.password}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'plantilla', 'error')} ">
                        <label for="plantilla">
                            <g:message code="persona.plantilla.label" default="Plantilla" />

                        </label>
                        <g:textField name="plantilla" value="${personaInstance?.plantilla}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'sexo', 'error')} ">
                        <label for="sexo">
                            <g:message code="persona.sexo.label" default="Sexo" />

                        </label>
                        <g:textField name="sexo" value="${personaInstance?.sexo}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'telefonos', 'error')} ">
                        <label for="telefonos">
                            <g:message code="persona.telefonos.label" default="Telefonos" />

                        </label>

<%-- ajax link to add new entries --%>
                        <input type="button" rel="nofollow" class="actionButton" href="javascript:void(0)" 
                        onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'addTelefono')}')" 
                        value="${message(code: 'default.addNew.label', default:'+') }"/>
                        <g:each in="${personaInstance?.telefonos?}" var="a" status="i">
                            <div>
                             <%-- set the domain reference that it can be mapped by the controller --%>
                                <g:set var="domainReference" value="telefonos[${i}]."/>
                                <%-- ajax link to remove entries --%>
                                <label class="fieldcontain"><g:message code="telefono.label" default="Telefono" /></label>
                                <input type="button" class="actionButton" 
                                onclick="myScripts.ajaxPostReplace('${formId}', '${elementToReplace}', '${createLink(action: 'removeTelefono', params:[removeIx: i])}')" 
                                value="${message(code: 'default.remove.label', default:'-') }"/>
                                <g:hiddenField name="telefonos[${i}].id" value="${a?.id}"/>
                                <g:render template="/telefono/form" model="[telefonoInstance: a]"/>
                            </div>
                        </g:each>

<%-- to restore the state of the form after ajax post/response --%>
                        <g:hiddenField name="formId" value="${formId}"/>
                        <g:hiddenField name="elementToReplace" value="${elementToReplace}"/>

                    </div>


                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
