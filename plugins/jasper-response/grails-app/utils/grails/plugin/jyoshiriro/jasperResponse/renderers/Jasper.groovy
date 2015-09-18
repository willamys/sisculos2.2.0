package grails.plugin.jyoshiriro.jasperResponse.renderers


import grails.converters.XML;

import java.sql.Connection

import javax.servlet.http.HttpServletResponse

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.groovy.grails.web.converters.AbstractConverter
import org.codehaus.groovy.grails.web.converters.Converter
import org.codehaus.groovy.grails.web.converters.exceptions.ConverterException
import org.codehaus.groovy.grails.web.converters.marshaller.ObjectMarshaller
import org.codehaus.groovy.grails.web.sitemesh.GrailsContentBufferingResponse

/**
 * Jasper Render class. Use an Map object as parameter <i>(Example: <b>render params as JASPER</b>)</i>. <br/>
 * This Map may contain report parameters and plugin configuration parameters, as follows:<br/>
 * <p>Configuration Parameters:
 * <ul>
 * <li><b>jasperSourceName</b> - Name of Jasper file (by default, it follows Grails convention)</li>
 * <li><b>jasperDownloadName</b> - Name of downloaded file (by default, it follows Grails convention)</li>
 * <li><b>jasperForceDownload</b> - Force (<b>true</b>) or not (<b>false</b>) the generated file download (Default: (<b>false</b>))</li>
 * <li><b>jasperRenderType</b> - Render Type. Default: <i>"pdf"</i>. Another option: <i>"htmlFile"</i></li>
 * </ul>
 * </p>
 * @author Jose Yoshiriro jyoshiriro@gmail.com
 *
 */
class Jasper extends AbstractConverter<JasperWriter> implements Converter<JasperWriter> {

	public static final Log log = LogFactory.getLog(Jasper.class);
	
	static String WEBAPPROOTPATH
	static boolean ON_AS
	
	Writer out
	
	Object target
	
	public Jasper() {
		
	}
	
	public Jasper(Object target) {
		this();
		this.target=target
	}
	
	@Override
	public void render(Writer out) throws ConverterException {
		this.out= out
		
	}

	@Override
	public void render(HttpServletResponse response) throws ConverterException {
		
		GrailsContentBufferingResponse r = response as GrailsContentBufferingResponse
		Connection connection = r.webAppContext.request.getAttribute('jasperJdbcConnection')

		def uri = r.webAppContext.request.requestURI
		
		if (!(target instanceof Map))
			throw new MissingPropertyException("No Map used into \"render\" closure. Example: \"render params as Jasper\"")
		
		Map params = target
		
		if (params.empty) log.warn("Map is empty from ${uri}.")

		if ((!params.controller) && (!params.action)) {
			def pathS = uri.split("/")
			params.controller=pathS[pathS.size()-2]
			params.action=pathS[pathS.size()-1]
		}
		String relativePath = params.jasperSourceName?.startsWith("/")?(ON_AS?"":"web-app"):"${ON_AS?'WEB-INF/':''}grails-app/views/${params.controller}/"
			
		String renderType = params.containsKey('jasperRenderType')?params.jasperRenderType:"Pdf"
		String jasperFile = params.containsKey('jasperSourceName')?params.jasperSourceName.replace('.jasper', ''):params.action
		Boolean forceDownload = params.containsKey('jasperForceDownload')?params.jasperForceDownload as Boolean:false
		
		String downloadFileName = params.containsKey('jasperDownloadName')?params.jasperDownloadName:jasperFile
		downloadFileName += (renderType=="Pdf"?".pdf":".html").toLowerCase()
		
		String path = "${WEBAPPROOTPATH}${relativePath}${jasperFile}.jasper"
		
		Class jrm = null
		try {
			jrm = Class.forName("net.sf.jasperreports.engine.JasperRunManager")
		} catch (e){
			throw new ClassNotFoundException("net.sf.jasperreports.engine.JasperRunManager not found. Have you installed any Jasper Library?")
		}

		def jasperResponseStream = jrm.invokeMethod("runReportTo${renderType.capitalize()}", [path,params,connection] as Object[])
		
		byte[] responseStream = jasperResponseStream instanceof byte[]?jasperResponseStream:new File(jasperResponseStream).bytes
		
		response.setHeader("Content-Disposition","${forceDownload?'attachment':'inline'};filename=${downloadFileName}");
		response.setContentType(renderType.equalsIgnoreCase("pdf")?"application/pdf":"text/html")
		response.setContentLength(responseStream.size())
		response.outputStream << responseStream
		
		render(response.writer)
		
	}

	@Override
	public JasperWriter getWriter() throws ConverterException {
		return new JasperWriter(writer:out);
	}

	@Override
	public void convertAnother(Object o) throws ConverterException {
	}

	@Override
	public void build(Closure c) throws ConverterException {

	}

	@Override
	public ObjectMarshaller<? extends Converter> lookupObjectMarshaller(
			Object target) {
		return null;
	}

	@Override
	public void setTarget(Object target) {
			this.target = target
	}

}
