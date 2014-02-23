package salias

class Factura {
Date fecha
String grupo
String concepto
String observaciones
Double monto
    Double efectivo
    int descuento
    List tarjetas
    List depositos
    List cheques
    static hasMany = [tarjetas:Tarjeta,depositos:Deposito,cheques:Cheque]
 static belongsTo = [persona:Persona,clase2:Clase]
    static constraints = {
    }
}
