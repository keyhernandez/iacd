import LosSalias.*
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

 

        /* The default password for all user. No need to encode here to avoid double encoding. */

        String password = 'admin'

        def user = new SecUser(username: 'admin', password: password, enabled: true).save(flush:true)

        def SecUserSecRole = new  SecUserSecRole(secUser:user,secRole:Role).save(flush:true)
    }

}


