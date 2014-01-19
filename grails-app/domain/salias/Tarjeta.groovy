package salias

class Tarjeta {
String tipo
Double monto
static belongsTo = [formaPago:FormaPago]
    static constraints = {
    }
}
