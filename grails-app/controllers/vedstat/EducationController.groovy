package vedstat

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

class EducationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [educationInstanceList: Education.list(params), educationInstanceTotal: Education.count()]
    }
    @Secured("ROLE_ADMIN")

    def create() {
        [educationInstance: new Education(params)]
    }
    @Secured("ROLE_ADMIN")

    def save() {
        def educationInstance = new Education(params)
        if (!educationInstance.save(flush: true)) {
            render(view: "create", model: [educationInstance: educationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'education.label', default: 'Education'), educationInstance.id])
        redirect(action: "show", id: educationInstance.id)
    }

    def show(Long id) {
        def educationInstance = Education.get(id)
        if (!educationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'education.label', default: 'Education'), id])
            redirect(action: "list")
            return
        }

        [educationInstance: educationInstance]
    }
    @Secured("ROLE_ADMIN")

    def edit(Long id) {
        def educationInstance = Education.get(id)
        if (!educationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'education.label', default: 'Education'), id])
            redirect(action: "list")
            return
        }

        [educationInstance: educationInstance]
    }
    @Secured("ROLE_ADMIN")

    def update(Long id, Long version) {
        def educationInstance = Education.get(id)
        if (!educationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'education.label', default: 'Education'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (educationInstance.version > version) {
                educationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'education.label', default: 'Education')] as Object[],
                          "Another user has updated this Education while you were editing")
                render(view: "edit", model: [educationInstance: educationInstance])
                return
            }
        }

        educationInstance.properties = params

        if (!educationInstance.save(flush: true)) {
            render(view: "edit", model: [educationInstance: educationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'education.label', default: 'Education'), educationInstance.id])
        redirect(action: "show", id: educationInstance.id)
    }
    @Secured("ROLE_ADMIN")

    def delete(Long id) {
        def educationInstance = Education.get(id)
        if (!educationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'education.label', default: 'Education'), id])
            redirect(action: "list")
            return
        }

        try {
            educationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'education.label', default: 'Education'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'education.label', default: 'Education'), id])
            redirect(action: "show", id: id)
        }
    }
}
