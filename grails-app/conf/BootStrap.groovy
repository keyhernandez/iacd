
import LosSalias.*
import salias.Persona

class BootStrap {

    
    
    def init = { servletContext ->

        /* If there are no Persons in the record. */

        if (!SecUser.count()) {

            createData()

        }

    }

    def destroy = {

    }

 

    private void createData() {

        def Role = new SecRole(authority: 'ROLE_ADMIN').save(flush:true)
         def Role1 = new SecRole(authority: 'ROLE_EMPLEADO').save(flush:true)
 def Role2 = new SecRole(authority: 'ROLE_RECEPCION').save(flush:true)

        /* The default password for all user. No need to encode here to avoid double encoding. */

        String password = 'adminiacd'
        
       
        
        def persona = new Persona(nombre:'admin',plantilla:'admin',fechaNac:new Date(),correo:'admin@admin.com',tipoPersona:'Empleado',cedula:'12345678').save(flush:true)
println persona
        def user = new SecUser(username: 'admin', password: password, enabled: true,person:persona).save(flush:true)

        def SecUserSecRole = new  SecUserSecRole(secUser:user,secRole:Role).save(flush:true)
    }

}


