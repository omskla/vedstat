package vedstat

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

class MunicAreaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        params.max = 45
        [municAreaInstanceList: MunicArea.list(params), municAreaInstanceTotal: MunicArea.count()]

    }

    def list(Integer max) {
        params.max = Math.min(max ?: 45, 100)
        [municAreaInstanceList: MunicArea.list(params), municAreaInstanceTotal: MunicArea.count()]
    }
    @Secured("ROLE_ADMIN")
    def create() {
        [municAreaInstance: new MunicArea(params)]
    }
    @Secured("ROLE_ADMIN")
    def save() {
        def municAreaInstance = new MunicArea(params)
        if (!municAreaInstance.save(flush: true)) {
            render(view: "create", model: [municAreaInstance: municAreaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'municArea.label', default: 'MunicArea'), municAreaInstance.id])
        redirect(action: "show", id: municAreaInstance.id)
    }

    def show(Long id) {
        def municAreaInstance = MunicArea.get(id)
        if (!municAreaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'municArea.label', default: 'MunicArea'), id])
            redirect(action: "list")
            return
        }

        [municAreaInstance: municAreaInstance]
    }
    @Secured("ROLE_ADMIN")
    def edit(Long id) {
        def municAreaInstance = MunicArea.get(id)
        if (!municAreaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'municArea.label', default: 'MunicArea'), id])
            redirect(action: "list")
            return
        }
        [municAreaInstance: municAreaInstance]
    }
    @Secured("ROLE_ADMIN")
    def update(Long id, Long version) {
        def municAreaInstance = MunicArea.get(id)
        if (!municAreaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'municArea.label', default: 'MunicArea'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (municAreaInstance.version > version) {
                municAreaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'municArea.label', default: 'MunicArea')] as Object[],
                          "Another user has updated this MunicArea while you were editing")
                render(view: "edit", model: [municAreaInstance: municAreaInstance])
                return
            }
        }

        municAreaInstance.properties = params

        if (!municAreaInstance.save(flush: true)) {
            render(view: "edit", model: [municAreaInstance: municAreaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'municArea.label', default: 'MunicArea'), municAreaInstance.id])
        redirect(action: "show", id: municAreaInstance.id)
    }
    @Secured("ROLE_ADMIN")
    def delete(Long id) {
        def municAreaInstance = MunicArea.get(id)
        if (!municAreaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'municArea.label', default: 'MunicArea'), id])
            redirect(action: "list")
            return
        }

        try {
            municAreaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'municArea.label', default: 'MunicArea'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'municArea.label', default: 'MunicArea'), id])
            redirect(action: "show", id: id)
        }
    }
}
