package vedstat

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class GroupOkved {
    String name
    String description
    String code

    static constraints = {
        name(nullable: true)
        description(nullable: true)
        code(nullable: true)
    }

    String toString()
    {
        name
    }
}
