<!-- 
This menu is used to show function that can be triggered on the content (an object or list of objects).
-->

<g:if test="${	params.controller == 'persona'}">
    <ul id="Menu" class="nav nav-pills">

        <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
        <li class="controller"><g:link url="${createLink(uri: '/')}"><i class="icon-home"></i> Principal</g:link></li>

            <g:if test="${	params.action.contains('alumno')}">
            <li class="${ params.action.contains( "List") ? 'active' : '' }">
                <g:link action="alumnoList"><i class="icon-th-list"></i> Listado de Alumnos</g:link>
                </li>
                <li class="${ params.action.contains("Create") ? 'active' : '' }">
                <g:link action="alumnoCreate"><i class="icon-plus"></i> Registrar Alumno</g:link>
                </li>
            <g:if test="${ params.action.contains('Show') || params.action.contains("Edit")}">
             <!-- the item is an object (not a list) -->
                <li class="${ params.action.contains("Edit") ? 'active' : '' }">
                    <g:link action="alumnoEdit" id="${params.id}"><i class="icon-pencil"></i> Editar</g:link>
                    </li>
                    <li class="">
                    <g:render template="/_common/modals/deleteTextLink"/>
                </li>
            </g:if>
        </g:if> 


        <g:elseif test="${	params.action.contains('empleado')}">
            <li class="${ params.action.contains( "List") ? 'active' : '' }">
                <g:link action="empleadoList"><i class="icon-th-list"></i> Listado de Empleados</g:link>
                </li>
                <li class="${ params.action.contains("Create") ? 'active' : '' }">
                <g:link action="empleadoCreate"><i class="icon-plus"></i> Registrar Empleado</g:link>
                </li>
            <g:if test="${ params.action.contains('Show') || params.action.contains("Edit")}">
            <!-- the item is an object (not a list) -->
                <li class="${ params.action.contains("Edit") ? 'active' : '' }">
                    <g:link action="empleadoEdit" id="${params.id}"><i class="icon-pencil"></i> Editar</g:link>
                    </li>
                    <li class="">
                    <g:render template="/_common/modals/deleteTextLink"/>
                </li>
            </g:if>
        </g:elseif>


        <g:elseif test="${	params.action.contains('profesor')}">
            <li class="${ params.action.contains( "List") ? 'active' : '' }">
                <g:link action="profesorList"><i class="icon-th-list"></i> Listado de Profesores</g:link>
                </li>
                <li class="${ params.action.contains("Create") ? 'active' : '' }">
                <g:link action="profesorCreate"><i class="icon-plus"></i> Registrar Profesor</g:link>
                </li>
            <g:if test="${ params.action.contains('Show') || params.action.contains("Edit")}">
            <!-- the item is an object (not a list) -->
                <li class="${ params.action.contains("Edit") ? 'active' : '' }">
                    <g:link action="profesorEdit" id="${params.id}"><i class="icon-pencil"></i> Editar</g:link>
                    </li>
                    <li class="">
                    <g:render template="/_common/modals/deleteTextLink"/>
                </li>
            </g:if>
        </g:elseif>
    </ul>
</g:if>

<g:elseif test="${	params.controller == 'factura' || params.controller == 'index'  }">
    <ul id="Menu" class="nav nav-pills">

    <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
        <li class="controller"><g:link url="${createLink(uri: '/')}"><i class="icon-home"></i> Principal</g:link></li>
        </ul>
</g:elseif>




<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>

<g:elseif test="${	params.controller != null
&&	params.controller != ''
&&	params.controller != 'home'
&&    params.controller != 'login'
&&    params.controller != 'login'
}">
    <ul id="Menu" class="nav nav-pills">

        <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
        <li class="controller"><g:link url="${createLink(uri: '/')}"><i class="icon-home"></i> Principal</g:link></li>
        <li class="${ params.action == "list" ? 'active' : '' }">
            <g:link action="list"><i class="icon-th-list"></i> <g:message code="default.list.label" args="[entityName]"/></g:link>
            </li>
            <li class="${ params.action == "create" ? 'active' : '' }">
            <g:link action="create"><i class="icon-plus"></i> <g:message code="default.new.label"  args="[entityName]"/></g:link>
            </li>

        <g:if test="${ params.action == 'show' || params.action == 'edit' }">
          <!-- the item is an object (not a list) -->
            <li class="${ params.action == "edit" ? 'active' : '' }">
                <g:link action="edit" id="${params.id}"><i class="icon-pencil"></i> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
                </li>
                <li class="">
                <g:render template="/_common/modals/deleteTextLink"/>
            </li>
        </g:if>



    </ul>
</g:elseif>
