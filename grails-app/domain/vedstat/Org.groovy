package vedstat

class Org implements Serializable {
    def utilService
    enum SearchCategories {
        description("наименование"),
        area("район"),
        inn("ИНН"),
        fio("ФИО руководителя"),
        okved("ОКВЭД")
        final String value

        SearchCategories() {}

        SearchCategories(String value) {
            this.value = value
        }

        String getKey() {
            name()
        }

        String toString() {
            value
        }
    }


    String description
    OrgType orgType
    MunicArea area

    String inn
    String okved
    GroupOkved groupOkved
    static hasMany = [orgInf              : OrgInformation,
                      labourServiceInfo   : LabourServiceInfo,
                      trainingLabourInfo  : TrainingLabourInfo,
                      instructions        : Instruction,
                      attestation         : Attestation,
                      buildinhExpluatation: BuildingExpluatation,
                      unluck              : Unlucky,
                      verification        : Verification]
//    static belongsTo = User
    String guid
    HeadOrg headOrg
    Status status

    static constraints = {
        description(nullable: false)
        orgType(nullable: true)
        area(nullable: true)
        inn(nullable: true, matches: "[0-9]+")
        okved(nullable: false, blank: false)
        groupOkved(nullable: true)
        orgInf(nullable: true)
        labourServiceInfo(nullable: true)
        trainingLabourInfo(nullable: true)
        attestation(nullable: true)
        buildinhExpluatation(nullable: true)
        instructions(nullable: true)
        headOrg nullable: true
        guid(nullable: true)
        status nullable: true, blank: true
        verification nullable: true
    }

    String toString() {
        description.toString()
    }

    def afterUpdate = {
        updateGroupOkved(this)
    }

    def afterInsert = {
        updateGroupOkved(this)
    }

    def afterDelete = {

    }

    def updateGroupOkved(Org thisOrg) {
        String okved = thisOrg.okved
        if (okved != null && !okved.equals("")) {
            utilService.updateGroupOkved(thisOrg)
        }
    }

}

