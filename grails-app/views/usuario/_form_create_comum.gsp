<%@ page import="sisculos1.Usuario" %>

<% Usuario usuario_login = session.user %>
<g:if test="${(usuario_login != null) && (usuario_login.permissao == 1 || usuario_login.permissao == 2)}">
<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="usuario.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" readonly="readonly" maxlength="15" required="" value="${usuarioInstance?.login}"/>
</div>
</g:if>
<g:else>
<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="usuario.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" maxlength="15" required="" value="${usuarioInstance?.login}"/>
</div>
</g:else>
<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} required">
	<label for="senha">
		<g:message code="usuario.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="senha" maxlength="8" type="password" required="" value="${usuarioInstance?.senha}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'permissao', 'error')} required">
	<label for="permissao">
		<g:message code="usuario.permissao.label" default="Tipo de Usuário" />
		<span class="required-indicator">*</span>
	</label>

<g:if test="${usuario_login != null && usuario_login.permissao == 1}">
	<g:select name="permissao" required="" value="${fieldValue(bean: usuarioInstance, field: "permissao")}"
		from="${['1':'Aluno']}"
		optionKey="key" optionValue="value"
		noSelection="['':'Selecione o tipo de usuário -']" />
</g:if>
<g:elseif test="${usuario_login != null && usuario_login.permissao == 2}">
<g:select name="permissao" required="" value="${fieldValue(bean: usuarioInstance, field: "permissao")}"
		from="${['2':'Empresa']}"
		optionKey="key" optionValue="value"
		noSelection="['':'Selecione o tipo de usuário -']" />
</g:elseif>
<g:else>
<g:select name="permissao" required="" value="${fieldValue(bean: usuarioInstance, field: "permissao")}"
		from="${['1':'Aluno','2':'Empresa']}"
		optionKey="key" optionValue="value"
		noSelection="['':'Selecione o tipo de usuário -']" />
</g:else>
<%--		//<g:hiddenField name="permissao" value="${fieldValue(bean: usuarioInstance, field: "permissao")}"/>--%>
</div>

