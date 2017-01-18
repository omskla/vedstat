package vedstat

import org.apache.commons.lang.time.DateUtils

/**
 * Аттестация рабочих мест
 */
class Attestation {
//    def static native staff
    Date infDate
    /**
     * Общее количество рабочих мест
     */
    Integer kolWorkingPlace
    /**
     * Количество рабочих мест, подлежащих аттестации
     */
    Integer kolWorkingPlaceToAttest
    AttestationOrg attestationOrg
    Integer dateSert
    /**
     * Всего аттестовано рабочих мест<br>
     */
    Integer kolAttestationPlace
    /**
     * Работников, занятых на аттестованных рабочих местах
     */
    Integer kolWorkerAttestationPlace
    /**
     * Работников, занятых на аттестованных рабочих местах из них женщин
     */
    Integer kolWomenAttestation
    /**
     * Количество рабочих мест с 1 и 2 классом условий труда
     */
    Integer kolRabMest1_2
    /**
     * Работников, занятых на этих рабочих местах
     */
    Integer kolWorker1_2
    /**
     * из них женщин
     */
    Integer kolWomen1_2
    /**
     * Количество рабочих мест с 3 классом условий труда
     */
    Integer kolRabMest3
    Integer kolWorker3
    Integer kolWomen3
    /**
     * Количество рабочих мест с 4 классом условий труда
     */
    Integer kolRabMest4
    Integer kolWorker4
    Integer kolWomen4

    Integer kolRabMestTravm3
    Integer kolWorkerTravm3
    Integer kolWomenTravm3
    Integer kolRabMestSizFail
    Integer kolWorkerSizFail
    Integer kolWomenSizFail

    Boolean isGosExpertiza
    Boolean isMeropriatie
    Boolean isCertDoverie

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
        kolWorkingPlace(nullable: true, matches: "[0-9]+", validator: { val, obj ->
            return checkKolWorkingPlace(obj, val)
        })

        kolWorkingPlaceToAttest(nullable: true, matches: "[0-9]+")
        attestationOrg(nullable: true)
        dateSert(nullable: true)
        kolAttestationPlace(nullable: true, matches: "[0-9]+", validator: { val, obj ->
            return checkKolAttestationPlace(obj, val)
        })
        kolWorkerAttestationPlace(nullable: true, matches: "[0-9]+", validator: { val, obj ->
            return checkKolWorkerAttestationPlace(obj, val)
        })
        kolWomenAttestation(nullable: true, matches: "[0-9]+", validator: { val, obj ->
            return checkKolWomenAttestation(obj, val)

        })

        kolRabMest1_2(nullable: true, matches: "[0-9]+")
        kolWorker1_2(nullable: true, matches: "[0-9]+")
        kolWomen1_2(nullable: true, matches: "[0-9]+")

        kolRabMest3(nullable: true, matches: "[0-9]+")
        kolWorker3(nullable: true, matches: "[0-9]+")
        kolWomen3(nullable: true, matches: "[0-9]+")

        kolRabMest4(nullable: true, matches: "[0-9]+")
        kolWorker4(nullable: true, matches: "[0-9]+")
        kolWomen4(nullable: true, matches: "[0-9]+")

        kolRabMestTravm3(nullable: true, matches: "[0-9]+")
        kolWorkerTravm3(nullable: true, matches: "[0-9]+")
        kolWomenTravm3(nullable: true, matches: "[0-9]+")

        kolRabMestSizFail(nullable: true, matches: "[0-9]+")
        kolWorkerSizFail(nullable: true, matches: "[0-9]+")
        kolWomenSizFail(nullable: true, matches: "[0-9]+")

