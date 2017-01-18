package vedstat

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

class TrainingOrgController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.sort = "code"
        params.max = Math.min(max ?: 30, 100)
        [trainingOrgInstanceList: TrainingOrg.list(params), trainingOrgInstanceTotal: TrainingOrg.count()]
    }
    @Secured("ROLE_ADMIN")
    def create() {
        [trainingOrgInstance: new TrainingOrg(params)]
    }

    def save() {
        def trainingOrgInstance = new TrainingOrg(params)
        if (!trainingOrgInstance.save(flush: true)) {
            render(view: "create", model: [trainingOrgInstance: trainingOrgInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'trainingOrg.label', default: 'TrainingOrg'), trainingOrgInstance.id])
        redirect(action: "show", id: trainingOrgInstance.id)
    }

    def show(Long id) {
        def trainingOrgInstance = TrainingOrg.get(id)
        if (!trainingOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainingOrg.label', default: 'TrainingOrg'), id])
            redirect(action: "list")
            return
        }

        [trainingOrgInstance: trainingOrgInstance]
    }
    @Secured("ROLE_ADMIN")
    def edit(Long id) {
        def trainingOrgInstance = TrainingOrg.get(id)
        if (!trainingOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainingOrg.label', default: 'TrainingOrg'), id])
            redirect(action: "list")
            return
        }

        [trainingOrgInstance: trainingOrgInstance]
    }
    @Secured("ROLE_ADMIN")
    def update(Long id, Long version) {
        def trainingOrgInstance = TrainingOrg.get(id)
        if (!trainingOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainingOrg.label', default: 'TrainingOrg'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (trainingOrgInstance.version > version) {
                trainingOrgInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'trainingOrg.label', default: 'TrainingOrg')] as Object[],
                          "Another user has updated this TrainingOrg while you were editing")
                render(view: "edit", model: [trainingOrgInstance: trainingOrgInstance])
                return
            }
        }

        trainingOrgInstance.properties = params

        if (!trainingOrgInstance.save(flush: true)) {
            render(view: "edit", model: [trainingOrgInstance: trainingOrgInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'trainingOrg.label', default: 'TrainingOrg'), trainingOrgInstance.id])
        redirect(action: "show", id: trainingOrgInstance.id)
    }
    @Secured("ROLE_ADMIN")
    def delete(Long id) {
        def trainingOrgInstance = TrainingOrg.get(id)
        if (!trainingOrgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainingOrg.label', default: 'TrainingOrg'), id])
            redirect(action: "list")
            return
        }

        try {
            trainingOrgInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'trainingOrg.label', default: 'TrainingOrg'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'trainingOrg.label', default: 'TrainingOrg'), id])
            redirect(action: "show", id: id)
        }
    }
}
