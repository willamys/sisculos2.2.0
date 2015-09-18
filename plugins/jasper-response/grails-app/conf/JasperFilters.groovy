import javax.sql.DataSource;


class JasperFilters {
	
	DataSource dataSource
	
	def filters = {
		all(controller: '*', action: '*') {
			before = {
				request.setAttribute("jasperJdbcConnection",dataSource?.connection)
				return true
			}
		}
	}
}
