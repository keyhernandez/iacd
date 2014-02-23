package salias

class Tarjeta {
String tipo
Double monto
static belongsTo = [factura:Factura]
    static constraints = {
    }
}
