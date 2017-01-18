package vedstat

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VerificationStatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VerificationStatus.list(params), model: [verificationStatusInstanceCount: VerificationStatus.count()]
    }

    def show(VerificationStatus verificationStatusInstance) {
        respond verificationStatusInstance
    }

    def create() {
        respond new VerificationStatus(params)
    }

    @Transactional
    def save(VerificationStatus verificationStatusInstance) {
        if (verificationStatusInstance == null) {
            notFound()
            return
        }

        if (verificationStatusInstance.hasErrors()) {
            respond verificationStatusInstance.errors, view: 'create'
            return
        }

        verificationStatusInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'verificationStatusInstance.label', default: 'VerificationStatus'), verificationStatusInstance.id])
                redirect verificationStatusInstance
            }
            '*' { respond verificationStatusInstance, [status: CREATED] }
        }
    }

    @Secured("ROLE_SUPER_ADMIN")
    def edit(VerificationStatus verificationStatusInstance) {
        respond verificationStatusInstance
    }

    @Transactional
    def update(VerificationStatus verificationStatusInstance) {
        if (verificationStatusInstance == null) {
            notFound()
            return
        }

        if (verificationStatusInstance.hasErrors()) {
            respond verificationStatusInstance.errors, view: 'edit'
            return
        }

        verificationStatusInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VerificationStatus.label', default: 'VerificationStatus'), verificationStatusInstance.id])
                redirect verificationStatusInstance
            }
            '*' { respond verificationStatusInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VerificationStatus verificationStatusInstance) {

        if (verificationStatusInstance == null) {
            notFound()
            return
        }

        verificationStatusInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VerificationStatus.label', default: 'VerificationStatus'), verificationStatusInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'verificationStatusInstance.label', default: 'VerificationStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
