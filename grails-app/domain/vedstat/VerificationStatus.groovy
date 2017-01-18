package vedstat

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_SUPER_ADMIN")
class VerificationStatus {

    String code
    String description
    static constraints = {
        code(nullable: false)
        description(nullable: false)
    }
    String toString(){
        description
    }
}
