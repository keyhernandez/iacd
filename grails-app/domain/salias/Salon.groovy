package salias

class Salon {
String nombre
List horarios
 static hasMany = [classe:Clase]
    static constraints = {
    }
      static mapping = {
        addresses cascade: "all-delete-orphan"
    }
     String toString(){
        return "${nombre}"
    }
}
