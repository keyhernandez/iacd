package salias

class Factura {
Date fecha
String grupo
String concepto
String observaciones
Double monto
int descuento
String tipoPago
 static belongsTo = [persona:Persona,clase2:Clase]
    static constraints = {
        tipoPago(nullable:true)
    }
}
