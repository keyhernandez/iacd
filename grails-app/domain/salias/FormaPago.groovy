package salias

class FormaPago {

    Date fecha
    Double monto
    Double efectivo
    int descuento
    List tarjetas
    static hasMany = [tarjetas:Tarjeta,depositos:Deposito]
     static belongsTo = [factura:Factura]
    static constraints = {
    }
}
