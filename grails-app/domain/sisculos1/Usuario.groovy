package sisculos1

class Usuario {

    String login
	String senha
	int permissao
		
	static constraints = {
		login (blank:false, unique:true, size: 5..15)
		senha (blank:false, size: 8..8)
		permissao(blank: false,size: 1..1)
	}
}

