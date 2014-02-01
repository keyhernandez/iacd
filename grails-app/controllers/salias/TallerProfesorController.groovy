package salias

import org.springframework.dao.DataIntegrityViolationException

class TallerProfesorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tallerProfesorInstanceList: TallerProfesor.list(params), tallerProfesorInstanceTotal: TallerProfesor.count()]
    }

    def create() {
        [tallerProfesorInstance: new TallerProfesor(params)]
    }

    def save() {
        def tallerProfesorInstance = new TallerProfesor(params)
        if (!tallerProfesorInstance.save(flush: true)) {
            render(view: "create", model: [tallerProfesorInstance: tallerProfesorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tallerProfesor.label', default: 'TallerProfesor'), tallerProfesorInstance.id])
        redirect(action: "show", id: tallerProfesorInstance.id)
    }

    def show(Long id) {
        def tallerProfesorInstance = TallerProfesor.get(id)
        if (!tallerProfesorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tallerProfesor.label', default: 'TallerProfesor'), id])
            redirect(action: "list")
            return
        }

        [tallerProfesorInstance: tallerProfesorInstance]
    }

    def edit(Long id) {
        def tallerProfesorInstance = TallerProfesor.get(id)
        if (!tallerProfesorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tallerProfesor.label', default: 'TallerProfesor'), id])
            redirect(action: "list")
            return
        }

        [tallerProfesorInstance: tallerProfesorInstance]
    }

    def update(Long id, Long version) {
        def tallerProfesorInstance = TallerProfesor.get(id)
        if (!tallerProfesorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tallerProfesor.label', default: 'TallerProfesor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tallerProfesorInstance.version > version) {
                tallerProfesorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tallerProfesor.label', default: 'TallerProfesor')] as Object[],
                          "Another user has updated this TallerProfesor while you were editing")
                render(view: "edit", model: [tallerProfesorInstance: tallerProfesorInstance])
                return
            }
        }

        tallerProfesorInstance.properties = params

        if (!tallerProfesorInstance.save(flush: true)) {
            render(view: "edit", model: [tallerProfesorInstance: tallerProfesorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tallerProfesor.label', default: 'TallerProfesor'), tallerProfesorInstance.id])
        redirect(action: "show", id: tallerProfesorInstance.id)
    }

    def delete(Long id) {
        def tallerProfesorInstance = TallerProfesor.get(id)
        if (!tallerProfesorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tallerProfesor.label', default: 'TallerProfesor'), id])
            redirect(action: "list")
            return
        }

        try {
            tallerProfesorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tallerProfesor.label', default: 'TallerProfesor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tallerProfesor.label', default: 'TallerProfesor'), id])
            redirect(action: "show", id: id)
        }
    }
}
