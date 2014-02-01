package LosSalias

import org.springframework.dao.DataIntegrityViolationException

class SecUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [secUserInstanceList: SecUser.list(params), secUserInstanceTotal: SecUser.count()]
    }

    def create() {
        [secUserInstance: new SecUser(params)]
    }

    def save() {
        def secUserInstance = new SecUser(params)
        if (!secUserInstance.save(flush: true)) {
            render(view: "create", model: [secUserInstance: secUserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'secUser.label', default: 'SecUser'), secUserInstance.id])
        redirect(action: "show", id: secUserInstance.id)
    }

    def show(Long id) {
        def secUserInstance = SecUser.get(id)
        if (!secUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
            redirect(action: "list")
            return
        }

        [secUserInstance: secUserInstance]
    }

    def edit(Long id) {
        def secUserInstance = SecUser.get(id)
        if (!secUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
            redirect(action: "list")
            return
        }

        [secUserInstance: secUserInstance]
    }

    def update(Long id, Long version) {
        def secUserInstance = SecUser.get(id)
        if (!secUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secUserInstance.version > version) {
                secUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'secUser.label', default: 'SecUser')] as Object[],
                          "Another user has updated this SecUser while you were editing")
                render(view: "edit", model: [secUserInstance: secUserInstance])
                return
            }
        }

        secUserInstance.properties = params

        if (!secUserInstance.save(flush: true)) {
            render(view: "edit", model: [secUserInstance: secUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secUser.label', default: 'SecUser'), secUserInstance.id])
        redirect(action: "show", id: secUserInstance.id)
    }

    def delete(Long id) {
        def secUserInstance = SecUser.get(id)
        if (!secUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
            redirect(action: "list")
            return
        }

        try {
            secUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
            redirect(action: "show", id: id)
        }
    }
}
