package salias

class Factura {
Date fecha
String grupo
String concepto
String observaciones
static hasOne = [formaPago:FormaPago]
 static belongsTo = [persona:Persona,taller:Taller]
    static constraints = {
    }
}
