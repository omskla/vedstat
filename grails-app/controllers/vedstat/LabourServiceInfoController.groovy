package vedstat

import org.springframework.dao.DataIntegrityViolationException

class LabourServiceInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        if(session.orgId!=null ){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        params.max = Math.min(max ?: 10, 100)
        [labourServiceInfoInstanceList: LabourServiceInfo.list(params), labourServiceInfoInstanceTotal: LabourServiceInfo.count()]
    }

    def create() {
        [labourServiceInfoInstance: new LabourServiceInfo(params)]
    }

    def save() {
        def labourServiceInfoInstance = new LabourServiceInfo(params)
        if (!labourServiceInfoInstance.save(flush: true)) {
            render(view: "create", model: [labourServiceInfoInstance: labourServiceInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo'), labourServiceInfoInstance.id])
        redirect(controller: "org", action: "show",id: labourServiceInfoInstance.orgId)
    }

    def show(Long id) {
        def labourServiceInfoInstance = LabourServiceInfo.get(id)
        if (!labourServiceInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && labourServiceInfoInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [labourServiceInfoInstance: labourServiceInfoInstance]
    }

    def edit(Long id) {
        def labourServiceInfoInstance = LabourServiceInfo.get(id)
        if (!labourServiceInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && labourServiceInfoInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [labourServiceInfoInstance: labourServiceInfoInstance]
    }

    def update(Long id, Long version) {
        def labourServiceInfoInstance = LabourServiceInfo.get(id)
        if (!labourServiceInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && labourServiceInfoInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        if (version != null) {
            if (labourServiceInfoInstance.version > version) {
                labourServiceInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo')] as Object[],
                          "Another user has updated this LabourServiceInfo while you were editing")
                render(view: "edit", model: [labourServiceInfoInstance: labourServiceInfoInstance])
                return
            }
        }

        labourServiceInfoInstance.properties = params

        if (!labourServiceInfoInstance.save(flush: true)) {
            render(view: "edit", model: [labourServiceInfoInstance: labourServiceInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo'), labourServiceInfoInstance.id])
        redirect(controller: "org", action: "show",id: labourServiceInfoInstance.orgId)
    }

    def delete(Long id) {
        def labourServiceInfoInstance = LabourServiceInfo.get(id)
        def idOrg = labourServiceInfoInstance.orgId
        if (!labourServiceInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && labourServiceInfoInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        try {
            labourServiceInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo'), id])
            redirect(controller: "org", action: "show", id: idOrg)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'labourServiceInfo.label', default: 'LabourServiceInfo'), id])
            redirect(action: "show", id: id)
        }
    }

    def copy(){
        def org = Org.get(params.org.id)
        def c = LabourServiceInfo.createCriteria()
        def res = c.get
                {
                    eq("org", org)
                    maxResults (1)
                    order("infDate","desc")
                }

        Calendar cal = Calendar.getInstance();
        cal.setTime(res.infDate)
        cal.set(Calendar.YEAR,cal.get(Calendar.YEAR)+1)
        LabourServiceInfo newOrgInf = LabourServiceInfo.newInstance(res.properties)
        newOrgInf.infDate = cal.getTime()
        newOrgInf.save(true)
        redirect(controller: "org", action: "show", id: params.org.id)

    }
}
