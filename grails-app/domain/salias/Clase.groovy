package salias

class Clase {
Date fechaInicio
Date fechaFin
String tipoProfesor
 static belongsTo = [persona:Persona,horario:Horario]
    static constraints = {
    }
}
