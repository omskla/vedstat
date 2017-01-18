package vedstat

import org.springframework.dao.DataIntegrityViolationException

class TrainingLabourInfoController {

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
        [trainingLabourInfoInstanceList: TrainingLabourInfo.list(params), trainingLabourInfoInstanceTotal: TrainingLabourInfo.count()]
    }

    def create() {
        [trainingLabourInfoInstance: new TrainingLabourInfo(params)]
    }

    def save() {
        def trainingLabourInfoInstance = new TrainingLabourInfo(params)
        if (!trainingLabourInfoInstance.save(flush: true)) {
            render(view: "create", model: [trainingLabourInfoInstance: trainingLabourInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo'), trainingLabourInfoInstance.id])
        redirect(controller: "org", action: "show",id: trainingLabourInfoInstance.orgId)
    }

    def show(Long id) {
        def trainingLabourInfoInstance = TrainingLabourInfo.get(id)
        if (!trainingLabourInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && trainingLabourInfoInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [trainingLabourInfoInstance: trainingLabourInfoInstance]
    }

    def edit(Long id) {
        def trainingLabourInfoInstance = TrainingLabourInfo.get(id)
        if (!trainingLabourInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && trainingLabourInfoInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [trainingLabourInfoInstance: trainingLabourInfoInstance]
    }

    def update(Long id, Long version) {
        def trainingLabourInfoInstance = TrainingLabourInfo.get(id)
        if (!trainingLabourInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && trainingLabourInfoInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        if (version != null) {
            if (trainingLabourInfoInstance.version > version) {
                trainingLabourInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo')] as Object[],
                        "Another user has updated this TrainingLabourInfo while you were editing")
                render(view: "edit", model: [trainingLabourInfoInstance: trainingLabourInfoInstance])
                return
            }
        }

        trainingLabourInfoInstance.properties = params

        if (!trainingLabourInfoInstance.save(flush: true)) {
            render(view: "edit", model: [trainingLabourInfoInstance: trainingLabourInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo'), trainingLabourInfoInstance.id])
        redirect(controller: "org", action: "show",id: trainingLabourInfoInstance.orgId)
    }

    def delete(Long id) {
        def trainingLabourInfoInstance = TrainingLabourInfo.get(id)
        def idOrg = trainingLabourInfoInstance.orgId
        if (!trainingLabourInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && trainingLabourInfoInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        try {
            trainingLabourInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo'), id])
            redirect(controller: "org", action: "show", id: idOrg)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'trainingLabourInfo.label', default: 'TrainingLabourInfo'), id])
            redirect(action: "show", id: id)
        }
    }


    def copy(){

        def org = Org.get(params.org.id)
        def c = TrainingLabourInfo.createCriteria()
        def res = c.get
                {
                    eq("org", org)
                    maxResults (1)
                    order("infDate","desc")
                }

        println(res)
        Calendar cal = Calendar.getInstance();
        cal.setTime(res.infDate)
        cal.set(Calendar.YEAR,cal.get(Calendar.YEAR)+1)
        TrainingLabourInfo newInstance = TrainingLabourInfo.newInstance(res.properties)
        newInstance.infDate = cal.getTime()
        println(newInstance)
        println(newInstance.class)

        newInstance.save(true)
        redirect(controller: "org", action: "show", id: params.org.id)

    }
}
