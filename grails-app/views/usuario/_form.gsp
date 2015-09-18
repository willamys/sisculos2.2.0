<%@ page import="sisculos1.Usuario" %>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="usuario.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" maxlength="15" required="" value="${usuarioInstance?.login}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} required">
	<label for="senha">
		<g:message code="usuario.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="senha" maxlength="8" required="" type="password" value="${usuarioInstance?.senha}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'permissao', 'error')} required">
	<label for="permissao">
		<g:message code="usuario.permissao.label" default="Permissao" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="permissao" required="" value="${fieldValue(bean: usuarioInstance, field: "permissao")}"
		from="${['0':'Administrador','1':'Aluno','2':'Empresa']}"
		optionKey="key" optionValue="value"
		noSelection="['':'Selecione o tipo de usuário -']" />
</div>

