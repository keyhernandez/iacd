package salias

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_EMPLEADO'])
class SalonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [salonInstanceList: Salon.list(params), salonInstanceTotal: Salon.count()]
    }

    def create() {
        [salonInstance: new Salon(params)]
    }

    def save() {
        def salonInstance = new Salon(params)
        if (!salonInstance.save(flush: true)) {
            render(view: "create", model: [salonInstance: salonInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'salon.label', default: 'Salon'), salonInstance.id])
        redirect(action: "show", id: salonInstance.id)
    }

    def show(Long id) {
        def salonInstance = Salon.get(id)
        if (!salonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salon.label', default: 'Salon'), id])
            redirect(action: "list")
            return
        }

        [salonInstance: salonInstance]
    }

    def edit(Long id) {
        def salonInstance = Salon.get(id)
        if (!salonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salon.label', default: 'Salon'), id])
            redirect(action: "list")
            return
        }

        [salonInstance: salonInstance]
    }

    def update(Long id, Long version) {
        def salonInstance = Salon.get(id)
        if (!salonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salon.label', default: 'Salon'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (salonInstance.version > version) {
                salonInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'salon.label', default: 'Salon')] as Object[],
                          "Another user has updated this Salon while you were editing")
                render(view: "edit", model: [salonInstance: salonInstance])
                return
            }
        }

        salonInstance.properties = params

        if (!salonInstance.save(flush: true)) {
            render(view: "edit", model: [salonInstance: salonInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'salon.label', default: 'Salon'), salonInstance.id])
        redirect(action: "show", id: salonInstance.id)
    }

    def delete(Long id) {
        def salonInstance = Salon.get(id)
        if (!salonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salon.label', default: 'Salon'), id])
            redirect(action: "list")
            return
        }

        try {
            salonInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'salon.label', default: 'Salon'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'salon.label', default: 'Salon'), id])
            redirect(action: "show", id: id)
        }
    }
}
