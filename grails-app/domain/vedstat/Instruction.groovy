package vedstat

class Instruction {
    Date infDate
    Integer itogoInstructions
    Integer procentInstructions
    Boolean regJournal
    Boolean issueJournal

    Integer kolKabinetOt
    Integer kolUgolOt
    Boolean isKomitetOt
    Integer kolUpolnomochOt
    Integer yearKollectDog
    Integer procentSiz

    Boolean notNeedSiz


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
        itogoInstructions(nullable: true, min: 0)
        procentInstructions(nullable: true, min: 0, max: 100)
        regJournal(nullable: true)
        issueJournal(nullable: true)
        kolKabinetOt(nullable: true, min: 0)
        kolUgolOt(nullable: true, min: 0)
        isKomitetOt(nullable: true)
        kolUpolnomochOt(nullable: true, min: 0)
        yearKollectDog(nullable: true, min: 2008, max: 2030)
        procentSiz(nullable: true, min: 0, max: 101)
        notNeedSiz(nullable: true)


    }

    private static boolean checkDate(Date value, Instruction obj) {
        Calendar valCal = Calendar.getInstance()
        valCal.setTime(value)
        def critList = Instruction.createCriteria().list {
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
        infDate.format("dd.MM.yyyy")
    }
}
