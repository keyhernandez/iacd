package salias

class Taller {
String nombre
String categoria
String descripcion
List facturas1
List horarios1
  static hasMany = [facturas1:Factura,horarios1:Horario,profesores:TallerProfesor]
  static hasOne = [precio:Precio]
    static constraints = {
    }
      static mapping = {
        facturas1 cascade: "all-delete-orphan"
        horarios1 cascade: "all-delete-orphan"
    }
     String toString(){
        return "${nombre}"
    }
}
