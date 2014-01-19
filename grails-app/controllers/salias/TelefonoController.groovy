package salias

import org.springframework.dao.DataIntegrityViolationException

class TelefonoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [telefonoInstanceList: Telefono.list(params), telefonoInstanceTotal: Telefono.count()]
    }

    def create() {
        [telefonoInstance: new Telefono(params)]
    }

    def save() {
        def telefonoInstance = new Telefono(params)
        if (!telefonoInstance.save(flush: true)) {
            render(view: "create", model: [telefonoInstance: telefonoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'telefono.label', default: 'Telefono'), telefonoInstance.id])
        redirect(action: "show", id: telefonoInstance.id)
    }

    def show(Long id) {
        def telefonoInstance = Telefono.get(id)
        if (!telefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "list")
            return
        }

        [telefonoInstance: telefonoInstance]
    }

    def edit(Long id) {
        def telefonoInstance = Telefono.get(id)
        if (!telefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "list")
            return
        }

        [telefonoInstance: telefonoInstance]
    }

    def update(Long id, Long version) {
        def telefonoInstance = Telefono.get(id)
        if (!telefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (telefonoInstance.version > version) {
                telefonoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'telefono.label', default: 'Telefono')] as Object[],
                          "Another user has updated this Telefono while you were editing")
                render(view: "edit", model: [telefonoInstance: telefonoInstance])
                return
            }
        }

        telefonoInstance.properties = params

        if (!telefonoInstance.save(flush: true)) {
            render(view: "edit", model: [telefonoInstance: telefonoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'telefono.label', default: 'Telefono'), telefonoInstance.id])
        redirect(action: "show", id: telefonoInstance.id)
    }

    def delete(Long id) {
        def telefonoInstance = Telefono.get(id)
        if (!telefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "list")
            return
        }

        try {
            telefonoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "show", id: id)
        }
    }
}
