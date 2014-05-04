package salias
import groovy.time.TimeCategory
import groovy.time.TimeDuration
import java.util.Calendar

class Persona {
    static searchable = true 
    String nombre
    String plantilla
    String sexo
    Date fechaNac
    String correo
    String tipoPersona
    String cedula
    List telefonos
    List asistencias
    List clases
    List facturas
    
    static hasMany = [telefonos: Telefono,asistencias:Asistencia,clases:Clase,facturas:Factura]
    static mapping = {
        telefonos cascade: "all-delete-orphan"
    }
    static constraints = {
        correo email: true
        plantilla nullable: false,unique: true
       
        cedula(matches:'\\d{1,8}',unique: true)
    }
    
    String toString(){
        return "${nombre}"
    }
    static profesores(){
        def profesor=Persona.findAllByTipoPersona("Profesor")
        return profesor
    }
    
    static talleresInscritos(alumnoId)
    {
        def persona = Persona.get(alumnoId)
        if (esAlumno(persona.id))
        return Factura.findAllByPersonaAndConcepto(persona,"Inscripción")
        else if (persona.esProfesor(persona.id)) {
            
            return Clase.findAllByPersona(persona)
        }
    }
    
    
    static pagosRealizados (claseId,alumnoId)
    {
        def clase=Clase.get(claseId)
        def alumno = Persona.get(alumnoId)
        return Factura.findAllByClase2AndConceptoAndPersona(clase,"Mensualidad",alumno)
    }
    
    static asistenciasPorTaller(claseId,alumnoId)
    {
             
        def clase=Clase.get(claseId)
        def alumno = Persona.get(alumnoId)
       
        return Asistencia.findAllByPersonaAndClase(alumno,clase)
    }
    
    //    static estaSolvente(claseId,alumnoId)
    //    {
    //        def clase=Clase.get(claseId)
    //        def alumno = Persona.get(alumnoId)
    //        def inscripcion = Factura.findByClase2AndConceptoAndPersona(clase,"Inscripción",alumno)
    //        
    //        def months
    //        
    //        if (new Date()>clase.fechaFin){
    //            //    println "termino el curso"
    //            def monthBetween = (clase.fechaFin[Calendar.MONTH] - inscripcion.fecha[Calendar.MONTH]) // + 1
    //            def yearsBetween = clase.fechaFin[Calendar.YEAR] - inscripcion.fecha[Calendar.YEAR]
    //            months = monthBetween + (yearsBetween * 12)
    //
    //            //   println "months 1 $months"
    //        }
    //        else
    //        {
    //            //  println "no ha terminado"
    //        
    //            
    //            def monthBetween = (new Date()[Calendar.MONTH] - inscripcion.fecha[Calendar.MONTH]) //+ 1
    //            def yearsBetween = new Date()[Calendar.YEAR] - inscripcion.fecha[Calendar.YEAR]
    //            months = monthBetween + (yearsBetween * 12)
    //            //  println "months 2 $months"
    //        }
    //        
    //        def pagos = pagosRealizados(claseId,alumnoId).size() + 1
    //       
    //        //   println "pagos $pagos"
    //        
    //        if (pagos>=months+1)
    //        return true
    //        else
    //        return false
    //    }
    
    static estaSolvente(claseId,alumnoId)
    {
        def clase=Clase.get(claseId)
        def alumno = Persona.get(alumnoId)
      
        def inscripcion = Factura.executeQuery(" select max(fecha)+'1 year' from Factura where concepto='Inscripción' and persona="+alumno.id+" and clase2="+clase.id)
        def mensualidad = Factura.executeQuery(" select max(fecha)+'1 month' from Factura where concepto='Mensualidad' and persona="+alumno.id+" and clase2="+clase.id)
 
        if(new Date()<=inscripcion[0]){
            if (new Date()<=mensualidad[0])
            return "ESTA SOLVENTE"
            else
            return "NO SOLVENTE MENSUALIDAD"
        }
        else
        return "NO SOLVENTE INSCRIPCION"
    }
    
    static esAlumno(personaId)
    {
        def persona = Persona.get(personaId)
        if (persona.tipoPersona=='Alumno')
        return true
        else
        return false
    }
    
    static esProfesor(personaId)
    {
        def persona = Persona.get(personaId)
        if (persona.tipoPersona=='Profesor')
        return true
        else
        return false
    }
    
    static esEmpleado(personaId)
    {
        def persona = Persona.get(personaId)
        if (persona.tipoPersona=='Empleado')
        return true
        else
        return false
    }
}
