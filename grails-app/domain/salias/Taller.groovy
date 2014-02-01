package salias

class Taller {
String nombre
String categoria
String descripcion


  static hasMany = [clases:Clase]

    static constraints = {
    }
      static mapping = {
        clases cascade: "all-delete-orphan"
    }
    String toString()
    {
        return "${nombre}"
    }
}
