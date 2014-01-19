package salias

import org.springframework.dao.DataIntegrityViolationException

class FormaPagoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [formaPagoInstanceList: FormaPago.list(params), formaPagoInstanceTotal: FormaPago.count()]
    }

    def create() {
        [formaPagoInstance: new FormaPago(params)]
    }

    def save() {
        def formaPagoInstance = new FormaPago(params)
        if (!formaPagoInstance.save(flush: true)) {
            render(view: "create", model: [formaPagoInstance: formaPagoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), formaPagoInstance.id])
        redirect(action: "show", id: formaPagoInstance.id)
    }

    def show(Long id) {
        def formaPagoInstance = FormaPago.get(id)
        if (!formaPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), id])
            redirect(action: "list")
            return
        }

        [formaPagoInstance: formaPagoInstance]
    }

    def edit(Long id) {
        def formaPagoInstance = FormaPago.get(id)
        if (!formaPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), id])
            redirect(action: "list")
            return
        }

        [formaPagoInstance: formaPagoInstance]
    }

    def update(Long id, Long version) {
        def formaPagoInstance = FormaPago.get(id)
        if (!formaPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (formaPagoInstance.version > version) {
                formaPagoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'formaPago.label', default: 'FormaPago')] as Object[],
                          "Another user has updated this FormaPago while you were editing")
                render(view: "edit", model: [formaPagoInstance: formaPagoInstance])
                return
            }
        }

        formaPagoInstance.properties = params

        if (!formaPagoInstance.save(flush: true)) {
            render(view: "edit", model: [formaPagoInstance: formaPagoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), formaPagoInstance.id])
        redirect(action: "show", id: formaPagoInstance.id)
    }

    def delete(Long id) {
        def formaPagoInstance = FormaPago.get(id)
        if (!formaPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), id])
            redirect(action: "list")
            return
        }

        try {
            formaPagoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), id])
            redirect(action: "show", id: id)
        }
    }
}
