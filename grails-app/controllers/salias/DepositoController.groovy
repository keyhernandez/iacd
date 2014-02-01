package salias

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_EMPLEADO'])
class DepositoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [depositoInstanceList: Deposito.list(params), depositoInstanceTotal: Deposito.count()]
    }

    def create() {
        [depositoInstance: new Deposito(params)]
    }

    def save() {
        def depositoInstance = new Deposito(params)
        if (!depositoInstance.save(flush: true)) {
            render(view: "create", model: [depositoInstance: depositoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'deposito.label', default: 'Deposito'), depositoInstance.id])
        redirect(action: "show", id: depositoInstance.id)
    }

    def show(Long id) {
        def depositoInstance = Deposito.get(id)
        if (!depositoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deposito.label', default: 'Deposito'), id])
            redirect(action: "list")
            return
        }

        [depositoInstance: depositoInstance]
    }

    def edit(Long id) {
        def depositoInstance = Deposito.get(id)
        if (!depositoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deposito.label', default: 'Deposito'), id])
            redirect(action: "list")
            return
        }

        [depositoInstance: depositoInstance]
    }

    def update(Long id, Long version) {
        def depositoInstance = Deposito.get(id)
        if (!depositoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deposito.label', default: 'Deposito'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (depositoInstance.version > version) {
                depositoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'deposito.label', default: 'Deposito')] as Object[],
                          "Another user has updated this Deposito while you were editing")
                render(view: "edit", model: [depositoInstance: depositoInstance])
                return
            }
        }

        depositoInstance.properties = params

        if (!depositoInstance.save(flush: true)) {
            render(view: "edit", model: [depositoInstance: depositoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'deposito.label', default: 'Deposito'), depositoInstance.id])
        redirect(action: "show", id: depositoInstance.id)
    }

    def delete(Long id) {
        def depositoInstance = Deposito.get(id)
        if (!depositoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deposito.label', default: 'Deposito'), id])
            redirect(action: "list")
            return
        }

        try {
            depositoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'deposito.label', default: 'Deposito'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'deposito.label', default: 'Deposito'), id])
            redirect(action: "show", id: id)
        }
    }
}
