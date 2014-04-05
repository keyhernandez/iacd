package salias

class Clase {
    Date fechaInicio
    Date fechaFin
    String tipoProfesor
    static hasMany = [asistencia:Asistencia,facturas:Factura]
    static belongsTo = [persona:Persona,horario:Horario,taller:Taller,salon:Salon,precio:Precio,mensualidad:Precio]
    static constraints = {
    }
    String toString(){
        return "${taller}"+" / "+"${horario}"+" / "+"${persona}"
    }
    
    static talleresDisponibles(fecha)
    {      
        def talleres = Clase.withCriteria(){
            gt 'fechaFin',fecha
        }    
        //  talleres= Clase.executeQuery("from Clase where fecha_fin >'"+fecha+"'")
        return talleres
    }
}
