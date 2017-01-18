package vedstat

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class User {

    transient springSecurityService

    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    Org org
    MunicArea area
    static constraints = {
        username blank: false, unique: true
        password blank: false
        org(nullable: true)
        area(nullable: true)
    }

    static mapping = {
        table 'users'
        password column: '`password`'
        area lazy: false
        org lazy: false
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUsers(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
    String toString(){
        username
    }
}
