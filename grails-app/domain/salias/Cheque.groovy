package salias

class Cheque {

    String numero
    String banco
    Double monto
    
     static belongsTo = [formaPago:FormaPago]
    static constraints = {
    }
}
