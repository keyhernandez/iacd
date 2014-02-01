package salias

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_EMPLEADO'])
class PrecioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [precioInstanceList: Precio.list(params), precioInstanceTotal: Precio.count()]
    }

    def create() {
        [precioInstance: new Precio(params)]
    }

    def save() {
        def precioInstance = new Precio(params)
        if (!precioInstance.save(flush: true)) {
            render(view: "create", model: [precioInstance: precioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'precio.label', default: 'Precio'), precioInstance.id])
        redirect(action: "show", id: precioInstance.id)
    }

    def show(Long id) {
        def precioInstance = Precio.get(id)
        if (!precioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'precio.label', default: 'Precio'), id])
            redirect(action: "list")
            return
        }

        [precioInstance: precioInstance]
    }

    def edit(Long id) {
        def precioInstance = Precio.get(id)
        if (!precioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'precio.label', default: 'Precio'), id])
            redirect(action: "list")
            return
        }

        [precioInstance: precioInstance]
    }

    def update(Long id, Long version) {
        def precioInstance = Precio.get(id)
        if (!precioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'precio.label', default: 'Precio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (precioInstance.version > version) {
                precioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'precio.label', default: 'Precio')] as Object[],
                          "Another user has updated this Precio while you were editing")
                render(view: "edit", model: [precioInstance: precioInstance])
                return
            }
        }

        precioInstance.properties = params

        if (!precioInstance.save(flush: true)) {
            render(view: "edit", model: [precioInstance: precioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'precio.label', default: 'Precio'), precioInstance.id])
        redirect(action: "show", id: precioInstance.id)
    }

    def delete(Long id) {
        def precioInstance = Precio.get(id)
        if (!precioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'precio.label', default: 'Precio'), id])
            redirect(action: "list")
            return
        }

        try {
            precioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'precio.label', default: 'Precio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'precio.label', default: 'Precio'), id])
            redirect(action: "show", id: id)
        }
    }
}
