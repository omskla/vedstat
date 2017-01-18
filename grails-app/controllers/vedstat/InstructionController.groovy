package vedstat

import org.springframework.dao.DataIntegrityViolationException

class InstructionController {

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
        [instructionInstanceList: Instruction.list(params), instructionInstanceTotal: Instruction.count()]
    }

    def create() {
        [instructionInstance: new Instruction(params)]
    }

    def save() {
        def instructionInstance = new Instruction(params)
        if (!instructionInstance.save(flush: true)) {
            render(view: "create", model: [instructionInstance: instructionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'instruction.label', default: 'Instruction'), instructionInstance.id])
        redirect(controller: "org", action: "show",id: instructionInstance.orgId)
    }

    def show(Long id) {
        def instructionInstance = Instruction.get(id)
        if (!instructionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'instruction.label', default: 'Instruction'), id])
            redirect(action: "list")
            return
        }

        if(session.orgId!=null && instructionInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [instructionInstance: instructionInstance]
    }

    def edit(Long id) {
        def instructionInstance = Instruction.get(id)
        if (!instructionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'instruction.label', default: 'Instruction'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && instructionInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [instructionInstance: instructionInstance]
    }

    def update(Long id, Long version) {
        def instructionInstance = Instruction.get(id)
        if (!instructionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'instruction.label', default: 'Instruction'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && instructionInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        if (version != null) {
            if (instructionInstance.version > version) {
                instructionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'instruction.label', default: 'Instruction')] as Object[],
                          "Another user has updated this Instruction while you were editing")
                render(view: "edit", model: [instructionInstance: instructionInstance])
                return
            }
        }

        instructionInstance.properties = params

        if (!instructionInstance.save(flush: true)) {
            render(view: "edit", model: [instructionInstance: instructionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'instruction.label', default: 'Instruction'), instructionInstance.id])
        redirect(controller: "org", action: "show",id: instructionInstance.orgId)
    }

    def delete(Long id) {
        def instructionInstance = Instruction.get(id)
        def idOrg = instructionInstance.orgId
        if (!instructionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'instruction.label', default: 'Instruction'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && instructionInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        try {
            instructionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'instruction.label', default: 'Instruction'), id])
            redirect(controller: "org", action: "show", id: idOrg)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'instruction.label', default: 'Instruction'), id])
            redirect(action: "show", id: id)
        }
    }

    def copy(){
        def org = Org.get(params.org.id)
        def c = Instruction.createCriteria()
        def res = c.get
                {
                    eq("org", org)
                    maxResults (1)
                    order("infDate","desc")
                }

        Calendar cal = Calendar.getInstance();
        cal.setTime(res.infDate)
        cal.set(Calendar.YEAR,cal.get(Calendar.YEAR)+1)
        Instruction newInstance = Instruction.newInstance(res.properties)
        newInstance.infDate = cal.getTime()
        newInstance.save(true)
        redirect(controller: "org", action: "show", id: params.org.id)

    }
}
