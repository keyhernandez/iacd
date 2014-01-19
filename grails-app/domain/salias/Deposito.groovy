package salias

class Deposito {
String numero
Date fecha
Double monto
 static belongsTo = [formaPago:FormaPago]
    static constraints = {
    }
}
