package salias

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_EMPLEADO'])
class TallerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tallerInstanceList: Taller.list(params), tallerInstanceTotal: Taller.count()]
    }

    def create() {
        [tallerInstance: new Taller(params)]
    }

    def save() {
        def tallerInstance = new Taller(params)
        if (!tallerInstance.save(flush: true)) {
            render(view: "create", model: [tallerInstance: tallerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'taller.label', default: 'Taller'), tallerInstance.id])
        redirect(action: "show", id: tallerInstance.id)
    }

    def show(Long id) {
        def tallerInstance = Taller.get(id)
        if (!tallerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taller.label', default: 'Taller'), id])
            redirect(action: "list")
            return
        }

        [tallerInstance: tallerInstance]
    }

    def edit(Long id) {
        def tallerInstance = Taller.get(id)
        if (!tallerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taller.label', default: 'Taller'), id])
            redirect(action: "list")
            return
        }

        [tallerInstance: tallerInstance]
    }

    def update(Long id, Long version) {
        def tallerInstance = Taller.get(id)
        if (!tallerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taller.label', default: 'Taller'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tallerInstance.version > version) {
                tallerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'taller.label', default: 'Taller')] as Object[],
                          "Another user has updated this Taller while you were editing")
                render(view: "edit", model: [tallerInstance: tallerInstance])
                return
            }
        }

        tallerInstance.properties = params

        if (!tallerInstance.save(flush: true)) {
            render(view: "edit", model: [tallerInstance: tallerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'taller.label', default: 'Taller'), tallerInstance.id])
        redirect(action: "show", id: tallerInstance.id)
    }

    def delete(Long id) {
        def tallerInstance = Taller.get(id)
        if (!tallerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taller.label', default: 'Taller'), id])
            redirect(action: "list")
            return
        }

        try {
            tallerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'taller.label', default: 'Taller'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'taller.label', default: 'Taller'), id])
            redirect(action: "show", id: id)
        }
    }
}
