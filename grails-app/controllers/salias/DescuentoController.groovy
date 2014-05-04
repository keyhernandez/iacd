package salias

import org.springframework.dao.DataIntegrityViolationException

class DescuentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [descuentoInstanceList: Descuento.list(params), descuentoInstanceTotal: Descuento.count()]
    }

    def create() {
        [descuentoInstance: new Descuento(params)]
    }

    def save() {
        def descuentoInstance = new Descuento(params)
        if (!descuentoInstance.save(flush: true)) {
            render(view: "create", model: [descuentoInstance: descuentoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'descuento.label', default: 'Descuento'), descuentoInstance.id])
        redirect(action: "show", id: descuentoInstance.id)
    }

    def show(Long id) {
        def descuentoInstance = Descuento.get(id)
        if (!descuentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'descuento.label', default: 'Descuento'), id])
            redirect(action: "list")
            return
        }

        [descuentoInstance: descuentoInstance]
    }

    def edit(Long id) {
        def descuentoInstance = Descuento.get(id)
        if (!descuentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'descuento.label', default: 'Descuento'), id])
            redirect(action: "list")
            return
        }

        [descuentoInstance: descuentoInstance]
    }

    def update(Long id, Long version) {
        def descuentoInstance = Descuento.get(id)
        if (!descuentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'descuento.label', default: 'Descuento'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (descuentoInstance.version > version) {
                descuentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'descuento.label', default: 'Descuento')] as Object[],
                          "Another user has updated this Descuento while you were editing")
                render(view: "edit", model: [descuentoInstance: descuentoInstance])
                return
            }
        }

        descuentoInstance.properties = params

        if (!descuentoInstance.save(flush: true)) {
            render(view: "edit", model: [descuentoInstance: descuentoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'descuento.label', default: 'Descuento'), descuentoInstance.id])
        redirect(action: "show", id: descuentoInstance.id)
    }

    def delete(Long id) {
        def descuentoInstance = Descuento.get(id)
        if (!descuentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'descuento.label', default: 'Descuento'), id])
            redirect(action: "list")
            return
        }

        try {
            descuentoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'descuento.label', default: 'Descuento'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'descuento.label', default: 'Descuento'), id])
            redirect(action: "show", id: id)
        }
    }
}
