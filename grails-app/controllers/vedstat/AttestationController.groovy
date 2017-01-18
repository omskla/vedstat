package vedstat

import org.springframework.dao.DataIntegrityViolationException

class AttestationController {

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
        [attestationInstanceList: Attestation.list(params), attestationInstanceTotal: Attestation.count()]
    }

    def create() {
        [attestationInstance: new Attestation(params)]
    }

    def save() {
        def attestationInstance = new Attestation(params)
        if (!attestationInstance.save(flush: true)) {
            render(view: "create", model: [attestationInstance: attestationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'attestation.label', default: 'Attestation'), attestationInstance.id])
//        redirect(action: "show", id: attestationInstance.id)
        redirect(controller: "org", action: "show",id: attestationInstance.orgId)
    }

    def show(Long id) {
        def attestationInstance = Attestation.get(id)
        if(session.orgId!=null && attestationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }

        if (!attestationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attestation.label', default: 'Attestation'), id])
            redirect(action: "list")
            return
        }

        [attestationInstance: attestationInstance]
    }

    def edit(Long id) {
        def attestationInstance = Attestation.get(id)
        if (!attestationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attestation.label', default: 'Attestation'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && attestationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }

        [attestationInstance: attestationInstance]
    }

    def update(Long id, Long version) {
        def attestationInstance = Attestation.get(id)

        if (!attestationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attestation.label', default: 'Attestation'), id])
            redirect(action: "list")
            return
        }

        if(session.orgId!=null && attestationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        if (version != null) {
            if (attestationInstance.version > version) {
                attestationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'attestation.label', default: 'Attestation')] as Object[],
                        "Another user has updated this Attestation while you were editing")
                render(view: "edit", model: [attestationInstance: attestationInstance])
                return
            }
        }

        attestationInstance.properties = params

        if (!attestationInstance.save(flush: true)) {
            render(view: "edit", model: [attestationInstance: attestationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'attestation.label', default: 'Attestation'), attestationInstance.id])
        redirect(controller: "org", action: "show", id: attestationInstance.orgId)
    }

    def delete(Long id) {
        def attestationInstance = Attestation.get(id)
        if(session.orgId!=null && attestationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        def idOrg =  attestationInstance.orgId
        if (!attestationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attestation.label', default: 'Attestation'), id])
            redirect(action: "list")
            return
        }

        try {
            attestationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'attestation.label', default: 'Attestation'), id])
            redirect(controller: "org", action: "show", id: idOrg)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'attestation.label', default: 'Attestation'), id])
            redirect(action: "show", id: id)
        }
    }


    def copy(){
        def org = Org.get(params.org.id)
        def c = Attestation.createCriteria()
        def res = c.get
                {
                    eq("org", org)
                    maxResults (1)
                    order("infDate","desc")
                }

        Calendar cal = Calendar.getInstance();
        cal.setTime(res.infDate)
        cal.set(Calendar.YEAR,cal.get(Calendar.YEAR)+1)
        Attestation newInstance = Attestation.newInstance(res.properties)
        newInstance.infDate = cal.getTime()
        newInstance.save(true)
        redirect(controller: "org", action: "show", id: params.org.id)

    }
}
