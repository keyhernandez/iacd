package salias

class Factura {
Date fecha
String grupo
String concepto
String observaciones
Double monto
String tipoPago
 static belongsTo = [persona:Persona,clase2:Clase,descuento:Descuento]
    static constraints = {
        tipoPago(nullable:true)
    }
}
