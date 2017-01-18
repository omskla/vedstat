package vedstat

import org.springframework.dao.DataIntegrityViolationException

class OkvedController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [okvedInstanceList: Okved.list(params), okvedInstanceTotal: Okved.count()]
    }

    def create() {
        [okvedInstance: new Okved(params)]
    }

    def save() {
        def okvedInstance = new Okved(params)
        if (!okvedInstance.save(flush: true)) {
            render(view: "create", model: [okvedInstance: okvedInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'okved.label', default: 'Okved'), okvedInstance.id])
        redirect(action: "show", id: okvedInstance.id)
    }

    def show(Long id) {
        def okvedInstance = Okved.get(id)
        if (!okvedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'okved.label', default: 'Okved'), id])
            redirect(action: "list")
            return
        }

        [okvedInstance: okvedInstance]
    }

    def edit(Long id) {
        def okvedInstance = Okved.get(id)
        if (!okvedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'okved.label', default: 'Okved'), id])
            redirect(action: "list")
            return
        }

        [okvedInstance: okvedInstance]
    }

    def update(Long id, Long version) {
        def okvedInstance = Okved.get(id)
        if (!okvedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'okved.label', default: 'Okved'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (okvedInstance.version > version) {
                okvedInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'okved.label', default: 'Okved')] as Object[],
                          "Another user has updated this Okved while you were editing")
                render(view: "edit", model: [okvedInstance: okvedInstance])
                return
            }
        }

        okvedInstance.properties = params

        if (!okvedInstance.save(flush: true)) {
            render(view: "edit", model: [okvedInstance: okvedInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'okved.label', default: 'Okved'), okvedInstance.id])
        redirect(action: "show", id: okvedInstance.id)
    }

    def delete(Long id) {
        def okvedInstance = Okved.get(id)
        if (!okvedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'okved.label', default: 'Okved'), id])
            redirect(action: "list")
            return
        }

        try {
            okvedInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'okved.label', default: 'Okved'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'okved.label', default: 'Okved'), id])
            redirect(action: "show", id: id)
        }
    }
}
