package salias

class Horario {
Date horaInicio
Date horaFin
List asistencias1
List clases
static hasMany = [asistencias1:Asistencia, clases1:Clase]
 static belongsTo = [salon:Salon,taller:Taller]
    static constraints = {
    }
    
      static mapping = {
        asistencias1 cascade: "all-delete-orphan"
        clases1 cascade: "all-delete-orphan"
    }
}
