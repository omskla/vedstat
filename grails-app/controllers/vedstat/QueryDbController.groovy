package vedstat

import org.springframework.dao.DataIntegrityViolationException

class QueryDbController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    static scaffold = true
//
//    def index() {
//        redirect(action: "list", params: params)
//    }
//
//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        [queryDbInstanceList: QueryDb.list(params), queryDbInstanceTotal: QueryDb.count()]
//    }
//
//    def create() {
//        [queryDbInstance: new QueryDb(params)]
//    }
//
//    def save() {
//        def queryDbInstance = new QueryDb(params)
//        if (!queryDbInstance.save(flush: true)) {
//            render(view: "create", model: [queryDbInstance: queryDbInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.created.message', args: [message(code: 'queryDb.label', default: 'QueryDb'), queryDbInstance.id])
//        redirect(action: "show", id: queryDbInstance.id)
//    }
//
//    def show(Long id) {
//        def queryDbInstance = QueryDb.get(id)
//        if (!queryDbInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'queryDb.label', default: 'QueryDb'), id])
//            redirect(action: "list")
//            return
//        }
//
//        [queryDbInstance: queryDbInstance]
//    }
//
//    def edit(Long id) {
//        def queryDbInstance = QueryDb.get(id)
//        if (!queryDbInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'queryDb.label', default: 'QueryDb'), id])
//            redirect(action: "list")
//            return
//        }
//
//        [queryDbInstance: queryDbInstance]
//    }
//
//    def update(Long id, Long version) {
//        def queryDbInstance = QueryDb.get(id)
//        if (!queryDbInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'queryDb.label', default: 'QueryDb'), id])
//            redirect(action: "list")
//            return
//        }
//
//        if (version != null) {
//            if (queryDbInstance.version > version) {
//                queryDbInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
//                        [message(code: 'queryDb.label', default: 'QueryDb')] as Object[],
//                        "Another user has updated this QueryDb while you were editing")
//                render(view: "edit", model: [queryDbInstance: queryDbInstance])
//                return
//            }
//        }
//
//        queryDbInstance.properties = params
//
//        if (!queryDbInstance.save(flush: true)) {
//            render(view: "edit", model: [queryDbInstance: queryDbInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.updated.message', args: [message(code: 'queryDb.label', default: 'QueryDb'), queryDbInstance.id])
//        redirect(action: "show", id: queryDbInstance.id)
//    }
//
//    def delete(Long id) {
//        def queryDbInstance = QueryDb.get(id)
//        if (!queryDbInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'queryDb.label', default: 'QueryDb'), id])
//            redirect(action: "list")
//            return
//        }
//
//        try {
//            queryDbInstance.delete(flush: true)
//            flash.message = message(code: 'default.deleted.message', args: [message(code: 'queryDb.label', default: 'QueryDb'), id])
//            redirect(action: "list")
//        }
//        catch (DataIntegrityViolationException e) {
//            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'queryDb.label', default: 'QueryDb'), id])
//            redirect(action: "show", id: id)
//        }
//    }
}
