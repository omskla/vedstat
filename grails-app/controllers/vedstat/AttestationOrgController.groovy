package vedstat

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

class AttestationOrgController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        [attestationOrgInstanceList: AttestationOrg.list(params), attestationOrgInstanceTotal: AttestationOrg.count()]
    }

    @Secured("ROLE_ADMIN")
    def create() {
        [attestationOrgInstance: new AttestationOrg(params)]
    }

    def save() {
        def attestationOrgInstance = new AttestationOrg(params)
        if (!attestationOrgInstance.save(flush: true)) {
            render(view: "create", model: [attestationOrgInstance: attestationOrgInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'attestationOrg.label', default: 'AttestationOrg'), attestationOrgInstance.id])
        redirect(action: "show", id: attestationOrgInstance.id)
    }

    def show(Long id) {
        def attestationOrgInstance = AttestationOrg.get(id)
        if (!attestationOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attestationOrg.label', default: 'AttestationOrg'), id])
            redirect(action: "list")
            return
        }

        [attestationOrgInstance: attestationOrgInstance]
    }
    @Secured("ROLE_ADMIN")

    def edit(Long id) {
        def attestationOrgInstance = AttestationOrg.get(id)
        if (!attestationOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attestationOrg.label', default: 'AttestationOrg'), id])
            redirect(action: "list")
            return
        }

        [attestationOrgInstance: attestationOrgInstance]
    }
    @Secured("ROLE_ADMIN")

    def update(Long id, Long version) {
        def attestationOrgInstance = AttestationOrg.get(id)
        if (!attestationOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attestationOrg.label', default: 'AttestationOrg'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (attestationOrgInstance.version > version) {
                attestationOrgInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'attestationOrg.label', default: 'AttestationOrg')] as Object[],
                          "Another user has updated this AttestationOrg while you were editing")
                render(view: "edit", model: [attestationOrgInstance: attestationOrgInstance])
                return
            }
        }

        attestationOrgInstance.properties = params

        if (!attestationOrgInstance.save(flush: true)) {
            render(view: "edit", model: [attestationOrgInstance: attestationOrgInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'attestationOrg.label', default: 'AttestationOrg'), attestationOrgInstance.id])
        redirect(action: "show", id: attestationOrgInstance.id)
    }
    @Secured("ROLE_ADMIN")

    def delete(Long id) {
        def attestationOrgInstance = AttestationOrg.get(id)
        if (!attestationOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attestationOrg.label', default: 'AttestationOrg'), id])
            redirect(action: "list")
            return
        }

        try {
            attestationOrgInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'attestationOrg.label', default: 'AttestationOrg'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'attestationOrg.label', default: 'AttestationOrg'), id])
            redirect(action: "show", id: id)
        }
    }
}
