package vedstat

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Ot3DataController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def auth = springSecurityService.principal
        def user = User.get(auth.id)
        def area = user.area
        params.max = Math.min(max ?: 10, 100)
        respond Ot3Data.findAllByArea(area), model: [ot3DataInstanceCount: Ot3Data.count()], params:params
    }

    def show(Ot3Data ot3DataInstance) {
        def auth = springSecurityService.principal
        def user = User.get(auth.id)
        def area = user.area
        if (!ot3DataInstance.area.equals(area))
            respond ot3DataInstance
        else
            redirect(action: index())
    }

    def create() {
        def auth = springSecurityService.principal
        def user = User.get(auth?.id)
        def area = user?.area
        if (area ==null)
            redirect(controller: "org", action: "list")

        params.area = area
        respond new Ot3Data(params)
    }

    @Transactional
    def save(Ot3Data ot3DataInstance) {
        if (ot3DataInstance == null) {
            notFound()
            return
        }

        if (ot3DataInstance.hasErrors()) {
            respond ot3DataInstance.errors, view: 'create'
            return
        }

        ot3DataInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ot3DataInstance.label', default: 'Ot3Data'), ot3DataInstance.id])
                redirect ot3DataInstance
            }
            '*' { respond ot3DataInstance, [status: CREATED] }
        }
    }

    def edit(Ot3Data ot3DataInstance) {
        def auth = springSecurityService.principal
        def user = User.get(auth.id)
        def area = user.area
        if (!ot3DataInstance.area.equals(area))
            respond ot3DataInstance
        else
            redirect(action: index())
    }

    @Transactional
    def update(Ot3Data ot3DataInstance) {
        if (ot3DataInstance == null) {
            notFound()
            return
        }

        if (ot3DataInstance.hasErrors()) {
            respond ot3DataInstance.errors, view: 'edit'
            return
        }

        ot3DataInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ot3Data.label', default: 'Ot3Data'), ot3DataInstance.id])
                redirect ot3DataInstance
            }
            '*' { respond ot3DataInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured("ROLE_ADMIN")
    def delete(Ot3Data ot3DataInstance) {

        if (ot3DataInstance == null) {
            notFound()
            return
        }

        ot3DataInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Ot3Data.label', default: 'Ot3Data'), ot3DataInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ot3DataInstance.label', default: 'Ot3Data'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
