package vedstat

class BuildingExpluatation {
    Date infDate
    Boolean isKomissiaOsmotr
    Boolean isPrikazHeadOtv
    Boolean isAktOsmotrBuilding
    Boolean istehJur
    Boolean isArenda
    /**
     * Затраты на ОТ всего (тыс. руб.)
     */
    Double summ
    Double summPerWorker
    Double summToOt

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
        isKomissiaOsmotr nullable: true
        isPrikazHeadOtv nullable: true
        isAktOsmotrBuilding nullable: true
        istehJur nullable: true
        isArenda nullable: true
        summ(nullable: true)
        summPerWorker(nullable: true)
        summToOt(nullable: true)
    }

    private static boolean checkDate(Date value, BuildingExpluatation obj) {
        Calendar valCal = Calendar.getInstance()
        valCal.setTime(value)
        def critList = BuildingExpluatation.createCriteria().list {
            eq("org", obj.org)
            eq("yearOfDate", valCal.get(Calendar.YEAR))
            if (null != obj.id)
                notEqual("id", obj.id)
        }
        return null == critList || critList.isEmpty()
    }


    String toString() {
        infDate.format("dd.MM.yyyy")
    }

}

