package vedstat

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

class HeadOrgController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        params.sort = "descryption"
        params.order = "desc"
        [headOrgInstanceList: HeadOrg.list(params), headOrgInstanceTotal: HeadOrg.count()]
    }
    @Secured("ROLE_ADMIN")

    def create() {
        [headOrgInstance: new HeadOrg(params)]
    }
    @Secured("ROLE_ADMIN")

    def save() {
        def headOrgInstance = new HeadOrg(params)
        if (!headOrgInstance.save(flush: true)) {
            render(view: "create", model: [headOrgInstance: headOrgInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'headOrg.label', default: 'HeadOrg'), headOrgInstance.id])
        redirect(action: "show", id: headOrgInstance.id)
    }


    def show(Long id) {
        def headOrgInstance = HeadOrg.get(id)
        if (!headOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'headOrg.label', default: 'HeadOrg'), id])
            redirect(action: "list")
            return
        }

        [headOrgInstance: headOrgInstance]
    }
    @Secured("ROLE_ADMIN")

    def edit(Long id) {
        def headOrgInstance = HeadOrg.get(id)
        if (!headOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'headOrg.label', default: 'HeadOrg'), id])
            redirect(action: "list")
            return
        }

        [headOrgInstance: headOrgInstance]
    }
    @Secured("ROLE_ADMIN")
    def update(Long id, Long version) {
        def headOrgInstance = HeadOrg.get(id)
        if (!headOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'headOrg.label', default: 'HeadOrg'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (headOrgInstance.version > version) {
                headOrgInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'headOrg.label', default: 'HeadOrg')] as Object[],
                          "Another user has updated this HeadOrg while you were editing")
                render(view: "edit", model: [headOrgInstance: headOrgInstance])
                return
            }
        }

        headOrgInstance.properties = params

        if (!headOrgInstance.save(flush: true)) {
            render(view: "edit", model: [headOrgInstance: headOrgInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'headOrg.label', default: 'HeadOrg'), headOrgInstance.id])
        redirect(action: "show", id: headOrgInstance.id)
    }
    @Secured("ROLE_ADMIN")
    def delete(Long id) {
        def headOrgInstance = HeadOrg.get(id)
        if (!headOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'headOrg.label', default: 'HeadOrg'), id])
            redirect(action: "list")
            return
        }

        try {
            headOrgInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'headOrg.label', default: 'HeadOrg'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'headOrg.label', default: 'HeadOrg'), id])
            redirect(action: "show", id: id)
        }
    }
}
