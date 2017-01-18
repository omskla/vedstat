import vedstat.Role
import vedstat.User
import vedstat.UserRole

class BootStrap {

    def init = { servletContext ->
//
//        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
//        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
//
//        def testUser = new User(username: 'd', enabled: true, password: 'd')
//        testUser.save(flush: true)
//
//        UserRole.create testUser, adminRole, true

//        assert User.count() == 2
//        assert Role.count() == 2
//        assert UserRole.count() == 1
    }
    def destroy = {
    }
}
//30a76625d5fc75e3ab6793b19819935e65e43cf3745832061cb432a5de7fdc17d66ede77973d5a