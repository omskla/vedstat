package vedstat

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException


class OrgController {
    def utilService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    static scaffold = true

    def updateOkved() {
        Org.findAllByGroupOkvedIsNull().each { it ->
            utilService.updateGroupOkved(it)
        }
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        params.sort = "okved"
        def auth = springSecurityService.principal
        def user = User.get(auth.id)
        def area = user.area
        def org = user.org
        def isShowBadOrgs = "yes".equals(params.bad)
        def isShowRepair = "yes".equals(params.repair)
        if (org != null) {
            render(view: "show", model: [orgInstance: org])
            return
        }

        if (!params.searchable) {
            flash.message = ""
            def orgList
            def orgCriteria = Org.createCriteria()

            if (area != null || user.authorities.contains(Role.findByAuthority("ROLE_ADMIN"))) {
                orgList = orgCriteria.list(max: params.max, offset: params.offset, sort: params.sort) {
                    if (area != null)
                        eq("area", area)

                    if (isShowBadOrgs) {
                        def orgIds = Verification.findAllByVerificationStatusAndIsRepairAndIsResolveNotEqual(VerificationStatus.findByCode("bad"), false, true).org.id
                        if (orgIds != null && !orgIds.isEmpty()) {
                            'in' "id", orgIds
                        } else {
                            'in' "id", [-1.longValue()]
                        }
                    }
                    if (isShowRepair) {
                        def orgIds = Verification.findAllByVerificationStatusAndIsRepairAndIsResolveNotEqual(VerificationStatus.findByCode("bad"), true, true).org.id
                        if (orgIds != null && !orgIds.isEmpty()) {
                            'in' "id", orgIds
                        } else {
                            'in' "id", [-1.longValue()]
                        }

                    }
                }
            } else
                orgList = orgCriteria.list(max: params.max, offset: params.offset, sort: params.sort) {}

            [searchCategory  : "",
             searchKeyword   : "",
             orgInstanceList : orgList,
             orgInstanceTotal: orgList.getTotalCount(), params: params]
        } else {
            def orgs = utilService.searchOrgByFilters(params, area)
            params.message = message(code: 'default.search.result.label', args: [orgs.searchResultSize])
            [searchCategory  : params.searchCategory,
             searchKeyword   : params.searchable,
             orgInstanceList : orgs.searchResults,
             orgInstanceTotal: orgs.searchResultSize, params: params]
        }

    }

    @Secured(["ROLE_ADMIN", "ROLE_USER"])
    def create() {
        def status = Status.findByCode("act");
        params.status = status
        [orgInstance: new Org(params)]
    }

    def save() {
        def orgInstance = new Org(params)
        if (!orgInstance.save(flush: true)) {
            render(view: "create", model: [orgInstance: orgInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'org.label', default: 'Org'), orgInstance.id])
        redirect(action: "show", id: orgInstance.id)
    }

    def show(Long id) {
        def user = utilService.getUser()

        if (user.org != null && user.org.id != id) {
            redirect(action: "show", id: user.org.id)
            return
        }

        def area = utilService.getAreaByUser()
        def orgInstance = Org.get(id)
        if (!orgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list")
            return
        }
        if (orgInstance.area.equals(area) || (null == orgInstance.area && null == area) || user.authorities.contains(Role.findByAuthority("ROLE_ADMIN"))) {
            [orgInstance: orgInstance]
        } else
            redirect(action: "list")
    }

    def edit(Long id) {
        def orgInstance = Org.get(id)
        if (!orgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list")
            return
        }

        [orgInstance: orgInstance]
    }

