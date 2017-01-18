package vedstat

class OrgInformation {
    def utilService

    Date infDate
    String headOrg
    String tel
    String fax
    String adress
    String adressfact
    String email
    Integer staff
    Integer women
    transient int yearOfDate
//    transient Integer numYear
    static belongsTo = [org: Org]
    static mapping = {
//        numYear(formula: 'select count(*) from unlucky')
        yearOfDate(formula: "YEAR(inf_date)")

    }
    static constraints = {
        infDate nullable: false, validator: { value, obj ->
            return checkDate(value, obj)
        }
        headOrg(nullable: true)
        tel(nullable: true)
        fax(nullable: true)
        adress(nullable: true)
        adressfact(nullable: true)
        email(nullable: true, email: true)
        staff(nullable: true)
        women(nullable: true)
    }

    private static boolean checkDate(Date value,OrgInformation obj) {
        Calendar valCal = Calendar.getInstance()
        valCal.setTime(value)
        def critList = OrgInformation.createCriteria().list {
            eq("org", obj.org)
            eq("yearOfDate", valCal.get(Calendar.YEAR))
            if (null != obj.id)
                notEqual("id", obj.id)
        }
        if (null == critList || critList.isEmpty())
            return true
        else return false
    }

    String toString() {
        infDate.format("dd.MM.yyyy") + " Руководитель " + headOrg + " тел. " + tel + " факс " + fax

    }


}