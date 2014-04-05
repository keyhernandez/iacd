package salias

class Asistencia {

    
    Date fecha
    static constraints = {
    }
     static belongsTo = [persona:Persona,clase:Clase]
     
     String toString () {
         return String.format('%tA %<te %<tB %<tY', fecha)
     }
}
