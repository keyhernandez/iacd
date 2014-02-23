package salias

import org.springframework.dao.DataIntegrityViolationException

class TarjetaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tarjetaInstanceList: Tarjeta.list(params), tarjetaInstanceTotal: Tarjeta.count()]
    }

    def create() {
        [tarjetaInstance: new Tarjeta(params)]
    }

    def save() {
        def tarjetaInstance = new Tarjeta(params)
        if (!tarjetaInstance.save(flush: true)) {
            render(view: "create", model: [tarjetaInstance: tarjetaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tarjeta.label', default: 'Tarjeta'), tarjetaInstance.id])
        redirect(action: "show", id: tarjetaInstance.id)
    }

    def show(Long id) {
        def tarjetaInstance = Tarjeta.get(id)
        if (!tarjetaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarjeta.label', default: 'Tarjeta'), id])
            redirect(action: "list")
            return
        }

        [tarjetaInstance: tarjetaInstance]
    }

    def edit(Long id) {
        def tarjetaInstance = Tarjeta.get(id)
        if (!tarjetaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarjeta.label', default: 'Tarjeta'), id])
            redirect(action: "list")
            return
        }

        [tarjetaInstance: tarjetaInstance]
    }

    def update(Long id, Long version) {
        def tarjetaInstance = Tarjeta.get(id)
        if (!tarjetaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarjeta.label', default: 'Tarjeta'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tarjetaInstance.version > version) {
                tarjetaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tarjeta.label', default: 'Tarjeta')] as Object[],
                          "Another user has updated this Tarjeta while you were editing")
                render(view: "edit", model: [tarjetaInstance: tarjetaInstance])
                return
            }
        }

        tarjetaInstance.properties = params

        if (!tarjetaInstance.save(flush: true)) {
            render(view: "edit", model: [tarjetaInstance: tarjetaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tarjeta.label', default: 'Tarjeta'), tarjetaInstance.id])
        redirect(action: "show", id: tarjetaInstance.id)
    }

    def delete(Long id) {
        def tarjetaInstance = Tarjeta.get(id)
        if (!tarjetaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarjeta.label', default: 'Tarjeta'), id])
            redirect(action: "list")
            return
        }

        try {
            tarjetaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tarjeta.label', default: 'Tarjeta'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tarjeta.label', default: 'Tarjeta'), id])
            redirect(action: "show", id: id)
        }
    }
}
