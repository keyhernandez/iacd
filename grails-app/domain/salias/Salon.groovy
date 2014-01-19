package salias

class Salon {
String nombre
List horarios
 static hasMany = [horarios:Horario]
    static constraints = {
    }
      static mapping = {
        addresses cascade: "all-delete-orphan"
    }
}