    def update(Long id, Long version) {
        def orgInstance = Org.get(id)
        if (!orgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (orgInstance.version > version) {
                orgInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'org.label', default: 'Org')] as Object[],
                        "Another user has updated this Org while you were editing")
                render(view: "edit", model: [orgInstance: orgInstance])
                return
            }
        }

        orgInstance.properties = params

        if (!orgInstance.save(flush: true)) {
            render(view: "edit", model: [orgInstance: orgInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'org.label', default: 'Org'), orgInstance.id])
        redirect(action: "show", id: orgInstance.id)
    }

    @Secured("ROLE_ADMIN")
    def delete(Long id) {
        def orgInstance = Org.get(id)
        if (!orgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list")
            return
        }

        try {
            orgInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list");
        }
        catch (DataIntegrityViolationException ignored) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "show", id: id)
        }
    }

    @Secured(["ROLE_ADMIN", "ROLE_USER"])
    def search() {
        params.max = 15
        params.offset = 0
    }

    def showSearchResult(params) {
        params.sort = "description"
        if (!params.max) {
            params.max = 15
        }
        if (!params.offset) {
            params.offset = 0
        }
        String queryStr = "%" + params.nameOrg + "%"

        def orgInstanceList = Org.createCriteria().list(max: params.max, offset: params.offset, sort: "description") {
            like("description", queryStr)
        }

        if (null != orgInstanceList) {
            params.mess = message(code: 'default.search.result.label', args: [orgInstanceList.totalCount])
//            flash.message = message(code: 'default.search.result.label', args: [orgInstanceList.totalCount])
        }

        [orgInstanceList: orgInstanceList, orgInstanceTotal: orgInstanceList.totalCount, params: params]
    }

    def showChild(params) {
        def auth = springSecurityService.principal
        def user = User.get(auth.id)
        def area = user.area

        if (!params.max) {
            params.max = 15
        }
        if (!params.offset) {
            params.offset = 0
        }
        def orgInstanceList
        if (params.idHead) {
            orgInstanceList = Org.createCriteria().list(max: params.max, offset: params.offset, sort: "description") {
                if (area != null) {
                    eq("area", area)
                }
                eq("headOrg", HeadOrg.get(new Long(params.idHead)))
            }
        } else if (params.idArea) {
            orgInstanceList = Org.createCriteria().list(max: params.max, offset: params.offset, sort: "description") {
                eq("area", MunicArea.get(new Long(params.idArea)))
                if (area != null) {
                    eq("area", area)
                }
            }
        }
        if (null != orgInstanceList) {
            flash.message = message(code: 'default.search.result.label', args: [orgInstanceList.totalCount])
        }
        [orgInstanceList: orgInstanceList, orgInstanceTotal: orgInstanceList.totalCount, params: params]
    }


    def getIndexByOkvedGroup() {
        def year = params.year
        def idSpan = params.idSpan
        def okvedGroup = params.okvedGroup
        def itogo

        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }

        if (!okvedGroup) {
            render(['itog': 'Не заполнена группа ОКВЭД!'] as JSON)
            return
        }

        //первый коэффициент считаем
        if ("freqTravmSpan".equals(params.idSpan)) {
            itogo = utilService.indexByOkvedGroup(year, okvedGroup, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }

        if ("hardTravmSpan".equals(params.idSpan)) {
            itogo = utilService.indexByOkvedGroup(year, okvedGroup, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }

        if ("deathSpan".equals(params.idSpan)) {
            itogo = utilService.indexByOkvedGroup(year, okvedGroup, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }
    }


    def showX(Long id) {
        def orgInstance = Org.get(id)
        if (!orgInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'org.label', default: 'Org'), id])
            redirect(action: "list")
            return
        }

        [orgInstance: orgInstance]
    }

//------------------------------flow test--------------------------------------------------------


    def test() {
        redirect(action: "registerOrg")
    }

    def registerOrgFlow = {

        create {
            on('next') { Org org ->

                flow.org = org
                if (org.hasErrors()) {
                    println "!!!!!!!!!!!!!!!!!!!!!"
                    println org.getErrors()
                    flash.message = "Validation error"
                    return error()
                } else success()
                [orgInstance: org]
            }.to('createLogin')

            on('cancel').to('cancel')
        }

        createLogin {

            println(flow.org)

            println("create login")
        }

    }

    def saveTest() {
        def orgInstance = new Org(params)
        if (!orgInstance.save(flush: true)) {
            render(view: "create", model: [orgInstance: orgInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'org.label', default: 'Org'), orgInstance.id])
//        redirect(action: "show", id: orgInstance.id)
    }
}

class BuildOrgCommand implements Serializable {
    String description
    String inn
    String okved

    static constraints = {
        description(blank: false, nullable: false, maxSize: 50)
        inn(blank: false, nullable: false, maxSize: 50)
        okved(blank: false, nullable: false, maxSize: 50)
    }


}
