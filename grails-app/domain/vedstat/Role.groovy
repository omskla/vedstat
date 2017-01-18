package vedstat

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class Role {

    String authority

    static mapping = {
        cache true
    }

    static constraints = {
        authority blank: false, unique: true
    }
}
