package vedstat

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

class GroupOkvedController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 25, 100)
        [groupOkvedInstanceList: GroupOkved.list(params), groupOkvedInstanceTotal: GroupOkved.count()]
    }
    @Secured("ROLE_ADMIN")

    def create() {
        [groupOkvedInstance: new GroupOkved(params)]
    }
    @Secured("ROLE_ADMIN")

    def save() {
        def groupOkvedInstance = new GroupOkved(params)
        if (!groupOkvedInstance.save(flush: true)) {
            render(view: "create", model: [groupOkvedInstance: groupOkvedInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'groupOkved.label', default: 'GroupOkved'), groupOkvedInstance.id])
        redirect(action: "show", id: groupOkvedInstance.id)
    }

    def show(Long id) {
        def groupOkvedInstance = GroupOkved.get(id)
        if (!groupOkvedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupOkved.label', default: 'GroupOkved'), id])
            redirect(action: "list")
            return
        }

        [groupOkvedInstance: groupOkvedInstance]
    }
    @Secured("ROLE_ADMIN")

    def edit(Long id) {
        def groupOkvedInstance = GroupOkved.get(id)
        if (!groupOkvedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupOkved.label', default: 'GroupOkved'), id])
            redirect(action: "list")
            return
        }

        [groupOkvedInstance: groupOkvedInstance]
    }
    @Secured("ROLE_ADMIN")

    def update(Long id, Long version) {
        def groupOkvedInstance = GroupOkved.get(id)
        if (!groupOkvedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupOkved.label', default: 'GroupOkved'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (groupOkvedInstance.version > version) {
                groupOkvedInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'groupOkved.label', default: 'GroupOkved')] as Object[],
                          "Another user has updated this GroupOkved while you were editing")
                render(view: "edit", model: [groupOkvedInstance: groupOkvedInstance])
                return
            }
        }

        groupOkvedInstance.properties = params

        if (!groupOkvedInstance.save(flush: true)) {
            render(view: "edit", model: [groupOkvedInstance: groupOkvedInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'groupOkved.label', default: 'GroupOkved'), groupOkvedInstance.id])
        redirect(action: "show", id: groupOkvedInstance.id)
    }
    @Secured("ROLE_ADMIN")

    def delete(Long id) {
        def groupOkvedInstance = GroupOkved.get(id)
        if (!groupOkvedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupOkved.label', default: 'GroupOkved'), id])
            redirect(action: "list")
            return
        }

        try {
            groupOkvedInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'groupOkved.label', default: 'GroupOkved'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'groupOkved.label', default: 'GroupOkved'), id])
            redirect(action: "show", id: id)
        }
    }
}
