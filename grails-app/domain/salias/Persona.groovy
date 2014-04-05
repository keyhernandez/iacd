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
        correo email: true, nullable: true
        plantilla nullable: false,unique: true
        nombre nullable: true
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
        def alumno = Persona.get(alumnoId)
        return Factura.findAllByPersonaAndConcepto(alumno,"Inscripción")
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
    
    static estaSolvente(claseId,alumnoId)
    {
        def clase=Clase.get(claseId)
        def alumno = Persona.get(alumnoId)
        def inscripcion = Factura.findByClase2AndConceptoAndPersona(clase,"Inscripción",alumno)
        
        def months
        
        if (new Date()>clase.fechaFin){
            //    println "termino el curso"
            def monthBetween = (clase.fechaFin[Calendar.MONTH] - inscripcion.fecha[Calendar.MONTH]) // + 1
            def yearsBetween = clase.fechaFin[Calendar.YEAR] - inscripcion.fecha[Calendar.YEAR]
            months = monthBetween + (yearsBetween * 12)

            //   println "months 1 $months"
        }
        else
        {
            //  println "no ha terminado"
        
            
            def monthBetween = (new Date()[Calendar.MONTH] - inscripcion.fecha[Calendar.MONTH]) //+ 1
            def yearsBetween = new Date()[Calendar.YEAR] - inscripcion.fecha[Calendar.YEAR]
            months = monthBetween + (yearsBetween * 12)
            //  println "months 2 $months"
        }
        
        def pagos = pagosRealizados(claseId,alumnoId).size() + 1
       
        //   println "pagos $pagos"
        
        if (pagos>=months)
        return true
        else
        return false
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
