package vedstat

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class QueryDb {
    String code
    String queryStr
    String name
    static constraints = {
        name nullable: false
        queryStr type:'text', nullable: true  ,maxSize: 100000
        code nullable: false

    }
    String toString(){
        name
    }
}
