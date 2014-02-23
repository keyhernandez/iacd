package salias

class Deposito {
String numero
Date fecha
Double monto
 static belongsTo = [factura:Factura]
    static constraints = {
    }
}
