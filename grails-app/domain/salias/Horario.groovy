package salias

class Horario {
Date horaInicio
Date horaFin

List clases1
static hasMany = [ clases1:Clase]
 static belongsTo = [salon:Salon]
    static constraints = {
    }
    
      static mapping = {
        asistencias1 cascade: "all-delete-orphan"
        clases1 cascade: "all-delete-orphan"
    }
}
