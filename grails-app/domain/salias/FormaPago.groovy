package salias

class FormaPago {

    Date fecha
    Double monto
    Double efectivo
    int descuento
     static belongsTo = [factura:Factura]
    static constraints = {
    }
}
