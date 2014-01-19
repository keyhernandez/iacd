package salias

class Persona {
    static searchable = true 
    String nombre
    String plantilla
    String sexo
    Date fechaNac
    String correo
    boolean esEmpleado
    String cedula
    String password
    List telefonos
    List asistencias
    List clases
    List facturas
    
     static hasMany = [telefonos: Telefono,asistencias:Asistencia,clases:Clase,facturas:Factura]
      static mapping = {
        telefonos cascade: "all-delete-orphan"
    }
    static constraints = {
    }
}
