package vedstat

import org.springframework.dao.DataIntegrityViolationException

class BuildingExpluatationController {

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
        [buildingExpluatationInstanceList: BuildingExpluatation.list(params), buildingExpluatationInstanceTotal: BuildingExpluatation.count()]
    }

    def create() {
        [buildingExpluatationInstance: new BuildingExpluatation(params)]
    }

    def save() {
        def buildingExpluatationInstance = new BuildingExpluatation(params)
        if (!buildingExpluatationInstance.save(flush: true)) {
            render(view: "create", model: [buildingExpluatationInstance: buildingExpluatationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation'), buildingExpluatationInstance.id])
        redirect(controller: "org", action: "show",id: buildingExpluatationInstance.orgId)
    }

    def show(Long id) {
        def buildingExpluatationInstance = BuildingExpluatation.get(id)

        if (!buildingExpluatationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && buildingExpluatationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [buildingExpluatationInstance: buildingExpluatationInstance]
    }

    def edit(Long id) {
        def buildingExpluatationInstance = BuildingExpluatation.get(id)
        if (!buildingExpluatationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && buildingExpluatationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        [buildingExpluatationInstance: buildingExpluatationInstance]
    }

    def update(Long id, Long version) {
        def buildingExpluatationInstance = BuildingExpluatation.get(id)
        if (!buildingExpluatationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && buildingExpluatationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        if (version != null) {
            if (buildingExpluatationInstance.version > version) {
                buildingExpluatationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation')] as Object[],
                          "Another user has updated this BuildingExpluatation while you were editing")
                render(view: "edit", model: [buildingExpluatationInstance: buildingExpluatationInstance])
                return
            }
        }

        buildingExpluatationInstance.properties = params

        if (!buildingExpluatationInstance.save(flush: true)) {
            render(view: "edit", model: [buildingExpluatationInstance: buildingExpluatationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation'), buildingExpluatationInstance.id])
        redirect(controller: "org", action: "show",id: buildingExpluatationInstance.orgId)
    }

    def delete(Long id) {
        def buildingExpluatationInstance = BuildingExpluatation.get(id)
        def idOrg = buildingExpluatationInstance.orgId
        if (!buildingExpluatationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation'), id])
            redirect(action: "list")
            return
        }
        if(session.orgId!=null && buildingExpluatationInstance.orgId!=session.orgId){
            redirect(controller: "org",action: "show",id:session.orgId)
            return
        }
        try {
            buildingExpluatationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation'), id])
            redirect(controller: "org", action: "show", id: idOrg)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'buildingExpluatation.label', default: 'BuildingExpluatation'), id])
            redirect(action: "show", id: id)
        }
    }


    def copy(){
        def org = Org.get(params.org.id)
        def c = BuildingExpluatation.createCriteria()
        def res = c.get
                {
                    eq("org", org)
                    maxResults (1)
                    order("infDate","desc")
                }

        Calendar cal = Calendar.getInstance();
        cal.setTime(res.infDate)
        cal.set(Calendar.YEAR,cal.get(Calendar.YEAR)+1)
        BuildingExpluatation newInstance = BuildingExpluatation.newInstance(res.properties)
        newInstance.infDate = cal.getTime()
        newInstance.save(true)
        redirect(controller: "org", action: "show", id: params.org.id)

    }
}
