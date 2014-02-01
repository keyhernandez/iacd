package salias

class Telefono {
    String codigo
    String numero
    
    static belongsTo = [persona: Persona]
    static constraints = {
    }
     String toString(){
        return "${codigo}"+"-"+"${numero}"
    }
}
