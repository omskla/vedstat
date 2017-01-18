grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.7
grails.project.source.level = 1.7
grails.tomcat.jvmArgs= ["-Xms256m",  "-Xmx1024m", "-XX:PermSize=512m", "-XX:MaxPermSize=512m"]
//grails.project.war.file = "target/${appName}-${appVersion}.war"

// uncomment (and adjust settings) to fork the JVM to isolate classpaths
//grails.project.fork = [
//   run: [maxMemory:1024, minMemory:64, debug:false, maxPerm:256]
//]

grails.project.dependency.resolver = "maven" // or ivy

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
//    checksums true // Whether to verify checksums on resolve
//    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()
        mavenRepo 'http://repo.spring.io/milestone'
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.
//        compile 'net.sourceforge.jtds:jtds:1.3.1'

      //  compile 'net.sf.jxls:1.0.2'
        // runtime 'mysql:mysql-connector-java:5.1.20'
    }

    plugins {
        compile ':webflow:2.0.8.1'
        runtime ":jquery:1.10.2.2"
        runtime ":resources:1.2.1"
        compile ":scaffolding:2.0.1"
        runtime ':hibernate:3.6.10.6'
        build ":tomcat:7.0.47"
        runtime ":database-migration:1.3.8"
        compile ':cache:1.1.1'
        compile ":spring-security-core:2.0-RC2"
        compile ":ajaxdependancyselection:0.21"
        compile ":jquery-ui:1.10.3"
        compile "org.grails.plugins:tooltip:0.8"
        compile ":mybatis:0.0.3"
    }
}
