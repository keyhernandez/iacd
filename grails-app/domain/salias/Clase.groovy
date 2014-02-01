package salias

class Clase {
Date fechaInicio
Date fechaFin
String tipoProfesor
static hasMany = [asistencia:Asistencia]
 static belongsTo = [persona:Persona,horario:Horario,taller:Taller]
    static constraints = {
    }
}
