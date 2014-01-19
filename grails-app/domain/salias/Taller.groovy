package salias

class Taller {
String nombre
String categoria
String descripcion
List facturas1
List horarios1
  static hasMany = [facturas1:Factura,horarios1:Horario]
    static constraints = {
    }
      static mapping = {
        facturas1 cascade: "all-delete-orphan"
        horarios1 cascade: "all-delete-orphan"
    }
}
