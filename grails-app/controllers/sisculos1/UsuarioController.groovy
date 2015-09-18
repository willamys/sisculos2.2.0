package sisculos1

import static org.springframework.http.HttpStatus.*
import org.springframework.dao.DataIntegrityViolationException
class UsuarioController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def login = {}

	def initial = {}

	def authenticate = {

		if(!(params.equals("") || params == null)){
			Usuario usuario_login =  Usuario.findByLoginAndSenha(params.login, params.senha)
			//consulta se o login e senha existem no banco de dados
			//verifica se houve retorno na consulta para autenticar no sistema
			if(usuario_login!= null){
				session.user = usuario_login
				flash.message = "Oi, ${usuario_login.login}!"
				redirect(controller:'usuario',action:'initial')
			}else{
				flash.message = "Desculpe, ${params.login}. Tente Novamente."
				redirect(controller:'usuario',action:'login')
			}
		}else{
			redirect(controller:'usuario',action:'login')
		}
	}

	def logout = {
		if(session.user == null){ //verificar se a sessão já é nula e não mostra o nome do ultimo login
			flash.message = "Desculpe, pagina inacessivel. Tente Novamente."
			session.user = null
			redirect(controller:'usuario',action:'login')
		}else{	//se a sessão não for nula, mostra o nome do último login
			flash.message = "Tchau, ${session.user.login}!"
			session.user = null
			redirect(controller:'usuario',action:'login')
		}
	}

	def index(Integer max) {
		Usuario usuario_login = session.user
		if(usuario_login != null){
			if(usuario_login.permissao == 0 ){
				params.max = Math.min(max ?: 10, 100)
				[usuarioInstanceList: Usuario.list(params), usuarioInstanceCount: Usuario.count()]
			}else if(usuario_login.permissao == 1 || usuario_login.permissao == 2){
				[usuarioInstanceList: Usuario.findAllWhere(login: usuario_login.login), usuarioInstanceCount: Usuario.count()]
			}
		}else{
			flash.message = "Desculpe, precisa estar autenticado no sistema."
			redirect(controller:'usuario',action:'login')
		}
	}


	def show(Long id) {
		Usuario usuario_login = session.user
		def usuarioInstance = Usuario.get(id)
		if(usuario_login != null){
			if(usuario_login.permissao == 0){
				[usuarioInstance: usuarioInstance]
			}else if((usuario_login.permissao == 1 || usuario_login.permissao == 2) && (usuario_login.id == usuarioInstance.id)){
				[usuarioInstance: usuarioInstance]
			}else{
				flash.message = "Desculpe, o usuario nao tem permissao."
				redirect(controller:'usuario',action:'initial')
				return
			}
		}else{
			flash.message = "Desculpe, precisa estar autenticado no sistema."
			redirect(controller:'usuario',action:'login')
			return
		}
	}

	def create() {
		Usuario usuario_login = session.user
		if(usuario_login != null && usuario_login.permissao == 0){
			[usuarioInstance: new Usuario(params)]
		}else{
			flash.message = "Desculpe, o usuario nao tem permissao."
			redirect(controller:'usuario',action:'initial')
		}
	}

	def create_comum() {
		Usuario usuario_login = session.user
		if(usuario_login == null){
			session.user = null
			[usuarioInstance: new Usuario(params)]
		}else{
			flash.message = ""
			redirect(controller:'usuario',action:'login')
		}
	}

	def save() {
		def usuarioInstance = new Usuario(params)
		if (!usuarioInstance.save(flush: true)) {
			render(view: "create", model: [usuarioInstance: usuarioInstance])
			return
		}
		Usuario usuario_login = session.user
		if(usuario_login == null){
			flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.login])
			redirect(controller:'usuario',action:'login')
		}else{
			flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
			redirect(action: "show", id: usuarioInstance.id)
		}

	}

	def edit(Long id) {
		def usuarioInstance = Usuario.get(id)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
			redirect(controller:'usuario',action:'initial')
			return
		}

		[usuarioInstance: usuarioInstance]

	}


	def update(Long id, Long version) {
		def usuarioInstance = Usuario.get(id)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
			redirect(action: "show", id: usuarioInstance.id)
			return
		}

		if (version != null) {
			if (usuarioInstance.version > version) {
				usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[message(code: 'usuario.label', default: 'Usuario')] as Object[],
						"Another user has updated this Teste while you were editing")
				render(view: "edit", model: [usuarioInstance: usuarioInstance])
				return
			}
		}

		usuarioInstance.properties = params

		if (!usuarioInstance.save(flush: true)) {
			render(view: "edit", model: [usuarioInstance: usuarioInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])

		//recriando a sessão com os dados alterados
		Usuario usuario_login = session.user //obtendo instancia atual
		Usuario usuario_update =  Usuario.findByLoginAndSenha(params.login, params.senha)
		//verifica se ele tá alterando os dados do seu usuario
		if(usuario_login.login.equals(usuario_update.login)){
			session.user = usuario_login
			redirect(action: "show", id: usuarioInstance.id)
		}else{
			redirect(action: "show", id: usuarioInstance.id)
		}
	}


	def delete(Long id) {
		def usuarioInstance = Usuario.get(id)
		Usuario usuario_login = session.user
		if(usuario_login != null){
			if(usuario_login.permissao == 0 ){
				if (!usuarioInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
					redirect(controller:'usuario',action:'index')
					return
				}

				try {
					usuarioInstance.delete(flush: true)
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
					redirect(controller:'usuario',action:'index')
				}
				catch (DataIntegrityViolationException e) {
					flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
				}
			}else{
				flash.message = "Desculpe, o usuario nao tem permissao."
				redirect(controller:'usuario',action:'index')
			}
		}
		else{
			flash.message = "Desculpe, precisa estar autenticado no sistema."
			redirect(controller:'usuario',action:'index')
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
