package salias

import java.util.Formatter.DateTime
class Horario {
String horaInicio
String minutosInicio
String meridianoInicio
String horaFin
String minutosFin
String meridianoFin

List clases1
static hasMany = [ clases1:Clase]
 
    static constraints = {
    }
    
      static mapping = {
        asistencias1 cascade: "all-delete-orphan"
        clases1 cascade: "all-delete-orphan"
    }
    String toString()
    {
        return "${horaInicio}"+":"+"${minutosInicio}"+" "+"${meridianoInicio}"+" - "+"${horaFin}"+":"+"${minutosFin}"+" "+"${meridianoFin}"
    }
}
