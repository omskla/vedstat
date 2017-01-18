package vedstat

import grails.converters.JSON
import groovy.sql.GroovyRowResult
import net.sf.jxls.transformer.XLSTransformer

class StatisticController {
    def utilService

    def index() {}

    def statisticByArea() {}

    def statisticByOkvedGroup() {}

    def statisticByObl() {}

    def statisticByOiv() {}

    def statisticByOkved() {}

    def statisticOt4() {}

    def ohvat() {}


    def infMonitor() {
        def year = params.year
        if (!year) {
            render(['itog': 'не заполнена дата!!'] as JSON)
            return
        }
        List<GroovyRowResult> res = utilService.executeQueryDbManyRows("infMonitorX", year, null, "in");
        List<GroovyRowResult> resArea = utilService.executeQueryDbManyRows("infMonitorX", year, null, "not in");
        //  List<GroovyRowResult> res = null;
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        Calendar cal = Calendar.getInstance()
        cal.setTime(new Date())
        String dtquery = cal.get(Calendar.DAY_OF_MONTH).toString() + "." + (cal.get(Calendar.MONTH) + 1).toString() + "." + (cal.get(Calendar.YEAR)).toString()
        bean.put("bean", res)
        bean.put("beanArea", resArea)
        bean.put("year", year)
        bean.put("dtquery", dtquery)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath

        if (null != res) {
//            transformer.groupCollection("bean.a8")
            transformer.transformXLS(baseFolder + "\\infMonitorTemplateX.xls", bean, baseFolder + "\\out\\infMonitorX.xls")
        }
        File file = new File(baseFolder + "\\out\\infMonitorX.xls");
        if (file.exists()) {
//            response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
//            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
//            response.outputStream << file.bytes
        }

        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }

    def ohvatYear() {
        Map bean = new HashMap();
        String queryStr = QueryDb.findByCode("ohvatYear").queryStr;
        def user = User.findByUsername(sec.loggedInUserInfo(field: 'username'))

        def area = user.area
        def id
        if (null == area)
            id = -1
        else id = area.id

        String actQuery = queryStr.replaceAll("#area#", String.valueOf(id))

        List<GroovyRowResult> res = utilService.execQuery(actQuery);

        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        bean.put("dtquery", utilService.getDateString(new Date()));
        bean.put("res", res);
        bean.put("area", (null != area)? area.declension : "");

        XLSTransformer transformer = new XLSTransformer();
        if (null != res)
            transformer.transformXLS(baseFolder + "\\ohvat.xls", bean, baseFolder + "\\out\\ohvat.xls");

        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }

    def aivOt() {
        def year = params.year
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }


        List<GroovyRowResult> res = utilService.executeQueryDbManyRows("aivot", year, null, null);
        XLSTransformer transformer = new XLSTransformer();
        Map bean = new HashMap();
        bean.put("bean", res)
        bean.put("year", year)
        bean.put("dtquery", utilService.getDateString(new Date()))
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath
        if (null != res)
            transformer.transformXLS(baseFolder + "\\aivOtTemplate.xls", bean, baseFolder + "\\out\\aivOt.xls");
        File file = new File(baseFolder + "\\out\\aivOt.xls");
        if (file.exists()) {
//            response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
//            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
//            response.outputStream << file.bytes
        }

        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }


    def aivOb() {
        def year = params.year
        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }
        List<GroovyRowResult> res = utilService.executeQueryDbManyRows("aivob", year, null, null);
        //  List<GroovyRowResult> res = null;
        XLSTransformer transformer = new XLSTransformer();
        Calendar cal = Calendar.getInstance()
        cal.setTime(new Date())
        String dtquery = cal.get(Calendar.DAY_OF_MONTH).toString() + "." + (cal.get(Calendar.MONTH) + 1).toString() + "." + (cal.get(Calendar.YEAR)).toString()

        Map bean = new HashMap();
        bean.put("bean", res)
        bean.put("year", year)
        bean.put("dtquery", dtquery)
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath

        if (null != res)
            transformer.transformXLS(baseFolder + "\\aivObTemplate.xls", bean, baseFolder + "\\out\\aivOb.xls");
        File file = new File(baseFolder + "\\out\\aivOb.xls");
        if (file.exists()) {
//            response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
//            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
//            response.outputStream << file.bytes
        }
        println(params)
        withFormat {
            json {
                render(['itog': 'скачать', 'action': params.action] as JSON)

            }
        }
    }

    def downloadByTemplateName() {
        def templateName = params.templateName
        def baseFolder = grailsApplication.mainContext.getResource("templates").file.absolutePath

        File file = new File(baseFolder + "\\out\\"+templateName);
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=${file.name}")
            response.outputStream << file.bytes
        }
    }


    def getIndexByArea() {
        def year = params.year
        def idSpan = params.idSpan
        def area = params.area
        def itogo

        if (!year) {
            render(['itog': 'Не заполнена дата!'] as JSON)
            return
        }


        if (!area) {
            render(['itog': 'Не выбрано муниципальное образование!'] as JSON)
            return
        }
        //первый коэффициент считаем
        if ("freqTravmSpan".equals(params.idSpan)) {
            itogo = utilService.indexByArea(year, area, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }

        if ("hardTravmSpan".equals(params.idSpan)) {
            itogo = utilService.indexByArea(year, area, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }

        if ("deathSpan".equals(params.idSpan)) {
            itogo = utilService.indexByArea(year, area, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }
        if ("k1Span".equals(params.idSpan)) {
            itogo = utilService.indexByArea(year, area, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }

        if ("k3Span".equals(params.idSpan)) {
            itogo = utilService.indexByArea(year, area, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }



        if ("k6Span".equals(params.idSpan)) {
            itogo = utilService.indexByArea(year, area, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }
        if ("k7Span".equals(params.idSpan)) {
            itogo = utilService.indexByArea(year, area, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }

        if ("k8Span".equals(params.idSpan)) {
            itogo = utilService.indexByArea(year, area, idSpan)
            withFormat {
                json {
                    render(['itog': itogo] as JSON)

                }
            }

        }

    }
}
