package salias

class Asistencia {

    
    Date fecha
    static constraints = {
    }
     static belongsTo = [persona:Persona,horario:Horario]
}
