package vedstat

import grails.util.BuildSettingsHolder
import groovy.sql.GroovyRowResult
import groovy.sql.Sql
import net.sf.jxls.transformer.XLSTransformer

import java.text.DateFormat
import java.text.SimpleDateFormat

//import org.docx4j.openpackaging.exceptions.Docx4JException
//import org.docx4j.openpackaging.packages.WordprocessingMLPackage
//import org.docx4j.wml.ContentAccessor
//import org.dom4j.Text
//
//import javax.xml.bind.JAXBElement
//import java.sql.PreparedStatement

class UtilService {
    static transactional = false

    def serviceMethod() {
    }
    def dataSource
    def grailsApplication
    def springSecurityService

    /**
     *
     * @param queryCode
     * @param yearStr
     * @param idOrg
     * @return Возвращает 1 строку
     */
    def executeQueryDb(String queryCode, String yearStr, String idOrg) {
        Sql sql = Sql.newInstance(dataSource)

        def res

        String queryStr = QueryDb.findByCode(queryCode).queryStr;
        String actQuery = queryStr.replaceAll("#year#", yearStr)
        if (idOrg != null)
            actQuery = actQuery.replaceAll("#idOrg#", idOrg)
        try {
            res = sql.firstRow(actQuery)

        } catch (Exception e) {
            println(e.getLocalizedMessage())
            sql.close()
        }
        sql.close()
        return res;
    }

    def List executeQueryDbManyRows(String queryCode, String yearStr, String idOrg, String operator) {
        Sql sql = Sql.newInstance(dataSource)
        def res
        String queryStr = QueryDb.findByCode(queryCode).queryStr;
        String actQuery
        if (yearStr != null)
            actQuery = queryStr.replaceAll("#year#", yearStr)
        if (idOrg != null)
            actQuery = actQuery.replaceAll("#idOrg#", idOrg)
        if (operator != null)
            actQuery = actQuery.replaceAll("#operator#", operator)

        try {
            res = sql.rows((actQuery == null) ? queryStr : actQuery)

        } catch (Exception e) {
            println(e.getLocalizedMessage())
            sql.close()
        }
        sql.close()
        return res;
    }

    def List executeQueryDbManyRowsByParamMap(String queryCode, Map<String, String> paramMap) {
        Sql sql = Sql.newInstance(dataSource)
        def res
        String queryStr = QueryDb.findByCode(queryCode).queryStr;
        for (String key : paramMap.keySet()) {
            queryStr = queryStr.replaceAll("#" + key + "#", paramMap.get(key))
        }
        try {
            res = sql.rows(queryStr)

        } catch (Exception e) {
            println(e.getLocalizedMessage())
            sql.close()
        }
        sql.close()

        return res;
    }






    def List execQuery(String queryCode) {
        Sql sql = Sql.newInstance(dataSource)
        def res
        try {
            res = sql.rows(queryCode)

        } catch (Exception e) {
            println(e.getLocalizedMessage())
            sql.close()
        }
        sql.close()
        return res;
    }

