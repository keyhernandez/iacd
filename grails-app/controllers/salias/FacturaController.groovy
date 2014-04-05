package salias
import salias.Clase
import salias.Persona

import org.springframework.dao.DataIntegrityViolationException

class FacturaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [facturaInstanceList: Factura.list(params), facturaInstanceTotal: Factura.count()]
    }

    def create() {
             params.tarjetas = [new Tarjeta()]
             params.depositos = [new Deposito()]
             params.cheques = [new Cheque()]
        [facturaInstance: new Factura(params)]
    }

      def inscripcionCreate() {
             params.tarjetas = [new Tarjeta()]
             params.depositos = [new Deposito()]
             params.cheques = [new Cheque()]
             params.clase2 = Clase.get(params.bar)
             params.persona = Persona.get(params.foo)
            
        [facturaInstance: new Factura(params)]
    }
    def save() {
        def facturaInstance = new Factura(params)
        if (!facturaInstance.save(flush: true)) {
            render(view: "create", model: [facturaInstance: facturaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
        redirect(action: "show", id: facturaInstance.id)
    }

    def show(Long id) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        [facturaInstance: facturaInstance]
    }

    def edit(Long id) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        [facturaInstance: facturaInstance]
    }

    def update(Long id, Long version) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (facturaInstance.version > version) {
                facturaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'factura.label', default: 'Factura')] as Object[],
                          "Another user has updated this Factura while you were editing")
                render(view: "edit", model: [facturaInstance: facturaInstance])
                return
            }
        }

         // code change goes here
//        def removeList = elementsToRemoveFromList(params, "depositos", new Deposito(), formaPagoInstance.depositos)
//        formaPagoInstance.depositos.removeAll(removeList)
         def removeList1 = elementsToRemoveFromList(params, "tarjetas", new Tarjeta(), facturaInstance.tarjetas)
        facturaInstance.tarjetas.removeAll(removeList1)
//         def removeList2 = elementsToRemoveFromList(params, "cheques", new Cheque(), formaPagoInstance.cheques)
//        formaPagoInstance.cheques.removeAll(removeList2)
        // code change ends here
        facturaInstance.properties = params

        if (!facturaInstance.save(flush: true)) {
            render(view: "edit", model: [facturaInstance: facturaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
        redirect(action: "show", id: facturaInstance.id)
    }

    def delete(Long id) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        try {
            facturaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "show", id: id)
        }
    }
    
    
     def addTarjeta(){
        // add one address to the list of addresses
        def facturaInstance = new Factura(params)
        if (!facturaInstance.tarjetas)[
            facturaInstance.tarjetas = []
        ]
        facturaInstance.tarjetas << new Tarjeta()
        render template: "form" , model: [facturaInstance: facturaInstance, formId: params.formId, elementToReplace: params.elementToReplace]
    }
    
    def removeTarjeta(){
        // remove selected address from the list of addresses
        def facturaInstance = new Factura(params)
        def removeIx = params.removeIx
        List tarjetas = facturaInstance.tarjetas.toArray()
        def tarjeta = tarjetas.get(removeIx.toInteger())
        facturaInstance.tarjetas.remove(tarjeta)
        render template: "form" , model: [facturaInstance: facturaInstance, formId: params.formId, elementToReplace: params.elementToReplace]
    }
    
      def addCheque(){
        // add one address to the list of addresses
        println "ads"+params
        def facturaInstance = new Factura(params)
        if (!facturaInstance.cheques)[
            facturaInstance.cheques = []
        ]
        facturaInstance.cheques << new Cheque()
        render template: "form" , model: [facturaInstance: facturaInstance, formId2: params.formId2, elementToReplace2: params.elementToReplace2]
    }
    
    def removeCheque(){
        // remove selected address from the list of addresses
        def facturaInstance = new Factura(params)
        def removeIx = params.removeIx
        List cheques = facturaInstance.cheques.toArray()
        def cheque = cheques.get(removeIx.toInteger())
        facturaInstance.cheques.remove(cheque)
        render template: "form" , model: [facturaInstance: facturaInstance, formId2: params.formId2, elementToReplace2: params.elementToReplace2]
    }
    
      def addDeposito(){
        // add one address to the list of addresses
        
        def facturaInstance = new Factura(params)
        if (!facturaInstance.depositos)[
            facturaInstance.depositos = []
        ]
        facturaInstance.depositos << new Deposito()
        render template: "form" , model: [facturaInstance: facturaInstance, formId1: params.formId1, elementToReplace1: params.elementToReplace1]
    }
    
    def removeDeposito(){
        // remove selected address from the list of addresses
        def facturaInstance = new Factura(params)
        def removeIx = params.removeIx
        List depositos = facturaInstance.depositos.toArray()
        def deposito = depositos.get(removeIx.toInteger())
        facturaInstance.depositos.remove(deposito)
        render template: "form" , model: [facturaInstance: facturaInstance, formId1: params.formId1, elementToReplace1: params.elementToReplace1]
    }
    
    
    /**
     * Returns a list with elements which can be removed from the referencing entity
     * @param params - the params which include the post parameters
     * @param domainReference - the domain referenced which we named in the _form.gsp
     * @param instanceTemplate - the object to select the referenced objects
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
}
