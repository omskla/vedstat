package vedstat

import org.springframework.dao.DataIntegrityViolationException

class UnluckyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        if(session.orgId!=null){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        params.max = Math.min(max ?: 10, 100)
        [unluckyInstanceList: Unlucky.list(params), unluckyInstanceTotal: Unlucky.count()]
    }

    def create() {
        [unluckyInstance: new Unlucky(params)]
    }

    def save() {
        def unluckyInstance = new Unlucky(params)
        if (!unluckyInstance.save(flush: true)) {
            render(view: "create", model: [unluckyInstance: unluckyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'unlucky.label', default: 'Unlucky'), unluckyInstance.id])
        redirect(controller: "org", action: "show",id: unluckyInstance.orgId)
    }

    def show(Long id) {
        def unluckyInstance = Unlucky.get(id)
        if (!unluckyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unlucky.label', default: 'Unlucky'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && unluckyInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [unluckyInstance: unluckyInstance]
    }

    def edit(Long id) {
        def unluckyInstance = Unlucky.get(id)
        if (!unluckyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unlucky.label', default: 'Unlucky'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && unluckyInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [unluckyInstance: unluckyInstance]
    }

    def update(Long id, Long version) {
        def unluckyInstance = Unlucky.get(id)
        if (!unluckyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unlucky.label', default: 'Unlucky'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && unluckyInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        if (version != null) {
            if (unluckyInstance.version > version) {
                unluckyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'unlucky.label', default: 'Unlucky')] as Object[],
                          "Another user has updated this Unlucky while you were editing")
                render(view: "edit", model: [unluckyInstance: unluckyInstance])
                return
            }
        }

        unluckyInstance.properties = params

        if (!unluckyInstance.save(flush: true)) {
            render(view: "edit", model: [unluckyInstance: unluckyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'unlucky.label', default: 'Unlucky'), unluckyInstance.id])
        redirect(controller: "org", action: "show",id: unluckyInstance.orgId)
    }

    def delete(Long id) {
        def unluckyInstance = Unlucky.get(id)
        def idOrg = unluckyInstance.orgId
        if (!unluckyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unlucky.label', default: 'Unlucky'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && unluckyInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        try {
            unluckyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'unlucky.label', default: 'Unlucky'), id])
            redirect(controller: "org", action: "show", id: idOrg)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'unlucky.label', default: 'Unlucky'), id])
            redirect(action: "show", id: id)
        }
    }

    def copy(){
        def org = Org.get(params.org.id)
        def c = Unlucky.createCriteria()
        def res = c.get
                {
                    eq("org", org)
                    maxResults (1)
                    order("infDate","desc")
                }

        Calendar cal = Calendar.getInstance();
        cal.setTime(res.infDate)
        cal.set(Calendar.YEAR,cal.get(Calendar.YEAR)+1)
        Unlucky newInstance = Unlucky.newInstance(res.properties)
        newInstance.infDate = cal.getTime()
        newInstance.save(true)
        redirect(controller: "org", action: "show", id: params.org.id)

    }
}
