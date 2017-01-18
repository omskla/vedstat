package vedstat

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VerificationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured("ROLE_ADMIN")
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Verification.list(params), model: [verificationInstanceCount: Verification.count()]
    }

    def show(Verification verificationInstance) {
        respond verificationInstance
    }

    @Secured("ROLE_ADMIN")
    def create() {
        [verificationInstance: new Verification(params)]
//        respond new Verification(params)
    }

    @Transactional
    def save(Verification verificationInstance) {
        if (verificationInstance == null) {
            notFound()
            return
        }

        if (verificationInstance.hasErrors()) {
            respond verificationInstance.errors, view: 'create.gsp_'
            return
        }

        if (verificationInstance.isResolve == null)
            verificationInstance.isResolve = false
        verificationInstance.save flush: true

//        request.withFormat {
//            form {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'verificationInstance.label', default: 'Verification'), verificationInstance.id])
//                redirect verificationInstance
//            }
//            '*' { respond verificationInstance, [status: CREATED] }
//        }
        redirect(controller: "org", action: "show", id: verificationInstance.orgId)
    }

    @Secured("ROLE_ADMIN")
    def edit(Verification verificationInstance) {
        respond verificationInstance
    }

    @Secured("ROLE_ADMIN")
    @Transactional
    def update(Verification verificationInstance) {
        if (verificationInstance == null) {
            notFound()
            return
        }

        if (verificationInstance.hasErrors()) {
            respond verificationInstance.errors, view: 'edit.gsp_'
            return
        }

        verificationInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Verification.label', default: 'Verification'), verificationInstance.id])
                redirect verificationInstance
            }
            '*' { respond verificationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Verification verificationInstance) {

        if (verificationInstance == null) {
            notFound()
            return
        }

        verificationInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Verification.label', default: 'Verification'), verificationInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'verificationInstance.label', default: 'Verification'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
    def test(){
        long id = Long.valueOf(params.verId)
        Verification obj = Verification.get(id)
        boolean isRepair = !obj.isRepair
        obj.setIsRepair(isRepair)
        obj.save()
    }
}