    def updateGroupOkved(Org inf) {
        String okved = inf.okved
        if (okved != null && !okved.equals("")) {
            switch (okved.substring(0, 2)) {
                case "01": inf.groupOkved = GroupOkved.findByCode("01"); break;
                case "02": inf.groupOkved = GroupOkved.findByCode("01"); break;
                case "05": inf.groupOkved = GroupOkved.findByCode("01"); break;

                case "10": inf.groupOkved = GroupOkved.findByCode("02"); break;
                case "11": inf.groupOkved = GroupOkved.findByCode("02"); break;
                case "12": inf.groupOkved = GroupOkved.findByCode("02"); break;
                case "13": inf.groupOkved = GroupOkved.findByCode("02"); break;
                case "14": inf.groupOkved = GroupOkved.findByCode("02"); break;
                case "23": inf.groupOkved = GroupOkved.findByCode("02"); break;
                case "24": inf.groupOkved = GroupOkved.findByCode("02"); break;
                case "25": inf.groupOkved = GroupOkved.findByCode("02"); break;
                case "26": inf.groupOkved = GroupOkved.findByCode("02"); break;

                case "15": inf.groupOkved = GroupOkved.findByCode("03"); break;
                case "16": inf.groupOkved = GroupOkved.findByCode("03"); break;
                case "17": inf.groupOkved = GroupOkved.findByCode("03"); break;
                case "18": inf.groupOkved = GroupOkved.findByCode("03"); break;
                case "19": inf.groupOkved = GroupOkved.findByCode("03"); break;
                case "37": inf.groupOkved = GroupOkved.findByCode("03"); break;

                case "20": inf.groupOkved = GroupOkved.findByCode("04"); break;
                case "21": inf.groupOkved = GroupOkved.findByCode("04"); break;
                case "36": inf.groupOkved = GroupOkved.findByCode("04"); break;

                case "22": inf.groupOkved = GroupOkved.findByCode("05"); break;

                case "27": inf.groupOkved = GroupOkved.findByCode("06"); break;
                case "28": inf.groupOkved = GroupOkved.findByCode("06"); break;

                case "29": inf.groupOkved = GroupOkved.findByCode("07"); break;
                case "30": inf.groupOkved = GroupOkved.findByCode("07"); break;
                case "31": inf.groupOkved = GroupOkved.findByCode("07"); break;
                case "33": inf.groupOkved = GroupOkved.findByCode("07"); break;

                case "32": inf.groupOkved = GroupOkved.findByCode("08"); break;

                case "34": inf.groupOkved = GroupOkved.findByCode("09"); break;
                case "35": inf.groupOkved = GroupOkved.findByCode("09"); break;

                case "40": inf.groupOkved = GroupOkved.findByCode("10"); break;
                case "41": inf.groupOkved = GroupOkved.findByCode("10"); break;

                case "45": inf.groupOkved = GroupOkved.findByCode("11"); break;

                case "50": inf.groupOkved = GroupOkved.findByCode("12"); break;
                case "51": inf.groupOkved = GroupOkved.findByCode("12"); break;
                case "52": inf.groupOkved = GroupOkved.findByCode("12"); break;

                case "55": inf.groupOkved = GroupOkved.findByCode("13"); break;

                case "60": inf.groupOkved = GroupOkved.findByCode("14"); break;
                case "61": inf.groupOkved = GroupOkved.findByCode("14"); break;
                case "62": inf.groupOkved = GroupOkved.findByCode("14"); break;
                case "63": inf.groupOkved = GroupOkved.findByCode("14"); break;
                case "64": inf.groupOkved = GroupOkved.findByCode("14"); break;

                case "65": inf.groupOkved = GroupOkved.findByCode("15"); break;
                case "66": inf.groupOkved = GroupOkved.findByCode("15"); break;
                case "67": inf.groupOkved = GroupOkved.findByCode("15"); break;

                case "70": inf.groupOkved = GroupOkved.findByCode("16"); break;

                case "71": inf.groupOkved = GroupOkved.findByCode("17"); break;
                case "72": inf.groupOkved = GroupOkved.findByCode("17"); break;
                case "74": inf.groupOkved = GroupOkved.findByCode("17"); break;

                case "75": inf.groupOkved = GroupOkved.findByCode("18"); break;

                case "73": inf.groupOkved = GroupOkved.findByCode("19"); break;
                case "80": inf.groupOkved = GroupOkved.findByCode("19"); break;

                case "85": inf.groupOkved = GroupOkved.findByCode("20"); break;

                case "92": inf.groupOkved = GroupOkved.findByCode("21"); break;

                case "90": inf.groupOkved = GroupOkved.findByCode("22"); break;
                case "91": inf.groupOkved = GroupOkved.findByCode("22"); break;
                case "93": inf.groupOkved = GroupOkved.findByCode("22"); break;

                default: inf.groupOkved = GroupOkved.findByCode("other"); break;

            }

        }
        return inf;
    }

