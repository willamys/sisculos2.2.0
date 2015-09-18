package sisculos1
import sisculos1.Usuario

class Curriculo {

    String nome
	String cpf
	String rg
	String sexo
	String email
	String telefone
	String formacao
	String experiencia
	String datanasc
	String bairro
	String cidade
	String complemento
	String endereco
	String uf
	String cep
	Usuario usuario

	static constraints = {
		nome(blank: false)
		cpf(unique: true, blank: false,size: 14..14)
		rg(blank: false)
		datanasc(blank: false,size: 10..10)
		sexo(inList:["M", "F"])
		cep(blank: false, size: 9..9)
		endereco(blank: false)
		complemento(blank: false)
		bairro(blank: false)
		cidade(blank: false)
		uf(blank: false,size:2..2)
		email(email: true, blank: false)
		telefone(blank: false,size: 14..14)
		formacao(blank: false)
		experiencia(blank: false)
	}
}
