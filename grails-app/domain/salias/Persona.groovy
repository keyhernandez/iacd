package salias
import groovy.time.TimeCategory
import groovy.time.TimeDuration

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
    
    static estaSolvente(claseId,alumnoId)
    {
        def clase=Clase.get(claseId)
        def alumno = Persona.get(alumnoId)
        def facturas = Factura.findByClase2AndConceptoAndPersona(clase,"Mensualidad",alumno)
        def meses = TimeCategory.minus(clase.fechaInicio,clase.fechaFin)
       return meses.months
    }
}
