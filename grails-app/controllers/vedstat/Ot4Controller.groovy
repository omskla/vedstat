package vedstat

import grails.converters.JSON
import groovy.sql.GroovyRowResult
import net.sf.jxls.transformer.XLSTransformer

import java.sql.DriverManager

class Ot4Controller {
    def utilService

    def statisticOt4ByArea() {
        def year = params.year
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }

        boolean isGrandOrg = Boolean.valueOf(params.grandOrg)


        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("year", year);
        paramMap.put("operator", "in");
        paramMap.put("staff", "1"); //default
        if (isGrandOrg) {
            paramMap.put("staff", "250");
        }

        List<GroovyRowResult> resOmsk = utilService.executeQueryDbManyRowsByParamMap("ot4areaX", paramMap);
        paramMap.put("operator", "not in");
        List<GroovyRowResult> resArea = utilService.executeQueryDbManyRowsByParamMap("ot4areaX", paramMap);
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("beanOmsk", resOmsk)
        bean.put("beanArea", resArea)
        bean.put("year", year)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        transformer.transformXLS(baseFolder + "\\ot4TemplateX.xls", bean, baseFolder + "\\out\\ot4Area.xls");

        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }


    def downloadOt4ByArea() {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\ot4Area.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }

    }

    def statisticOt4ByOkved() {
        def year = params.year
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }
        boolean isGrandOrg = Boolean.valueOf(params.grandOrg)
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("year", year);
        paramMap.put("staff", "1"); //default
        if (isGrandOrg) {
            paramMap.put("staff", "250");
        }

        List<GroovyRowResult> res = utilService.executeQueryDbManyRowsByParamMap("ot4okved", paramMap);
        //  List<GroovyRowResult> res = null;
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", res)
        bean.put("year", year)
        bean.put("okvedCount", GroupOkved.count())
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        if (null != res)
            transformer.transformXLS(baseFolder + "\\ot4Template.xls", bean, baseFolder + "\\out\\ot4Okved.xls");

        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }

    def downloadOt4ByOkved() {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\ot4Okved.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }

    }

    def statisticOt4ByParent() {
        def year = params.year
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }
        boolean isGrandOrg = Boolean.valueOf(params.grandOrg)
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("year", year);
        paramMap.put("staff", "1"); //default
        if (isGrandOrg) {
            paramMap.put("staff", "250");
        }

        List<GroovyRowResult> res = utilService.executeQueryDbManyRowsByParamMap("ot4parent", paramMap);
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", res)
        bean.put("year", year)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        if (null != res)
            transformer.transformXLS(baseFolder + "\\ot4Template.xls", bean, baseFolder + "\\out\\ot4Parent.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }

    def downloadOt4ByParent() {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\ot4Parent.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }

    }

    def statisticOt4ByMt() {
        def year = params.year
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }
        boolean isGrandOrg = Boolean.valueOf(params.grandOrg)
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("year", year);
        paramMap.put("staff", "1"); //default
        if (isGrandOrg) {
            paramMap.put("staff", "250");
        }
        List<GroovyRowResult> res = utilService.executeQueryDbManyRowsByParamMap("ot4mt", paramMap);

        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", res)
        bean.put("year", year)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        if (null != res)
            transformer.transformXLS(baseFolder + "\\ot4Template.xls", bean, baseFolder + "\\out\\ot4Mt.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }

    def downloadOt4ByMt() {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\ot4Mt.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }




    def statisticOt4ByOiv() {
        def year = params.year
        def oiv = params.oiv
        println params
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }
        if (!oiv) {
            render(['itog': 'Не заполнен оив!'] as JSON)
            return
        }
        List<GroovyRowResult> res = utilService.executeQueryDbManyRows("ot4Oiv", year, null, oiv);
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", res)
        bean.put("year", year)
        bean.put("oiv", oiv)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        if (null != res)
            transformer.transformXLS(baseFolder + "\\ot4Template.xls", bean, baseFolder + "\\out\\ot4Oiv.xls");
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }

    def downloadOt4ByOiv() {
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        File file = new File(baseFolder + "\\out\\ot4Oiv.xls");
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }

}
