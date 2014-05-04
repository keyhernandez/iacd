<%@ page import="salias.Descuento" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'descuento.label', default: 'Descuento')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-descuento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="edit-descuento" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>

            <g:form method="post" class="form-horizontal" role="form">
                <g:hiddenField name="id" value="${descuentoInstance?.id}" />
                <g:hiddenField name="version" value="${descuentoInstance?.version}" />
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-6">
                        <g:actionSubmit class="btn btn-default btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
