package salias

/**
 * Descuento
 * A domain class describes the data object and it's mapping to the database
 */
class Descuento {
    
    String nombre
    int porcentaje
    
    static	mapping = {
    }
    
	static	constraints = {
    }
    String toString(){
        return "${porcentaje}"+"% - "+"${nombre}"
    }
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