    def searchOrgByFilters(params, MunicArea area) {
        if (!params.offset)
            params.offset = 0
        def searchFor = params.searchable
        def searchCategory = params.searchCategory
        def orgCriteria = Org.createCriteria()
        def searchResults = orgCriteria.list(max: params.max, offset: params.offset, sort: "okved") {
            switch (searchCategory) {
                case "description": ilike(searchCategory, "%${searchFor}%");
                    if (null != area)
                        eq("area", area)

                    break;

                case "inn":
                    ilike("inn", "%${searchFor}%");
                    if (null != area)
                        eq("area", area)
                    break;

                case "fio":
                    orgInf {
                        ilike("headOrg", "%${searchFor}%");
                    }
                    if (null != area)
                        eq("area", area)
                    break;

                case "okved":
                    ilike("okved", "${searchFor}%");
                    if (null != area)
                        eq("area", area)
                    break;

                case "area":
                    def areas = MunicArea.findAllByDescriptionLike("%${searchFor}%")
                    if (areas && !areas.isEmpty())
                        inList("area", areas)
                    else
                        eq("id", -1.longValue())
                    if (null != area)
                        eq("area", area)
                    break;

                default: break;
            }
        }
        [searchResults: searchResults.sort { it.okved }, searchResultSize: searchResults.getTotalCount()]
    }

    def indexByArea(String year, String idArea, String spanCode) {
        def freqTravmSpanByAreaQuery = "select  cast(sum(itogo) as numeric(12,2))*1000/sum(inf.staff) as itogo  from org_information inf \n" +
                "inner join org on inf.org_id = org.id and org.area_id = ${idArea} \n" +
                "left join unlucky  on unlucky.org_id = org.id and year(unlucky.inf_date)= ${year} " +
                "group by year(inf.inf_date) having year(inf.inf_date) = ${year}"

        def hardTravmSpanByAreaQuery = "select  cast(sum(kol_days_not) as numeric(10,4))/sum(itogo) as itogo  from unlucky\n" +
                "inner join org on org_id = org.id and org.area_id = ${idArea} \n" +
                "group by  year(inf_date) having year(inf_date) = ${year}"

        def deathSpanByAreaQuery = "select  cast(sum(kol_death_unluck) as numeric(10,4))*1000/sum(org_information.staff) as itogo  from org_information \n" +
                "inner join org on org_information.org_id = org.id and org.area_id = ${idArea} \n" +
                "left join unlucky  on unlucky.org_id = org.id and year(unlucky.inf_date)= ${year} " +
                "group by  year(org_information.inf_date) having year(org_information.inf_date) = ${year}"

        def k1Query = "SELECT cast(sum(itogo)*1000 as numeric(12,2)) /sum(org_information.staff) as itogo  from org_information\n" +
                "inner join org on org.id = org_information.org_id   and org.area_id = ${idArea} \n" +
                "left join unlucky on unlucky.org_id = org_information.org_id and year(unlucky.inf_date) = ${year}\n" +
                "where year(org_information.inf_date) = ${year}  "

        def k3Query = "SELECT cast(sum(kol_worker_prof_zab)*10000 as numeric(12,2)) /sum(org_information.staff) as itogo  from org_information\n" +
                "inner join org on org.id = org_information.org_id   and org.area_id = ${idArea} \n" +
                "left join unlucky on unlucky.org_id = org_information.org_id and year(unlucky.inf_date) = ${year}\n" +
                "where year(org_information.inf_date) = ${year}  "

        def k6Query = "select cast(sum(attestation.kol_rab_mest3)+sum(attestation.kol_rab_mest4) as numeric(12,2))/sum(attestation.kol_attestation_place)*100 as itogo \n" +
                        "from org_information \n" +
                        "inner join org on org_information.org_id = org.id and org.area_id = ${idArea}\n" +
                        "inner join attestation on attestation.org_id = org_information.org_id and year(attestation.inf_date) = ${year} \n" +
                        "where year(org_information.inf_date) = ${year} "
        def k7Query = "select cast(sum(attestation.kol_worker_attestation_place) as numeric(12,2))/sum(org_information.staff)*100 as itogo \n" +
                        "from org_information \n" +
                        "inner join org on org_information.org_id = org.id and org.area_id = ${idArea}\n" +
                        "left join attestation on attestation.org_id = org_information.org_id and year(attestation.inf_date) = ${year} \n" +
                        "where year(org_information.inf_date) = ${year} "
        def k8Query = "select count(org_information.id) as itogo \n" +
                        "from org_information \n" +
                        "inner join org on org_information.org_id = org.id and org.area_id = ${idArea}\n" +
                        "inner join attestation on attestation.org_id = org_information.org_id and year(attestation.inf_date) = ${year} and attestation.is_cert_doverie = 1 \n" +
                        "where year(org_information.inf_date) = ${year} "

        Sql sql = Sql.newInstance(dataSource)
        Map<String, String> queryMap = new HashMap<>();
        def results
        queryMap.put("freqTravmSpan", freqTravmSpanByAreaQuery)
        queryMap.put("hardTravmSpan", hardTravmSpanByAreaQuery)
        queryMap.put("deathSpan", deathSpanByAreaQuery)
        queryMap.put("hardTravmSpan", hardTravmSpanByAreaQuery)
        queryMap.put("k1Span", k1Query)
        queryMap.put("k3Span", k3Query)
        queryMap.put("k6Span", k6Query)
        queryMap.put("k7Span", k7Query)
        queryMap.put("k8Span", k8Query)

        results = sql.firstRow(queryMap.get(spanCode))
        sql.close()
        if (null == results || results.isEmpty()) {
            return ("Нет данных!!!");
        }

        return (null != results.get("itogo")) ? results.get("itogo") : "Нет данных!!!"
    }


