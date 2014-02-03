package salias

class Telefono {
    String codigo
    String numero
    
    static belongsTo = [persona: Persona]
    static constraints = {
        numero size: 7..7
        numero blank: false, nullable:false
        numero(matches: '\\d{7}')
    }
     String toString(){
        return "${codigo}"+"-"+"${numero}"
    }
}
