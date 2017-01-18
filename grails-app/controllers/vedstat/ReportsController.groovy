package vedstat

import grails.converters.JSON
import groovy.sql.GroovyRowResult
import net.sf.jxls.transformer.XLSTransformer

class ReportsController {
    def utilService

    def index() {}

    def byRequest() {}

    def repArea() {
        def year = params.year
        def area = params.area
        def okved = params.okved
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }

        if (!area) {
            render(['itog': 'Не выбрано муниципальное образование!'] as JSON)
            return
        }

        List<GroovyRowResult> resOmsk;
        Map bean = new HashMap();
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        String templateFileStr;
        String outFileStr;
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("year", year);
        paramMap.put("area", area);

        if(!"".equals(okved)) {
            paramMap.put("okved", okved);
            templateFileStr = baseFolder + "\\83pAreaOkved.xls"
            outFileStr = baseFolder + "\\out\\83pAreaOkved.xls"
            bean.put("okved", GroupOkved.get(new Long(okved)).description)

            resOmsk = utilService.executeQueryDbManyRowsByParamMap("83pAreaOkved", paramMap);
        } else {
            templateFileStr = baseFolder + "\\83pArea.xls"
            outFileStr = baseFolder + "\\out\\83pArea.xls"
            resOmsk = utilService.executeQueryDbManyRowsByParamMap("83pArea", paramMap);
        }

        XLSTransformer transformer = new XLSTransformer();
        bean.put("bean", resOmsk)
        bean.put("dtStr", utilService.getDateString(new Date()))
        bean.put("year", year)
        bean.put("area", MunicArea.get(new Long(area)).declension)

        transformer.transformXLS(templateFileStr, bean, outFileStr);
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }

    }

    def repArmOkved() {

        def year = params.year
        def area = params.area
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }

        if (!area) {
            render(['itog': 'Не выбрано муниципальное образование!'] as JSON)
            return
        }
        List<GroovyRowResult> resOmsk = utilService.executeQueryDbManyRows("armOkved", year, null, area);

        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", resOmsk)
        bean.put("dtStr", utilService.getDateString(new Date()))
        bean.put("year", year)
        bean.put("area", MunicArea.get(new Long(area)).declension2)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        transformer.transformXLS(baseFolder + "\\armOkved.xls", bean, baseFolder + "\\out\\armOkved.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }

    }

    def notOt() {
        def year = params.year
        def area = params.area
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }

        if (!area) {
            render(['itog': 'Не выбрано муниципальное образование!'] as JSON)
            return
        }
        List<GroovyRowResult> resOmsk = utilService.executeQueryDbManyRows("notOcenkaOt", year, null, area);
