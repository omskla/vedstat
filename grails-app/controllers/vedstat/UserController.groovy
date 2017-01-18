package vedstat

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException
@Secured("ROLE_ADMIN")
class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {

        params.enabled = true
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)


         println(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }
//        Role userRole = Role.findByAuthority("ROLE_USER")
//        UserRole.create userInstance, userRole, true
        if(params.org && params.org!=null)
        {
            Role role = Role.findByAuthority("ROLE_ORG")
            UserRole.create userInstance, role, true
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }


        if(userInstance.org!=null)
        {
            Role role = Role.findByAuthority("ROLE_ORG")
            if(UserRole.findByRoleAndUsers(role,userInstance)==null)
                UserRole.create userInstance, role, true
        }else{
            Role role = Role.findByAuthority("ROLE_ORG")
            UserRole.remove userInstance, role, true
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        UserRole.findAllByUsers(userInstance).each {it->
            it.delete(flush: true)
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }


    def createAllUsers() {
        List<MunicArea> areas = MunicArea.list()
        HashMap<String,String> userMap = new HashMap()


        areas.each {it->
        Random random = new Random()
        int a = random.nextInt()
            String pasStr = "pass"+a.toString()

//            userMap.put("area"+it.code,"pass"+random.nextInt().toString())

            def userInstance = new User(username: "area"+it.code, password: pasStr,enabled: true,area: it)
            if (!userInstance.save(flush: true)) {
                render(view: "create", model: [userInstance: userInstance])
                return
            }
            println it.description+"   " +  "area"+it.code+ pasStr
        Role userRole = Role.findByAuthority("ROLE_USER")
        UserRole.create userInstance, userRole, true


        }

    }

    def createAllUsersNew() {
        List<Org> orgs = Org.findAllByGuidIsNotNull()
        orgs.each {it->
            String pasStr = String.valueOf(it.id*it.id-3434)
            def userInstance = new User(username: String.valueOf(it.id), password: pasStr,enabled: true, org: it)
            if (!userInstance.save(flush: true)) {
                render(view: "create", model: [userInstance: userInstance])
                return
            }
            Role userRole = Role.findByAuthority("ROLE_ORG")
            UserRole.create userInstance, userRole, true
        }

    }

}
