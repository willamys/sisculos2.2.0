package sisculos1
import sisculos1.Usuario
import static org.springframework.http.HttpStatus.*
import org.springframework.dao.DataIntegrityViolationException

class CurriculoController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def initialCurriculo() {
		render(template:'form_cep')
	}

	def consultaCEP = {
		//obtendo o valor digitado no formulario e retirando o '-' para pesquisa
		def cep = params.cep.toString().replace("-","")
		Endereco cepInstance = new Endereco(cep);
		//jogando os dados no array de string
		String[] getdados = cepInstance.consultaCEP();
		//criando a litsta do tipo CEP para ser usada no retorno dos dados no ajax
		def list = Endereco.list();
		//verificando se o campo bairro veio preenchido com a informaçãpo 'soap:Server', isso quer dizer que não houve retorno
		if(!getdados[0].toString().equalsIgnoreCase("soap:Server")){
			//adicionando os dados ao objeto CEP para ser enviado ao formulario
			cepInstance.bairro = getdados[0];
			cepInstance.cep  = getdados[1];
			cepInstance.cidade  = getdados[2];
			cepInstance.endereco = getdados[5];
			cepInstance.complemento = getdados[4];
			cepInstance.uf = getdados[7];
			list.add(cepInstance)
			//renderizando o form com as informações obtidas no webservice
			render(template:'form_cep', model:[consultacep:list])
		}else{
			// se não houve retorno nullamos a list e rederizamos os campos vazios
			list.add(null)
			render(template:'form_cep', model:[consultacep:list])
		}
	}

	def lista(Integer max) {
		Usuario  usuario_login = session.user
		if(usuario_login != null){
			if(usuario_login.permissao == 0 || usuario_login.permissao == 2){
				params.max = Math.min(max ?: 10, 100)
				[curriculoInstance: Curriculo.list(params), curriculoInstanceCount: Curriculo.count()]
			}else if(usuario_login.permissao == 1 ){
				//tras somente o curriculo do usuário logado
				Curriculo teste = usuario_login ? Curriculo.findByUsuario(usuario_login) : []
				if(teste != null){
					[curriculoInstanceList: Curriculo.findAllWhere(usuario: teste.usuario), curriculoInstanceCount: Curriculo.count()]
				}
			}
		}else{
			flash.message = "Desculpe, precisa estar autenticado no sistema."
			redirect(controller:'usuario',action:'login')
		}
	}
	
	def index(Integer max) {
		def curriculoInstanceList
		def curriculoInstanceCount
		Usuario  usuario_login = session.user
		if(usuario_login != null){
			if(usuario_login.permissao == 0 || usuario_login.permissao == 2){
				params.max = Math.min(max ?: 10, 100)
				if(params.query == null){
					curriculoInstanceList = Curriculo.list(params)
					curriculoInstanceCount = Curriculo.count()
				}else{
					curriculoInstanceList = Curriculo.findAllByNomeLike('%'+params.query+'%')
					curriculoInstanceCount = Curriculo.findAllByNomeLike('%'+params.query+'%').size()
				}
				[curriculoInstanceList: curriculoInstanceList, curriculoInstanceCount: curriculoInstanceCount]
			}else if(usuario_login.permissao == 1 ){
				//tras somente o curriculo do usuário logado
				Curriculo teste = usuario_login ? Curriculo.findByUsuario(usuario_login) : []
				if(teste != null){
					[curriculoInstanceList: Curriculo.findAllWhere(usuario: teste.usuario), curriculoInstanceCount: Curriculo.count()]
				}
			}
		}else{
			flash.message = "Desculpe, precisa estar autenticado no sistema."
			redirect(controller:'usuario',action:'login')
		}
	}
	
	def tt(Integer max) {
		def curriculoInstanceList
		def curriculoInstanceCount
		Usuario  usuario_login = session.user
		if(usuario_login != null){
			if(usuario_login.permissao == 0 || usuario_login.permissao == 2){
				params.max = Math.min(max ?: 10, 100)
				if(params.query == null){
					curriculoInstanceList = Curriculo.list(params)
					curriculoInstanceCount = Curriculo.count()
				}else{
					curriculoInstanceList = Curriculo.findAllByNomeLike('%'+params.query+'%')
					curriculoInstanceCount = Curriculo.findAllByNomeLike('%'+params.query+'%').size()
				}
				[curriculoInstanceList: curriculoInstanceList, curriculoInstanceCount: curriculoInstanceCount]
			}else if(usuario_login.permissao == 1 ){
				//tras somente o curriculo do usuário logado
				Curriculo teste = usuario_login ? Curriculo.findByUsuario(usuario_login) : []
				if(teste != null){
					[curriculoInstanceList: Curriculo.findAllWhere(usuario: teste.usuario), curriculoInstanceCount: Curriculo.count()]
				}
			}
		}else{
			flash.message = "Desculpe, precisa estar autenticado no sistema."
			redirect(controller:'usuario',action:'login')
		}
	}
	
	
	

	def show(Long id) {
		def curriculoInstance = Curriculo.get(id)
		if (!curriculoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), id])
			redirect(controller:'curriculo',action:'index')
			return
		}
		[curriculoInstance: curriculoInstance]

	}

	def create() {
		Usuario usuario_login = session.user
		if(usuario_login != null){
			if( usuario_login.permissao == 1){
				//testar se existe curriculo cadastrado para o usuario
				Curriculo teste_curriculo_usuario = usuario_login ? Curriculo.findByUsuario(usuario_login) : []
				if(teste_curriculo_usuario != null){ // se já houver curriculo, não permite cadastrar
					flash.message = "Desculpe, o usuario ja possui um curriculo cadastrado."
					redirect(controller:'curriculo',action:'index')
				}else{
					[curriculoInstance: new Curriculo(params)]
				}
			}else if(usuario_login.permissao == 0){
				[curriculoInstance: new Curriculo(params)]
			}else{
				flash.message = "Desculpe, o usuario nao tem permissao."
				redirect(controller:'curriculo',action:'index')
			}
		}else{
			flash.message = "Desculpe, precisa estar autenticado no sistema."
			redirect(controller:'curriculo',action:'index')
		}
	}


	def save() {
		def curriculoInstance = new Curriculo(params)
		Usuario usuario_login = session.user
		if(usuario_login != null){
			if(usuario_login.permissao == 0 || usuario_login.permissao == 1){
				if (!curriculoInstance.save(flush: true)) {
					render(view: "create", model: [curriculoInstance: curriculoInstance])
					return
				}

				flash.message = message(code: 'default.created.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), curriculoInstance.id])
				redirect(action: "show", id: curriculoInstance.id)
			}else{
				flash.message = "Desculpe, o usuario nao tem permissao."
				redirect(controller:'curriculo',action:'index')
			}
		}else{
			flash.message = "Desculpe, precisa estar autenticado no sistema."
			redirect(controller:'curriculo',action:'index')

		}
	}

	def edit(Long id) {
		def curriculoInstance = Curriculo.get(id)
		Usuario usuario_login = session.user
		if(usuario_login != null){
			if(usuario_login.permissao == 0 || usuario_login.permissao == 1){
				if (!curriculoInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), id])
					redirect(controller:'curriculo',action:'index')
					return
				}

				[curriculoInstance: curriculoInstance]
			}else{
				flash.message = "Desculpe, o usuario nao tem permissao."
				redirect(controller:'curriculo',action:'index')
			}
		}else{
			flash.message = "Desculpe, precisa estar autenticado no sistema."
			redirect(controller:'curriculo',action:'index')

		}

	}


	def update(Long id, Long version) {
		def curriculoInstance = Curriculo.get(id)
		Usuario usuario_login = session.user
		if(usuario_login != null){
			if(usuario_login.permissao == 0 || usuario_login.permissao == 1){
				if (!curriculoInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), id])
					redirect(controller:'curriculo',action:'index')
					return
				}

				if (version != null) {
					if (curriculoInstance.version > version) {
						curriculoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
								[message(code: 'Curriculo.label', default: 'Curriculo')] as Object[],
								"Another user has updated this Teste while you were editing")
						render(view: "edit", model: [curriculoInstance: curriculoInstance])
						return
					}
				}

				curriculoInstance.properties = params

				if (!curriculoInstance.save(flush: true)) {
					render(view: "edit", model: [curriculoInstance: curriculoInstance])
					return
				}

				flash.message = message(code: 'default.updated.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), curriculoInstance.id])
				redirect(action: "show", id: curriculoInstance.id)
			}else{
				flash.message = "Desculpe, o usuario nao tem permissao."
				redirect(controller:'curriculo',action:'index')
			}
		}else{
			flash.message = "Desculpe, precisa estar autenticado no sistema."
			redirect(controller:'curriculo',action:'index')

		}
	}
	
	def delete(Long id) {
		def curriculoInstance = Curriculo.get(id)
		Usuario usuario_login = session.user
		if(usuario_login != null){
			if(usuario_login.permissao == 0 ){
				if (!curriculoInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), id])
					redirect(controller:'curriculo',action:'index')
					return
				}

				try {
					curriculoInstance.delete(flush: true)
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), id])
					redirect(controller:'curriculo',action:'index')
				}
				catch (DataIntegrityViolationException e) {
					flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), id])
			}
		}else{
			flash.message = "Desculpe, o usuario nao tem permissao."
			redirect(controller:'curriculo',action:'index')
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
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
