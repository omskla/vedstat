package vedstat
/**
 * Сведения о службе охраны труда
 */
class LabourServiceInfo {
    Date infDate
    /**
     * Количество специалистов по охране труда
     */
    Integer kolLabourWorker
    TypeOtWorker typeOtWorker                  // аутсорсинг||освобожденные
    String fioWorker
    String tel
    Double workExperience
    Education education
    /**
     * Наличие приказа о системе управления ОТ
     */
    boolean isPrikazOt
    transient int yearOfDate
    static belongsTo = [org: Org]
    static mapping = {
        yearOfDate(formula: "YEAR(inf_date)")
    }

    static constraints = {
        infDate nullable: false, validator: { value, obj ->
            return checkDate(value, obj)
        }
        kolLabourWorker(nullable: true)
        typeOtWorker(nullable: true, defaultValue: null)
        fioWorker(nullable: true)
        tel(nullable: true)
        workExperience(nullable: true, scale: 1)
        education(nullable: true)

    }

    private static boolean checkDate(Date value, LabourServiceInfo obj) {
        Calendar valCal = Calendar.getInstance()
        valCal.setTime(value)
        def critList = LabourServiceInfo.createCriteria().list {
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
        StringBuilder sb = new StringBuilder("");
        sb.append(infDate.format("dd.MM.yyyy"))
        if (kolLabourWorker != null)
            sb.append(" количество специалистов " + kolLabourWorker)
        if (typeOtWorker != null)
            sb.append(", " + typeOtWorker)
        if (isPrikazOt != null && isPrikazOt == true)
            sb.append(", наличие приказа")
        return sb.toString()
        // infDate.format("dd.MM.yyyy")
    }

//    def afterUpdate = {
//        def inf = new LabourServiceInfo()
//        inf = this
//        if (inf.status.code.equals("act")) {
//            LabourServiceInfo.findAllByOrgAndIdNotEqual(inf.org, inf.id).each { info ->
//                info.status = Status.findByCode("noact")
//                info.save()
//            }
//        }
//    }
//    def afterInsert = {
//        def inf = new LabourServiceInfo()
//        inf = this
//        if (inf.status.code.equals("act")) {
//            LabourServiceInfo.findAllByOrgAndIdNotEqual(inf.org, inf.id).each { info ->
//                info.status = Status.findByCode("noact")
//                info.save()
//            }
//        }
//    }
//
//    def afterDelete = {
//        def inf = new LabourServiceInfo()
//        inf = this
//
//
//        if (inf.status.code.equals("act")) {
//            def query = LabourServiceInfo.where {
//                org == inf.org
//            }
//
//            def res = query.find(max:1,sort:"infDate",order:"desc")
//            res.status = Status.findByCode("act")
//            res.save()
//        }
//    }


}
