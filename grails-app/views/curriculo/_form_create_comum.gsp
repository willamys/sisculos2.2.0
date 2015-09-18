<%@ page import="sisculos1.Curriculo"%>



<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'nome', 'error')} required">
	<label for="nome"> <g:message code="curriculo.nome.label"
			default="Nome" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${curriculoInstance?.nome}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'cpf', 'error')} required">
	<label for="cpf"> <g:message code="curriculo.cpf.label"
			default="Cpf" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" maxlength="14" required=""
		value="${curriculoInstance?.cpf}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'rg', 'error')} required">
	<label for="rg"> <g:message code="curriculo.rg.label"
			default="Rg" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="rg" required="" value="${curriculoInstance?.rg}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'sexo', 'error')} required">
	<label for="sexo"> <g:message code="curriculo.sexo.label"
			default="Sexo" /> <span class="required-indicator">*</span>
	</label>
	<g:select name="sexo"
		from="${curriculoInstance.constraints.sexo.inList}" required=""
		value="${curriculoInstance?.sexo}" valueMessagePrefix="curriculo.sexo" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'email', 'error')} required">
	<label for="email"> <g:message code="curriculo.email.label"
			default="Email" /> <span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required=""
		value="${curriculoInstance?.email}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'telefone', 'error')} required">
	<label for="telefone"> <g:message
			code="curriculo.telefone.label" default="Telefone" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="telefone" maxlength="14" required=""
		value="${curriculoInstance?.telefone}" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'datanasc', 'error')} required">
	<label for="datanasc"> <g:message
			code="curriculo.datanasc.label" default="Datanasc" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="datanasc" maxlength="10" required=""
		value="${curriculoInstance?.datanasc}" />

</div>
<%--<fieldset class="embedded"><legend><g:message code="curriculo.endereco.label" default="Endereco" /></legend>--%>


<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'endereco.cep', 'error')} required">
	<label for="endereco.cep"> <g:message
			code="curriculo.endereco.cep.label" default="Cep" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="cep" maxlength="9" required=""
		value="${enderecoInstance?.cep}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'endereco.bairro', 'error')} required">
	<label for="endereco.bairro"> <g:message
			code="curriculo.endereco.bairro.label" default="Bairro" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="bairro" required=""
		value="${enderecoInstance?.bairro}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'endereco.cidade', 'error')} required">
	<label for="endereco.cidade"> <g:message
			code="curriculo.endereco.cidade.label" default="Cidade" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="cidade" required=""
		value="${enderecoInstance?.cidade}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'endereco.complemento', 'error')} required">
	<label for="endereco.complemento"> <g:message
			code="curriculo.endereco.complemento.label" default="Complemento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="complemento" required=""
		value="${enderecoInstance?.complemento}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'endereco.endereco', 'error')} required">
	<label for="endereco.endereco"> <g:message
			code="curriculo.endereco.endereco.label" default="Endereco" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="endereco" required=""
		value="${enderecoInstance?.endereco}" />

</div>

<%--<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'endereco.id', 'error')} required">--%>
<%--	<label for="endereco.id">--%>
<%--		<g:message code="curriculo.endereco.id.label" default="Id" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:field name="id" type="number" value="${enderecoInstance.id}" required=""/>--%>
<%--</div>--%>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'endereco.uf', 'error')} required">
	<label for="endereco.uf"> <g:message
			code="curriculo.endereco.uf.label" default="Uf" /> <span
		class="required-indicator">*</span>
	</label>

	<g:select name="uf" required=""
		value="${fieldValue(bean: enderecoInstance, field: "uf")}"
		from="${['AC':'AC','AL':'AL','AP':'AP','AM':'AM','BA':'BA','CE':'CE','DF':'DF','ES':'ES','GO':'GO','MA':'MA','MS':'MS',
			'MT':'MT','MG':'MG','PA':'PA','PB':'PB','PR':'PR','PE':'PE','PI':'PI','RJ':'RJ','RN':'RN','RS':'RS','RO':'RO',
			'RR':'RR','SC':'SC','SP':'SP','SE':'SE','TO':'TO']}"
		optionKey="key" optionValue="value"
		noSelection="['':'Selecione um estado-']" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'formacao', 'error')} required">
	<label for="formacao"> <g:message
			code="curriculo.formacao.label" default="Formacao" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textArea name="formacao" required=""
		value="${curriculoInstance?.formacao}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'experiencia', 'error')} required">
	<label for="experiencia"> <g:message
			code="curriculo.experiencia.label" default="Experiencia" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textArea name="experiencia" required=""
		value="${curriculoInstance?.experiencia}" />

</div>

<%--<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'endereco.version', 'error')} required">--%>
<%--	<label for="endereco.version">--%>
<%--		<g:message code="curriculo.endereco.version.label" default="Version" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:field name="version" type="number" value="${enderecoInstance.version}" required=""/>--%>
<%----%>
<%--</div>--%>
<%--</fieldset>--%>
<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'usuario', 'error')} required">
	<label for="usuario"> <g:message code="curriculo.usuario.label"
			default="Usuario" /> <span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id"
		from="${sisculos1.Usuario.findAllWhere(login: session.user.login)}"
		optionKey="id" required="" value="${curriculoInstance?.usuario?.id}"
		class="many-to-one" />

</div>

