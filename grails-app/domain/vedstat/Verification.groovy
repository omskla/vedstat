package vedstat

class Verification {
    Date verificationDate
    String description
    Boolean isRepair
    Boolean isResolve

    VerificationStatus verificationStatus
    static belongsTo = [org: Org]
    static constraints = {
        verificationDate(nullable: false)
        description(nullable: false)
        verificationStatus(nullable: false)
        isRepair(nullable: true)
        isResolve(nullable: true)
    }

    String toString() {
        description
    }

//    def afterUpdate = {
//        def inf = new Org()
//        inf = this
//        String okved = inf.okved
//        if (okved != null && !okved.equals("")) {
//            inf = utilService.updateGroupOkved(inf)
//        }
//    }

    def afterInsert = {
        def obj = new Verification()
        obj = this
        obj.org
        if (obj.org == null || "bad".equals(obj.verificationStatus.code))
            return
        def verList = Verification.findAllByOrgAndVerificationDateLessThanEqualsAndIdNotEqual(obj.org, obj.verificationDate, obj.id)
        for (Verification ver : verList) {
            if (ver.id != obj.id) {
                ver.isResolve = true
            }

        }
    }
}
