package salias

import javax.servlet.ServletOutputStream
import org.springframework.dao.DataIntegrityViolationException

class ClaseController {

    def exportService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [claseInstanceList: Clase.list(params), claseInstanceTotal: Clase.count()]
    }

    def listToAsist(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        
       
        [claseInstanceList: Clase.list(params), claseInstanceTotal: Clase.count()]
    }
    def create() {
        [claseInstance: new Clase(params)]
    }

    def save() {
        def claseInstance = new Clase(params)
        if (!claseInstance.save(flush: true)) {
            render(view: "create", model: [claseInstance: claseInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'clase.label', default: 'Clase'), claseInstance.id])
        redirect(action: "show", id: claseInstance.id)
    }

    def show(Long id) {
    
        def claseInstance = Clase.get(id)
        
        if (!claseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clase.label', default: 'Clase'), id])
            redirect(action: "list")
            return
        }
        [claseInstance: claseInstance]
    }

    def edit(Long id) {
        def claseInstance = Clase.get(id)
        if (!claseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clase.label', default: 'Clase'), id])
            redirect(action: "list")
            return
        }

        [claseInstance: claseInstance]
    }

    def update(Long id, Long version) {
        def claseInstance = Clase.get(id)
        if (!claseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clase.label', default: 'Clase'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (claseInstance.version > version) {
                claseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'clase.label', default: 'Clase')] as Object[],
                          "Another user has updated this Clase while you were editing")
                render(view: "edit", model: [claseInstance: claseInstance])
                return
            }
        }

        claseInstance.properties = params

        if (!claseInstance.save(flush: true)) {
            render(view: "edit", model: [claseInstance: claseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'clase.label', default: 'Clase'), claseInstance.id])
        redirect(action: "show", id: claseInstance.id)
    }

    def delete(Long id) {
        def claseInstance = Clase.get(id)
        if (!claseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clase.label', default: 'Clase'), id])
            redirect(action: "list")
            return
        }

        try {
            claseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'clase.label', default: 'Clase'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'clase.label', default: 'Clase'), id])
            redirect(action: "show", id: id)
        }
    }
    
    
    def reporte={
        
    params.put("claseid", 12) 
        chain(controller: "jasper", action: "index", model: [data: Clase.list()], params:params)
    }

    
    
    def generatePdf = {
    try {
        //generate or retrieve your XML
        String xml = thisMethodShouldReturnXml()
     
        byte[] bytes = getJasperReport(xml, '/web-app/reports/prueba.jasper')
     
        //get the output stream from the common property 'response'
        ServletOutputStream servletOutputStream = response.outputStream
 
        //set the byte content on the response. This determines what is shown in your browser window.       
        response.setContentType('application/pdf')
        response.setContentLength(bytes.length)
     
        response.setHeader('Content-disposition', 'inline; filename=prueba.pdf')
        response.setHeader('Expires', '0');
        response.setHeader('Cache-Control', 'must-revalidate, post-check=0, pre-check=0');
        servletOutputStream << bytes
    }
    catch(Exception e) {
        //deal with your exception here
        e.printStackTrace()
        //redirect, etc
    }
}
    
    
}
