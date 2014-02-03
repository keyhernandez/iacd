package salias

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
}
