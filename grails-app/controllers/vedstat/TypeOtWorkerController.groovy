package vedstat

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

class TypeOtWorkerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [typeOtWorkerInstanceList: TypeOtWorker.list(params), typeOtWorkerInstanceTotal: TypeOtWorker.count()]
    }
    @Secured("ROLE_ADMIN")
    def create() {
        [typeOtWorkerInstance: new TypeOtWorker(params)]
    }

    def save() {
        def typeOtWorkerInstance = new TypeOtWorker(params)
        if (!typeOtWorkerInstance.save(flush: true)) {
            render(view: "create", model: [typeOtWorkerInstance: typeOtWorkerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'typeOtWorker.label', default: 'TypeOtWorker'), typeOtWorkerInstance.id])
        redirect(action: "show", id: typeOtWorkerInstance.id)
    }

    def show(Long id) {
        def typeOtWorkerInstance = TypeOtWorker.get(id)
        if (!typeOtWorkerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOtWorker.label', default: 'TypeOtWorker'), id])
            redirect(action: "list")
            return
        }

        [typeOtWorkerInstance: typeOtWorkerInstance]
    }
    @Secured("ROLE_ADMIN")
    def edit(Long id) {
        def typeOtWorkerInstance = TypeOtWorker.get(id)
        if (!typeOtWorkerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOtWorker.label', default: 'TypeOtWorker'), id])
            redirect(action: "list")
            return
        }

        [typeOtWorkerInstance: typeOtWorkerInstance]
    }

    def update(Long id, Long version) {
        def typeOtWorkerInstance = TypeOtWorker.get(id)
        if (!typeOtWorkerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOtWorker.label', default: 'TypeOtWorker'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (typeOtWorkerInstance.version > version) {
                typeOtWorkerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'typeOtWorker.label', default: 'TypeOtWorker')] as Object[],
                          "Another user has updated this TypeOtWorker while you were editing")
                render(view: "edit", model: [typeOtWorkerInstance: typeOtWorkerInstance])
                return
            }
        }

        typeOtWorkerInstance.properties = params

        if (!typeOtWorkerInstance.save(flush: true)) {
            render(view: "edit", model: [typeOtWorkerInstance: typeOtWorkerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'typeOtWorker.label', default: 'TypeOtWorker'), typeOtWorkerInstance.id])
        redirect(action: "show", id: typeOtWorkerInstance.id)
    }
    @Secured("ROLE_ADMIN")
    def delete(Long id) {
        def typeOtWorkerInstance = TypeOtWorker.get(id)
        if (!typeOtWorkerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOtWorker.label', default: 'TypeOtWorker'), id])
            redirect(action: "list")
            return
        }

        try {
            typeOtWorkerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'typeOtWorker.label', default: 'TypeOtWorker'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'typeOtWorker.label', default: 'TypeOtWorker'), id])
            redirect(action: "show", id: id)
        }
    }
}
