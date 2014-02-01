package salias

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_EMPLEADO'])
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
}