    def indexByOkvedGroup(String year, String idOkvedGroup, String spanCode) {
        def freqTravmSpanByOkvedGroupQuery = "select  cast(sum(itogo) as numeric(10,4))*1000/sum(org_information.staff)  as itogo  from org_information\n" +
                "inner join org on org_information.org_id = org.id and org.group_okved_id = ${idOkvedGroup} \n" +
                "left join unlucky on org_information.org_id = unlucky.org_id and year(unlucky.inf_date)=${year} \n" +
                "group by year(org_information.inf_date) having year(org_information.inf_date) = ${year} "

        def hardTravmSpanByOkvedGroupQuery = "select  cast(sum(kol_days_not) as numeric(10,4))/sum(itogo) as itogo  from org_information\n" +
                "inner join org on org_id = org.id and org.group_okved_id = ${idOkvedGroup}\n" +
                "left join unlucky on org_information.org_id = unlucky.org_id and year(unlucky.inf_date)=${year} \n" +
                "group by year(org_information.inf_date) having year(org_information.inf_date) = ${year}"

        def deathSpanByOkvedGroupQuery = "select  cast(sum(kol_death_unluck) as numeric(10,4))*1000/sum(org_information.staff) as itogo  from org_information\n" +
                "inner join org on org_id = org.id and group_okved_id = ${idOkvedGroup}\n" +
                "left join unlucky on org_information.org_id = unlucky.org_id and year(unlucky.inf_date)=${year} \n" +
                "group by year(org_information.inf_date) having year(org_information.inf_date) = ${year}"

        Sql sql = Sql.newInstance(dataSource)
        Map<String, String> queryMap = new HashMap<>();
        def results
        queryMap.put("freqTravmSpan", freqTravmSpanByOkvedGroupQuery)
        queryMap.put("hardTravmSpan", hardTravmSpanByOkvedGroupQuery)
        queryMap.put("deathSpan", deathSpanByOkvedGroupQuery)

        results = sql.firstRow(queryMap.get(spanCode))

        sql.close()
        if (null == results || results.isEmpty()) {
            return ("Нет данных!!!");
        }

        return (null != results.get("itogo")) ? results.get("itogo") : "Нет данных!!!"

    }

    def getUser() {
        def auth = springSecurityService.principal
        def user = User.get(auth.id)
        return user
    }

    def getOrgByUser() {
        def auth = springSecurityService.principal
        def user = User.get(auth.id)

        def area = user.area
        def org = user.org
        return org
    }

    def getAreaByUser() {
        def auth = springSecurityService.principal
        def user = User.get(auth.id)
        def area = user.area
        return area
    }

    def getDateString(Date dt) {
        SimpleDateFormat dtFormat = new SimpleDateFormat("dd.MM.yyyy")
        if (null == dt)
            dt = new Date()
        return dtFormat.format(dt);
    }
}