        isMeropriatie(nullable: true)
        isGosExpertiza(nullable: true)
        isCertDoverie(nullable: true)
        org(nullable: false)
    }

    /**
     * Работников, занятых на аттестованных рабочих местах из них женщин
     * @param obj this
     * @param val value
     * @return true if ok
     */
    private static boolean checkKolWomenAttestation(Attestation obj, def val) {
        int a = obj.kolWomen1_2 ?: 0
        int b = obj.kolWomen3 ?: 0
        int c = obj.kolWomen4 ?: 0

        if (val != null) {
            def orgObj = obj.org
            Calendar cal = Calendar.getInstance()
            cal.setTime(obj.infDate)
            def year = cal.get(Calendar.YEAR)
            String query = "select staff from OrgInformation  where year(infDate) = ? and org_Id=?"
            def orgInfList = OrgInformation.executeQuery(query, [year, orgObj.id])
            if (null != orgInfList && !orgInfList.isEmpty()) {
                def staff = orgInfList?.get(0)

            return val = (a + b + c) && val <= staff
            }
            return true
        }
        return true
    }

    /**
     * Общее количество рабочих мест
     * @param obj Attestation
     * @param val value
     * @return true if ok
     */
    private static boolean checkKolWorkingPlace(Attestation obj, int val) {
        if (obj.kolWorkingPlaceToAttest != null)
            val >= obj.kolWorkingPlaceToAttest
        Integer kol = (obj.kolAttestationPlace == null) ? 0 : obj.kolAttestationPlace
        if (kol != null) {
            return val >= kol
        }
        return true
    }

    /**
     * Работников, занятых на аттестованных рабочих местах
     * равно или меньше численности работников из блока "Общая информация об организации"; <br>
     * равно сумме работников на рабочих местах с 1 и 2 классом условий труда
     * + работников на рабочих местах с 3 классом условий труда
     * + работников на рабочих местах с 4 классом условий труда;
     * @param obj this
     * @param val value
     * @return true if ok
     */
    private static boolean checkKolWorkerAttestationPlace(Attestation obj, def val) {
        int a = obj.kolWorker1_2 ?: 0
        int b = obj.kolWorker3 ?: 0
        int c = obj.kolWorker4 ?: 0
        if (val != null) {
            def orgObj = obj.org
            Calendar cal = Calendar.getInstance()
            cal.setTime(obj.infDate)
            def year = cal.get(Calendar.YEAR)
            String query = "select staff from OrgInformation  where year(infDate) = ? and org_Id=?"
            def orgInfList = OrgInformation.executeQuery(query, [year, orgObj.id])
            if (null != orgInfList && !orgInfList.isEmpty()) {
                def staff = orgInfList?.get(0)

            return val = (a + b + c) && val <= staff
            }
            return true
        }
        return true
    }

    /** Всего аттестовано рабочих мест
     * равно или менее чем Общее количество рабочих мест <br>
     * равно сумме: количество рабочих мест с 1 и 2 классом условий труда
     * + количество рабочих мест с 3 классом условий труда
     * + количество рабочих мест с 4 классом условий труда;
     * @param obj this
     * @param val value
     * @return true if ok
     */
    private static boolean checkKolAttestationPlace(Attestation obj, def val) {
        int aa = obj.kolRabMest1_2 ?: 0
        int bb = obj.kolRabMest3 ?: 0
        int cc = obj.kolRabMest4 ?: 0
        if (null != val) {
            return val = (aa + bb + cc) && val <= obj.kolWorkingPlace
        } else {
            return true
        }
    }

    private static boolean checkDate(Date valu, Attestation obj) {

//        def orgObj = obj.org
//        Calendar cal = Calendar.getInstance()
//        cal.setTime(obj.infDate)
//        def year = cal.get(Calendar.YEAR)
//        String query = "select staff from OrgInformation  where year(infDate) = ? and org_Id=?"
//        def orgInfList = OrgInformation.executeQuery(query, [year, orgObj.id])
//        if (null != orgInfList && !orgInfList.isEmpty()) {
//            staff = orgInfList?.get(0)
//        }


        Calendar cal = Calendar.getInstance()
        cal.setTime(valu)
        def critList = Attestation.createCriteria().list {
            eq("org", obj.org)
            eq("yearOfDate", cal.get(Calendar.YEAR))
            if (null != obj.id)
                notEqual("id", obj.id)
        }
        return null == critList || critList.isEmpty()
    }


    String toString() {
        infDate.format("dd.MM.yyyy")
    }
}
