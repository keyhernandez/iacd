package salias

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_EMPLEADO'])
class AsistenciaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [asistenciaInstanceList: Asistencia.list(params), asistenciaInstanceTotal: Asistencia.count()]
    }

    def create() {
        params.persona= Persona.get(params.foo)
        params.clase = Clase.get(params.bar)
        [asistenciaInstance: new Asistencia(params)]
    }

    def save() {
        def asistenciaInstance = new Asistencia(params)
        if (!asistenciaInstance.save(flush: true)) {
            render(view: "create", model: [asistenciaInstance: asistenciaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), asistenciaInstance.id])
        redirect(action: "show", id: asistenciaInstance.id)
    }

    def show(Long id) {
        def asistenciaInstance = Asistencia.get(id)
        if (!asistenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), id])
            redirect(action: "list")
            return
        }

        [asistenciaInstance: asistenciaInstance]
    }

    def edit(Long id) {
        def asistenciaInstance = Asistencia.get(id)
        if (!asistenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), id])
            redirect(action: "list")
            return
        }

        [asistenciaInstance: asistenciaInstance]
    }

    def update(Long id, Long version) {
        def asistenciaInstance = Asistencia.get(id)
        if (!asistenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (asistenciaInstance.version > version) {
                asistenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'asistencia.label', default: 'Asistencia')] as Object[],
                          "Another user has updated this Asistencia while you were editing")
                render(view: "edit", model: [asistenciaInstance: asistenciaInstance])
                return
            }
        }

        asistenciaInstance.properties = params

        if (!asistenciaInstance.save(flush: true)) {
            render(view: "edit", model: [asistenciaInstance: asistenciaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), asistenciaInstance.id])
        redirect(action: "show", id: asistenciaInstance.id)
    }

    def delete(Long id) {
        def asistenciaInstance = Asistencia.get(id)
        if (!asistenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), id])
            redirect(action: "list")
            return
        }

        try {
            asistenciaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), id])
            redirect(action: "show", id: id)
        }
    }
}
