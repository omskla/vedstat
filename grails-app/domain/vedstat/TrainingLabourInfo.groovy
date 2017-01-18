package vedstat
/**
 * Сведения по обучению по ОТ
 */
class TrainingLabourInfo {
    Date infDate
    Integer kolTrainWorker
    Integer yearTrainHear
    TrainingOrg orgTrainHead
/**
 * Обучено специалистов по ОТ
 */
    Integer kolTrainSpec
    Integer yearTrainSpec

    TrainingOrg orgTrainSpec

/**
 * Всего обучено работников
 */
    Integer itogoObuchSpec
    Integer itogoObuchSpecHead
    Integer itogoObuchWorker
    Boolean isPrikazOt //Наличие приказа о создании комиссии по проверке знаний требований ОТ (+ )
    transient int yearOfDate

    static belongsTo = [org: Org]
    static mapping = {
        yearOfDate(formula: "YEAR(inf_date)")
    }

    static constraints = {
        infDate nullable: false, validator: { value, obj ->
            return ckeckDate(value, obj)
        }
        kolTrainWorker(nullable: true)
        yearTrainHear(nullable: true)
        orgTrainHead(nullable: true)
        kolTrainSpec(nullable: true, validator: { value, obj ->
            return checkKolTrainSpec(obj, value);
        })
        yearTrainSpec(nullable: true)
        orgTrainSpec(nullable: true)
        isPrikazOt nullable: true    //Наличие приказа о создании комиссии по проверке знаний требований ОТ (+ )
        itogoObuchSpec nullable: true, validator: { val, obj ->
            return checkItogoObuchSpec(obj, val)

        }
        itogoObuchSpecHead(nullable: true)
        itogoObuchWorker(nullable: true)
    }
/**
 * обучено специалистов по ОТ д.б. равно или меньше
 * количества специалистов по охране труда из блока "Сведения о службе охраны труда";
 * @param trainingLabourInfo this
 * @param value value
 * @return true if ok
 */
    private static boolean checkKolTrainSpec(TrainingLabourInfo obj, def value) {
        def orgObj = obj.org
        Calendar cal = Calendar.getInstance()
        cal.setTime(obj.infDate)
        def year = cal.get(Calendar.YEAR)
        String query = "select kolLabourWorker from LabourServiceInfo where year(infDate) = ? and org_Id=?"
        def orgInfList = LabourServiceInfo.executeQuery(query, [year, orgObj.id])
        if (null != orgInfList && !orgInfList.isEmpty()) {
            def staff = orgInfList?.get(0)
            if (staff != null && value != null)
                return value <= staff
            else return false
        }
    }

    private static boolean ckeckDate(Date value, TrainingLabourInfo obj) {
        Calendar valCal = Calendar.getInstance()
        valCal.setTime(value)
        def critList = TrainingLabourInfo.createCriteria().list {
            eq("org", obj.org)
            eq("yearOfDate", valCal.get(Calendar.YEAR))
            if (null != obj.id)
                notEqual("id", obj.id)
        }
        return null == critList || critList.isEmpty()
    }

    /**
     * всего обучено работников д.б. равно или меньше численности работников из блока "Общая информация об организации".
     * @param obj obj
     * @param val val
     * @return true if ok
     */
    private static boolean checkItogoObuchSpec(TrainingLabourInfo obj, def val) {
        def orgObj = obj.org
        Calendar cal = Calendar.getInstance()
        cal.setTime(obj.infDate)
        def year = cal.get(Calendar.YEAR)
        String query = "select staff from OrgInformation  where year(infDate) = ? and org_Id=?"
        def orgInfList = OrgInformation.executeQuery(query, [year, orgObj.id])
        if (null != orgInfList && !orgInfList.isEmpty()) {
            def staff = orgInfList?.get(0)
            if (staff != null && val != null)
                return val <= staff
            else return false
        }
    }

    String toString() {
        StringBuilder sb = new StringBuilder("");
        sb.append(infDate.format("dd.MM.yyyy"))
        if (yearTrainHear != null)
            sb.append(" год обучения руководителя " + yearTrainHear)
        if (kolTrainSpec != null)
            sb.append(", Обучено специалистов по ОТ " + kolTrainSpec)
        if (yearTrainSpec != null)
            sb.append(", год обучения " + yearTrainSpec)
        if (isPrikazOt != null && isPrikazOt)
            sb.append(", наличие приказа")
        return sb.toString()
    }
}
