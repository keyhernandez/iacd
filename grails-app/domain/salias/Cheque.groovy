package salias

class Cheque {

    String numero
    String banco
    Double monto
    
     static belongsTo = [factura:Factura]
    static constraints = {
    }
}
