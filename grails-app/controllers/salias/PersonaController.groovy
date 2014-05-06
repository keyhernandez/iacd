package salias

import org.springframework.dao.DataIntegrityViolationException
import org.compass.core.engine.SearchEngineQueryParseException
import grails.converters.JSON
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_EMPLEADO','ROLE_RECEPCION'])
class PersonaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def searchableService
    static String WILDCARD = "*"
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [personaInstanceList: Persona.list(params), personaInstanceTotal: Persona.count()]
    }

    def create() {
        // default add one empty address
        params.telefonos = [new Telefono()]
        [personaInstance: new Persona(params)]
    }
    /**
     * Returns a list with elements which can be removed from the referencing entity
     * @param params - the params which include the post parameters
     * @param domainReference - the domain referenced which we named in the _form.gsp
     * @param instanceTemplate - the object to select the whole list
     * @param listToRemoveFrom - the list where the deleted/kept/new elements are in
     * @return
     */
    def List elementsToRemoveFromList(params, domainReference, instanceTemplate, listToRemoveFrom) {
        def listParamElement = params["${domainReference}[0]"]
        def removeList = new ArrayList(listToRemoveFrom)
        for (int i = 1; listParamElement != null; i++){
            log.debug "listParamElement: ${listParamElement}"
            def instanceElement = instanceTemplate.get(listParamElement.id);
            log.debug "instanceElement: ${instanceElement}"
            removeList.remove(instanceElement)
            listParamElement = params["${domainReference}[${i}]"]
        }
		
        return removeList
    }
    def save() {
        def personaInstance = new Persona(params)
        if (!personaInstance.save(flush: true)) {
            render(view: "create", model: [personaInstance: personaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
        redirect(action: "show", id: personaInstance.id)
    }

    def show(Long id) {
        /*   def personaInstance = Persona.get(id)
        if (!personaInstance) {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
        redirect(action: "list")
        return
        }

        [personaInstance: personaInstance]*/
        
        if (Persona.esAlumno(id))
        redirect (action:"alumnoShow",id:id)
        else if (Persona.esProfesor(id))
        redirect (action:"profesorShow",id:id)
        else if (Persona.esEmpleado(id))
        redirect (action:"empleadoShow",id:id)
    }
    
    def edit(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }

        [personaInstance: personaInstance]
    }

    def update() {
        def personaInstance = Persona.get(params.id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (personaInstance.version > version) {
                personaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'person.label', default: 'Person')] as Object[],
                          "Another user has updated this Person while you were editing")
                render(view: "edit", model: [personaInstance: personaInstance])
                return
            }
        } 

        // code change goes here
        def removeList = elementsToRemoveFromList(params, "telefonos", new Telefono(), personaInstance.telefonos)
        personaInstance.telefonos.removeAll(removeList)
        // code change ends here
        
        personaInstance.properties = params
        
        if (!personaInstance.save(flush: true)) {
            render(view: "edit", model: [personaInstance: personaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personaInstance.id])
        redirect(action: "show", id: personaInstance.id)
    }

    def delete(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }

        try {
            personaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "show", id: id)
        }
    }
    def search = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            String searchTerm = WILDCARD+ params.q + WILDCARD
           
            return [searchResult: searchableService.search(searchTerm, params)] //searchTerm, params
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }
    def indexAll = {
        Thread.start {
            searchableService.index()
        }
        render("bulk index started in a background thread")
    }
    
    def autocompleteSearch = { 
        def results = Persona.withCriteria { 
            ilike 'cedula', params.term + '%' 
        } 
        render results as JSON 
    } 
    
    //Funciones de Alumno
    def alumnoCreate() {
        // default add one empty address
        params.telefonos = [new Telefono()]
        [personaInstance: new Persona(params)]
    }
    
    def alumnoUpdate() {
        def personaInstance = Persona.get(params.id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "alumnoList")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (personaInstance.version > version) {
                personaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'person.label', default: 'Person')] as Object[],
                          "Another user has updated this Person while you were editing")
                render(view: "alumnoEdit", model: [personaInstance: personaInstance])
                return
            }
        } 

        // code change goes here
        def removeList = elementsToRemoveFromList(params, "telefonos", new Telefono(), personaInstance.telefonos)
        personaInstance.telefonos.removeAll(removeList)
        // code change ends here
        
        personaInstance.properties = params
        
        if (!personaInstance.save(flush: true)) {
            render(view: "alumnoEdit", model: [personaInstance: personaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personaInstance.id])
        redirect(action: "alumnoShow", id: personaInstance.id)
    }

    def alumnoShow(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "alumnoList")
            return
        }

        [personaInstance: personaInstance]
    }
    
    def alumnoList(Integer max) {
        def query = "from Persona as p where p.tipoPersona='Alumno'"
        def personas=Persona.findAll(query,[max:Math.min(max ?: 10, 100)])
        [personaInstanceList: personas, personaInstanceTotal: personas.size()]
    }
    
    def alumnoSave() {
        def personaInstance = new Persona(params)
        if (!personaInstance.save(flush: true)) {
            render(view: "alumnoCreate", model: [personaInstance: personaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
        redirect(action: "alumnoShow", id: personaInstance.id)
    }
    
    def alumnoEdit(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "alumnoList")
            return
        }

        [personaInstance: personaInstance]
    }
    
    def alumnoAddTelefono(){
        // add one address to the list of addresses
        def personaInstance = new Persona(params)
        if (!personaInstance.telefonos)[
            personaInstance.telefonos = []
        ]
        personaInstance.telefonos << new Telefono()
        render template: "alumnoForm" , model: [personaInstance: personaInstance, formId: params.formId, elementToReplace: params.elementToReplace]
    }
	
    def alumnoRemoveTelefono(){
        // remove selected address from the list of addresses
        def personaInstance = new Persona(params)
        def removeIx = params.removeIx
        List telefonos = personaInstance.telefonos.toArray()
        def telefono = telefonos.get(removeIx.toInteger())
        personaInstance.telefonos.remove(telefono)
        render template: "alumnoForm" , model: [personaInstance: personaInstance, formId: params.formId, elementToReplace: params.elementToReplace]
    }
    
    //Funciones de Empleado
    def empleadoCreate() {
        // default add one empty address
        params.telefonos = [new Telefono()]
        [personaInstance: new Persona(params)]
    }
    
    def empleadoUpdate() {
        def personaInstance = Persona.get(params.id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "empleadoList")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (personaInstance.version > version) {
                personaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'person.label', default: 'Person')] as Object[],
                          "Another user has updated this Person while you were editing")
                render(view: "empleadoEdit", model: [personaInstance: personaInstance])
                return
            }
        } 

        // code change goes here
        def removeList = elementsToRemoveFromList(params, "telefonos", new Telefono(), personaInstance.telefonos)
        personaInstance.telefonos.removeAll(removeList)
        // code change ends here
        
        personaInstance.properties = params
        
        if (!personaInstance.save(flush: true)) {
            render(view: "empleadoEdit", model: [personaInstance: personaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personaInstance.id])
        redirect(action: "empleadoShow", id: personaInstance.id)
    }

    def empleadoShow(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "empleadoList")
            return
        }

        [personaInstance: personaInstance]
    }
    
    def empleadoList(Integer max) {
        def query = "from Persona as p where p.tipoPersona='Empleado'"
        def personas=Persona.findAll(query,[max:Math.min(max ?: 10, 100)])
        [personaInstanceList: personas, personaInstanceTotal: personas.size()]
    }
    
    def empleadoSave() {
        def personaInstance = new Persona(params)
        if (!personaInstance.save(flush: true)) {
            render(view: "empleadoCreate", model: [personaInstance: personaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
        redirect(action: "empleadoShow", id: personaInstance.id)
    }
    
    def empleadoEdit(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "empleadoList")
            return
        }

        [personaInstance: personaInstance]
    }
    
    def empleadoAddTelefono(){
        // add one address to the list of addresses
        def personaInstance = new Persona(params)
        if (!personaInstance.telefonos)[
            personaInstance.telefonos = []
        ]
        personaInstance.telefonos << new Telefono()
        render template: "empleadoForm" , model: [personaInstance: personaInstance, formId: params.formId, elementToReplace: params.elementToReplace]
    }
	
    def empleadoRemoveTelefono(){
        // remove selected address from the list of addresses
        def personaInstance = new Persona(params)
        def removeIx = params.removeIx
        List telefonos = personaInstance.telefonos.toArray()
        def telefono = telefonos.get(removeIx.toInteger())
        personaInstance.telefonos.remove(telefono)
        render template: "empleadoForm" , model: [personaInstance: personaInstance, formId: params.formId, elementToReplace: params.elementToReplace]
    }
    
    //Funciones de profesor
    def profesorCreate() {
        // default add one empty address
        params.telefonos = [new Telefono()]
        [personaInstance: new Persona(params)]
    }
    
    def profesorUpdate() {
        def personaInstance = Persona.get(params.id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "profesorList")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (personaInstance.version > version) {
                personaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'person.label', default: 'Person')] as Object[],
                          "Another user has updated this Person while you were editing")
                render(view: "profesorEdit", model: [personaInstance: personaInstance])
                return
            }
        } 

        // code change goes here
        def removeList = elementsToRemoveFromList(params, "telefonos", new Telefono(), personaInstance.telefonos)
        personaInstance.telefonos.removeAll(removeList)
        // code change ends here
        
        personaInstance.properties = params
        
        if (!personaInstance.save(flush: true)) {
            render(view: "profesorEdit", model: [personaInstance: personaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personaInstance.id])
        redirect(action: "profesorShow", id: personaInstance.id)
    }

    def profesorShow(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "profesorList")
            return
        }

        [personaInstance: personaInstance]
    }
    
    def profesorList(Integer max) {
        def query = "from Persona as p where p.tipoPersona='Profesor'"
        def personas=Persona.findAll(query,[max:Math.min(max ?: 10, 100)])
        [personaInstanceList: personas, personaInstanceTotal: personas.size()]
    }
    
    def profesorSave() {
        def personaInstance = new Persona(params)
        if (!personaInstance.save(flush: true)) {
            render(view: "profesorCreate", model: [personaInstance: personaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
        redirect(action: "profesorShow", id: personaInstance.id)
    }
    
    def profesorEdit(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "profesorList")
            return
        }

        [personaInstance: personaInstance]
    }
    
    def profesorAddTelefono(){
        // add one address to the list of addresses
        def personaInstance = new Persona(params)
        if (!personaInstance.telefonos)[
            personaInstance.telefonos = []
        ]
        personaInstance.telefonos << new Telefono()
        render template: "profesorForm" , model: [personaInstance: personaInstance, formId: params.formId, elementToReplace: params.elementToReplace]
    }
	
    def profesorRemoveTelefono(){
        // remove selected address from the list of addresses
        def personaInstance = new Persona(params)
        def removeIx = params.removeIx
        List telefonos = personaInstance.telefonos.toArray()
        def telefono = telefonos.get(removeIx.toInteger())
        personaInstance.telefonos.remove(telefono)
        render template: "profesorForm" , model: [personaInstance: personaInstance, formId: params.formId, elementToReplace: params.elementToReplace]
    }
}
