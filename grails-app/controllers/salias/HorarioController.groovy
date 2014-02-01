package salias

import org.springframework.dao.DataIntegrityViolationException

class HorarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [horarioInstanceList: Horario.list(params), horarioInstanceTotal: Horario.count()]
    }

    def create() {
        [horarioInstance: new Horario(params)]
    }

    def save() {
        def horarioInstance = new Horario(params)
        if (!horarioInstance.save(flush: true)) {
            render(view: "create", model: [horarioInstance: horarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'horario.label', default: 'Horario'), horarioInstance.id])
        redirect(action: "show", id: horarioInstance.id)
    }

    def show(Long id) {
        def horarioInstance = Horario.get(id)
        if (!horarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horario.label', default: 'Horario'), id])
            redirect(action: "list")
            return
        }

        [horarioInstance: horarioInstance]
    }

    def edit(Long id) {
        def horarioInstance = Horario.get(id)
        if (!horarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horario.label', default: 'Horario'), id])
            redirect(action: "list")
            return
        }

        [horarioInstance: horarioInstance]
    }

    def update(Long id, Long version) {
        def horarioInstance = Horario.get(id)
        if (!horarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horario.label', default: 'Horario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (horarioInstance.version > version) {
                horarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'horario.label', default: 'Horario')] as Object[],
                          "Another user has updated this Horario while you were editing")
                render(view: "edit", model: [horarioInstance: horarioInstance])
                return
            }
        }

        horarioInstance.properties = params

        if (!horarioInstance.save(flush: true)) {
            render(view: "edit", model: [horarioInstance: horarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'horario.label', default: 'Horario'), horarioInstance.id])
        redirect(action: "show", id: horarioInstance.id)
    }

    def delete(Long id) {
        def horarioInstance = Horario.get(id)
        if (!horarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horario.label', default: 'Horario'), id])
            redirect(action: "list")
            return
        }

        try {
            horarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'horario.label', default: 'Horario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'horario.label', default: 'Horario'), id])
            redirect(action: "show", id: id)
        }
    }
}
