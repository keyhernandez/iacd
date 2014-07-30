package salias

import org.springframework.dao.DataIntegrityViolationException
import org.compass.core.engine.SearchEngineQueryParseException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_EMPLEADO','ROLE_RECEPCION'])
class FacturaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def exportService

    def index() {
        redirect(action: "list", params: params)
    }
    

//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        [facturaInstanceList: Factura.list(params), facturaInstanceTotal: Factura.count()]
//    }

    
    def create() {
        def alumno = Persona.get(params.foo)
        def clase= Clase.get(params.bar)
        def factura = new Factura(params)
        factura.persona = alumno
        factura.clase2 = clase
        
        [facturaInstance: factura]
    }
    
    def inscripcionCreate() {
     
        def alumno = Persona.get(params.foo)
        def clase= Clase.get(params.bar)
        def factura = new Factura(params)
        factura.persona = alumno
        factura.clase2 = clase
        [facturaInstance: factura]
    }

    def inscripcionSave() {
     
        def facturaInstance = new Factura(params)
        facturaInstance.monto=facturaInstance.monto/10
        if (!facturaInstance.save(flush: true)) {
            render(view: "inscripcionCreate", model: [facturaInstance: facturaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
        redirect(action: "show", id: facturaInstance.id)
    }
    
    def save() {
        
        def facturaInstance = new Factura(params)
         facturaInstance.monto=facturaInstance.monto/10
        if (!facturaInstance.save(flush: true)) {
            render(view: "create", model: [facturaInstance: facturaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
        redirect(action: "show", id: facturaInstance.id)
    }

    def show(Long id) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        [facturaInstance: facturaInstance]
    }

    def edit(Long id) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        [facturaInstance: facturaInstance]
    }
    
    def transferencia() {
        def alumno = Persona.get(params.foo)
        def clase = Clase.get(params.bar)
        def idFac = Factura.executeQuery("select id from Factura where persona="+alumno.id+" and clase2="+clase.id+" and concepto='Inscripción' and fecha=(select max(fecha) from Factura where persona="+alumno.id+" and clase2="+clase.id+" and concepto='Inscripción')")
        def facturaInstance = Factura.get(idFac[0])
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        [facturaInstance: facturaInstance]
    }

    def update(Long id, Long version) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (facturaInstance.version > version) {
                facturaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'factura.label', default: 'Factura')] as Object[],
                          "Another user has updated this Factura while you were editing")
                render(view: "edit", model: [facturaInstance: facturaInstance])
                return
            }
        }

        facturaInstance.properties = params

        if (!facturaInstance.save(flush: true)) {
            render(view: "edit", model: [facturaInstance: facturaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
        redirect(action: "show", id: facturaInstance.id)
    }
    
    def update2(Long id, Long version) {
        println params
        def facturaInstance = Factura.get(id)
        def idclasOld=facturaInstance.clase2.id
        def idclasNew=params.clase2.id
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (facturaInstance.version > version) {
                facturaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'factura.label', default: 'Factura')] as Object[],
                          "Another user has updated this Factura while you were editing")
                render(view: "edit", model: [facturaInstance: facturaInstance])
                return
            }
        }

        facturaInstance.properties = params

        if (!facturaInstance.save(flush: true)) {
            render(view: "edit", model: [facturaInstance: facturaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
        redirect(action: "show", id: facturaInstance.id)
        
        def pers = Factura.get(params.id)
        def mensualidad = Factura.executeQuery(" select max(fecha)+'1 month' from Factura where concepto='Mensualidad' and persona="
            +pers.persona.id+" and clase2="+idclasOld)
        if (new Date()<=mensualidad[0]){
            def idFac=Factura.executeQuery(" select id from Factura where concepto='Mensualidad' and persona="
                +pers.persona.id+" and clase2="+idclasOld+" and fecha=(select max(fecha) from Factura where concepto='Mensualidad' and persona="
                +pers.persona.id+" and clase2="+idclasOld+")")
            def idFacMen= Factura.get(idFac[0])  
            print idclasNew  
            println params
            idFacMen.clase2=Clase.get(idclasNew)
            idFacMen.save(flush: true)
            
        }
    }

    def delete(Long id) {
        def facturaInstance = Factura.get(id)
        if (!facturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
            return
        }

        try {
            facturaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'factura.label', default: 'Factura'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def changeMonto = { 
        //        def d = (params.monto).tokenize('.')
        //        def descuento =Descuento.get((params.descuento).toInteger()).porcentaje
        //        def montoViejo=d[0].toInteger()
        //        def montoNuevo=montoViejo-(montoViejo*descuento/100)
        //        [montoNuevo:monto]
        //        print montoNuevo
        def b = Factura.get(params.id)
        b.monto = 500
        b.save()
    }
    
    def descuentoSelected = {
   
        def m=params.monto
        if (params.descuento!=''){
            def dcto =  Descuento.get(params.descuento)
            
            def des = dcto.porcentaje/100
          
            def total = m.toDouble() - (m.toDouble()*des.toDouble())
      
        render(text:"<input type='text' id='monto' name='monto' value='${total}' class='form-control' readonly='true'/>", contentType:'text/html')
        }
        else
       render(text:"<input type='text' id='monto' name='monto' value='${params.monto}' class='form-control' readonly='true'/>", contentType:'text/html')
    }
}
