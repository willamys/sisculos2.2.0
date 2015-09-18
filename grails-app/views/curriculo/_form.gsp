<%@ page import="sisculos1.Curriculo" %>
<%@ page import="sisculos1.Usuario" %>

<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="curriculo.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${curriculoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="curriculo.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" maxlength="14" required="" value="${curriculoInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'rg', 'error')} required">
	<label for="rg">
		<g:message code="curriculo.rg.label" default="Rg" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rg" required="" value="${curriculoInstance?.rg}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="curriculo.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${curriculoInstance.constraints.sexo.inList}" required="" value="${curriculoInstance?.sexo}" valueMessagePrefix="curriculo.sexo"/>

</div>

<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="curriculo.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${curriculoInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'telefone', 'error')} required">
	<label for="telefone">
		<g:message code="curriculo.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefone" maxlength="14" required="" value="${curriculoInstance?.telefone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'datanasc', 'error')} required">
	<label for="datanasc">
		<g:message code="curriculo.datanasc.label" default="Datanasc" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="datanasc" maxlength="10" required="" value="${curriculoInstance?.datanasc}"/>

</div>
<%--<fieldset class="embedded"><legend><g:message code="curriculo.endereco.label" default="Endereco" /></legend>--%>




<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'cep', 'error')} required">
	<label for="endereco.cep">
		<g:message code="curriculo.endereco.cep.label" default="Cep" />
		<span class="required-indicator">*</span>
	</label>
		<input type="text" name="cep" onblur="greetName(this.value)"
		required="" id="cep" maxlength="9" size="9"
		value="${curriculoInstance?.cep}" />
</div>

<%--div do ajax--%>

<%--fim div ajax--%>

			<script  type="text/javascript">
			<%--chama o método inicial com o form cep vazio--%>
            <g:remoteFunction controller="curriculo" action="initialCurriculo" update="form_cep"/>
            	function greetName(cep) {
			<%--chama o método consultacep para efetuar a pesquisa e retorna com o fomcep preenchido--%>
               	 <g:remoteFunction controller="curriculo" action="consultaCEP" update="form_cep" params="'cep='+cep"/>
                }</script>

<div id="form_cep">
<%--<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'endereco.version', 'error')} required">--%>
<%--	<label for="endereco.version">--%>
<%--		<g:message code="curriculo.endereco.version.label" default="Version" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:field name="version" type="number" value="${enderecoInstance.version}" required=""/>--%>
<%----%>
<%--</div>--%>
</div>
<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'formacao', 'error')} required">
	<label for="formacao">
		<g:message code="curriculo.formacao.label" default="Formacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="formacao" required="" value="${curriculoInstance?.formacao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'experiencia', 'error')} required">
	<label for="experiencia">
		<g:message code="curriculo.experiencia.label" default="Experiencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="experiencia" required="" value="${curriculoInstance?.experiencia}"/>

</div>
<% Usuario usuario_login = session.user %>
<g:if test="${usuario_login.permissao == 0}">
<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="curriculo.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${sisculos1.Usuario.list()}" optionKey="id" required="" value="${curriculoInstance?.usuario?.id}" class="many-to-one"/>
</div>
</g:if>
<g:else>
<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="curriculo.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${sisculos1.Usuario.findAllWhere(login: session.user.login)}" optionKey="id" required="" value="${curriculoInstance?.usuario?.id}" class="many-to-one"/>
</div>
</g:else>


