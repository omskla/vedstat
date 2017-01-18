package vedstat

import org.springframework.dao.DataIntegrityViolationException

class OrgInformationController {

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
        [orgInformationInstanceList: OrgInformation.list(params), orgInformationInstanceTotal: OrgInformation.count()]
    }

    def create() {
        [orgInformationInstance: new OrgInformation(params)]
    }

    def save() {
        def orgInformationInstance = new OrgInformation(params)
        if (!orgInformationInstance.save(flush: true)) {
            render(view: "create", model: [orgInformationInstance: orgInformationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'orgInformation.label', default: 'OrgInformation'), orgInformationInstance.id])
        redirect(controller: "org", action: "show",id: orgInformationInstance.orgId)
    }

    def show(Long id) {
        def orgInformationInstance = OrgInformation.get(id)
        if (!orgInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgInformation.label', default: 'OrgInformation'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && orgInformationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [orgInformationInstance: orgInformationInstance]
    }

    def edit(Long id) {
        def orgInformationInstance = OrgInformation.get(id)
        if (!orgInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgInformation.label', default: 'OrgInformation'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && orgInformationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }

        [orgInformationInstance: orgInformationInstance]
    }

    def update(Long id, Long version) {
        def orgInformationInstance = OrgInformation.get(id)
        if (!orgInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgInformation.label', default: 'OrgInformation'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && orgInformationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        if (version != null) {
            if (orgInformationInstance.version > version) {
                orgInformationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'orgInformation.label', default: 'OrgInformation')] as Object[],
                          "Another user has updated this OrgInformation while you were editing")
                render(view: "edit", model: [orgInformationInstance: orgInformationInstance])
                return
            }
        }

        orgInformationInstance.properties = params

        if (!orgInformationInstance.save(flush: true)) {
            render(view: "edit", model: [orgInformationInstance: orgInformationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'orgInformation.label', default: 'OrgInformation'), orgInformationInstance.id])
        redirect(controller: "org", action: "show",id: orgInformationInstance.orgId)
    }

    def delete(Long id) {
        def orgInformationInstance = OrgInformation.get(id)
        def idOrg =  orgInformationInstance.orgId
        if (!orgInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgInformation.label', default: 'OrgInformation'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && orgInformationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        try {
            orgInformationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'orgInformation.label', default: 'OrgInformation'), id])
            redirect(controller: "org", action: "show", id: idOrg)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'orgInformation.label', default: 'OrgInformation'), id])
            redirect(action: "show", id: id)
        }
    }

    def copy(){
        def org = Org.get(params.org.id)
        def c = OrgInformation.createCriteria()
        def res = c.get
        {
            eq("org", org)
            maxResults (1)
            order("infDate","desc")
        }

        Calendar cal = Calendar.getInstance();
        cal.setTime(res.infDate)
        cal.set(Calendar.YEAR,cal.get(Calendar.YEAR)+1)
        OrgInformation newOrgInf = OrgInformation.newInstance(res.properties)
        newOrgInf.infDate = cal.getTime()
        newOrgInf.save(true)
        redirect(controller: "org", action: "show", id: params.org.id)

    }


}
