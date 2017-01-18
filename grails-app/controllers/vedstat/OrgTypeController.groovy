package vedstat

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

class OrgTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        [orgTypeInstanceList: OrgType.list(params), orgTypeInstanceTotal: OrgType.count()]
    }
    @Secured("ROLE_ADMIN")
    def create() {
        [orgTypeInstance: new OrgType(params)]
    }

    def save() {
        def orgTypeInstance = new OrgType(params)
        if (!orgTypeInstance.save(flush: true)) {
            render(view: "create", model: [orgTypeInstance: orgTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'orgType.label', default: 'OrgType'), orgTypeInstance.id])
        redirect(action: "show", id: orgTypeInstance.id)
    }

    def show(Long id) {
        def orgTypeInstance = OrgType.get(id)
        if (!orgTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgType.label', default: 'OrgType'), id])
            redirect(action: "list")
            return
        }

        [orgTypeInstance: orgTypeInstance]
    }
    @Secured("ROLE_ADMIN")
    def edit(Long id) {
        def orgTypeInstance = OrgType.get(id)
        if (!orgTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgType.label', default: 'OrgType'), id])
            redirect(action: "list")
            return
        }

        [orgTypeInstance: orgTypeInstance]
    }

    def update(Long id, Long version) {
        def orgTypeInstance = OrgType.get(id)
        if (!orgTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgType.label', default: 'OrgType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (orgTypeInstance.version > version) {
                orgTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'orgType.label', default: 'OrgType')] as Object[],
                          "Another user has updated this OrgType while you were editing")
                render(view: "edit", model: [orgTypeInstance: orgTypeInstance])
                return
            }
        }

        orgTypeInstance.properties = params

        if (!orgTypeInstance.save(flush: true)) {
            render(view: "edit", model: [orgTypeInstance: orgTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'orgType.label', default: 'OrgType'), orgTypeInstance.id])
        redirect(action: "show", id: orgTypeInstance.id)
    }
    @Secured("ROLE_ADMIN")
    def delete(Long id) {
        def orgTypeInstance = OrgType.get(id)
        if (!orgTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgType.label', default: 'OrgType'), id])
            redirect(action: "list")
            return
        }

        try {
            orgTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'orgType.label', default: 'OrgType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'orgType.label', default: 'OrgType'), id])
            redirect(action: "show", id: id)
        }
    }
}