println(resOmsk)
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", resOmsk)
        bean.put("dtStr", utilService.getDateString(new Date()))
        bean.put("year", year)
        bean.put("area", MunicArea.get(new Long(area)).declension)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        transformer.transformXLS(baseFolder + "\\notOt.xls", bean, baseFolder + "\\out\\notOt.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }
    //todo
    def infObuchenie() {
        def year = params.year
        def area = params.area
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }

        if (!area) {
            render(['itog': 'Не выбрано муниципальное образование!'] as JSON)
            return
        }

        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("year", year);
        paramMap.put("area", area);


        List<GroovyRowResult> resOmsk = utilService.executeQueryDbManyRowsByParamMap("infObuchenie", paramMap);
println(resOmsk)
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", resOmsk)
        bean.put("dtStr", utilService.getDateString(new Date()))
        bean.put("year", year)
        bean.put("area", MunicArea.get(new Long(area)).declension)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        transformer.transformXLS(baseFolder + "\\infObuchenie.xls", bean, baseFolder + "\\out\\infObuchenie.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }
    //todo
    def infAttestation() {
        def year = params.year
        def area = params.area
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }

        if (!area) {
            render(['itog': 'Не выбрано муниципальное образование!'] as JSON)
            return
        }

        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("year", year);
        paramMap.put("area", area);

        List<GroovyRowResult> resOmsk = utilService.executeQueryDbManyRowsByParamMap("infAttestation", paramMap);
        println(resOmsk)
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", resOmsk)
        bean.put("dtStr", utilService.getDateString(new Date()))
        bean.put("year", year)
        bean.put("area", MunicArea.get(new Long(area)).declension)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        transformer.transformXLS(baseFolder + "\\infAttestation.xls", bean, baseFolder + "\\out\\infAttestation.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }



    def downloadRepArea = {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\83pArea.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }

    def downloadRepAreaOkved = {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\83pAreaOkved.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }

    def downloadRepArmOkved = {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\armOkved.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }

    def downloadNotOt = {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\notOt.xls");
        if (file.exists()) {
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }

    def more100() {
        def year = params.year
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }
        List<GroovyRowResult> resOmsk = utilService.executeQueryDbManyRows("more100", year, null, null);
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", resOmsk)
        bean.put("dtStr", utilService.getDateString(new Date()))
        bean.put("year", year)
//        bean.put("area",MunicArea.get(new Long(area)).declension)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        transformer.transformXLS(baseFolder + "\\more100.xls", bean, baseFolder + "\\out\\more100.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }

    }

    def downloadMore100 = {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\more100.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }

    def kolInf() {
        def year = params.year
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }
        List<GroovyRowResult> resOmsk = utilService.executeQueryDbManyRows("kolInf", year, null, null);
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", resOmsk)
        bean.put("dtquery", utilService.getDateString(new Date()))
        bean.put("year", year)
//        bean.put("area",MunicArea.get(new Long(area)).declension)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        transformer.transformXLS(baseFolder + "\\kolInf.xls", bean, baseFolder + "\\out\\kolInf.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }

    }

    def downloadKolInf = {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\kolInf.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }

    def downloadInfObuchenie = {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\infObuchenie.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }


    def downloadInfAttestation = {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\infAttestation.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }
    def usloviaOt() {}

    def areaInf() {
//        def year = params.year
//        if(!year)
//        {
//            render(['itog': 'Не заполнена дата!'] as JSON)
//            return
//        }

        List<GroovyRowResult> resOmsk = utilService.executeQueryDbManyRows("areaInf", null, null, null);
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        //  println(resOmsk)
        bean.put("bean", resOmsk)
        bean.put("dtStr", utilService.getDateString(new Date()))
//        bean.put("year",year)
//        bean.put("area",MunicArea.get(new Long(area)).declension)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
//           if(null!=resOmsk)
        //    transformer.groupCollection("bean.area");
        transformer.transformXLS(baseFolder + "\\areaInf.xls", bean, baseFolder + "\\out\\areaInf.xls");
//        withFormat {
//            json {
//                render(['itog': 'скачать','action':params.action] as JSON)
//
//            }
//        }


        File file = new File(baseFolder + "\\out\\areaInf.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }

    }

    def financeReports() {}

    def fssArea() {
        def year = params.year
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }

        List<GroovyRowResult> resOmsk = utilService.executeQueryDbManyRows("fssArea", year, null, null);
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", resOmsk)
        bean.put("dtquery", utilService.getDateString(new Date()))
        bean.put("year", year)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        transformer.transformXLS(baseFolder + "\\fssAreaTemplate.xls", bean, baseFolder + "\\out\\fssArea.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)
            }
        }


    }

    def downloadFssArea = {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\fssArea.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }

    def fssOkved() {
        def year = params.year
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }

        List<GroovyRowResult> resOmsk = utilService.executeQueryDbManyRows("fssOkved", year, null, null);
        println(resOmsk)
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", resOmsk)
        bean.put("dtquery", utilService.getDateString(new Date()))
        bean.put("year", year)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        transformer.transformXLS(baseFolder + "\\fssOkvedTemplate.xls", bean, baseFolder + "\\out\\fssOkved.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)
            }
        }


    }
    def downloadFssOkved = {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\fssOkved.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }


}
