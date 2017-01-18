package vedstat

class Unlucky {
    Date infDate
    Integer kolWorkerProfZab
    Integer kolWomenProfZab
    Integer kolUnluck         //+itogo - vmeste
    Integer kolGroupUnluck
    Integer kolDeathUnluck        //itogoDeath   vmeste
    Integer kolHardUnluck            //itogoHard vmeste
    Integer itogo
    Integer itogoWomen
    Integer itogoDeath
    Integer itogoDeathWomen
    Integer itogoHard
    Integer itogoHardWomen
    Integer kolDaysNot

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
        kolWorkerProfZab nullable: true
        kolWomenProfZab nullable: true
        kolUnluck nullable: true, validator: { val, obj ->
            if (val != null)
                obj.itogo != null
        }
        kolGroupUnluck nullable: true
        kolDeathUnluck nullable: true, validator: { val, obj ->
            if (val != null)
                obj.itogoDeath != null
        }
        kolHardUnluck nullable: true, validator: { val, obj ->
            if (val != null)
                obj.itogoHard != null
        }
        itogo nullable: true, validator: { val, obj ->
            if (val != null)
                obj.kolUnluck != null
        }
        itogoWomen nullable: true
        itogoDeath nullable: true, validator: { val, obj ->
            if (val != null)
                obj.kolDeathUnluck != null
        }
        itogoDeathWomen nullable: true
        itogoHard nullable: true, validator: { val, obj ->
            if (val != null)
                obj.kolHardUnluck != null
        }
        itogoHardWomen nullable: true
        kolDaysNot nullable: true
        org nullable: false
    }

    private static boolean checkDate(Date value, Unlucky obj) {
        Calendar valCal = Calendar.getInstance()
        valCal.setTime(value)
        def critList = Unlucky.createCriteria().list {
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
