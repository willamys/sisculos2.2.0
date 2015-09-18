class JasperResponseGrailsPlugin {

	def version = "1.0.1"
    
    def grailsVersion = "2.0 > *"
    
    def dependsOn = [:]
    
    def pluginExcludes = [
        "grails-app/views/error.gsp"
    ]
	
    def title = "Jasper Response Plugin"
    def author = "José Yoshiriro"
    def authorEmail = "jyoshiriro@gmail.com"
    def description = '''\
Easy way to render JasperReports as PDF or HTML in Grails Projects.
'''

    def documentation = "http://code.google.com/p/grails-jasper-response-plugin/w/list"

    def license = "APACHE"

    def developers = [ [ name: "Jose Yoshiriro", email: "jyoshiriro@gmail.com" ]]

    def issueManagement = [ system: "Google Code", url: "http://code.google.com/p/grails-jasper-response-plugin/issues/list" ]

    def scm = [ url: "https://grails-jasper-response-plugin.googlecode.com/svn/" ]

    def doWithApplicationContext = { applicationContext ->
		String rootPath = applicationContext.getServletContext().getRealPath("/")
		grails.plugin.jyoshiriro.jasperResponse.renderers.Jasper.setON_AS(rootPath.indexOf("web-app")<0)
		if (!grails.plugin.jyoshiriro.jasperResponse.renderers.Jasper.isON_AS()) {
			rootPath = rootPath[0..rootPath.indexOf("web-app")-1]
		}
		grails.plugin.jyoshiriro.jasperResponse.renderers.Jasper.setWEBAPPROOTPATH(rootPath)
    }


}
