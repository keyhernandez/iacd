package salias

class Clase {
Date fechaInicio
Date fechaFin
String tipoProfesor
static hasMany = [asistencia:Asistencia,facturas:Factura]
 static belongsTo = [persona:Persona,horario:Horario,taller:Taller,salon:Salon,precio:Precio]
    static constraints = {
    }
}
