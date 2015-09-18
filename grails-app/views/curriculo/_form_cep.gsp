<div id="form_cep">
	<g:each in="${consultacep}" status="i" var="curriculoInstance">
		<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'endereco', 'error')} required">
	<label for="endereco"> <g:message
			code="curriculo.endereco.label" default="Endereco" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="endereco" required=""
		value="${fieldValue(bean: curriculoInstance, field: "endereco")}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'complemento', 'error')} required">
	<label for="complemento"> <g:message
			code="curriculo.complemento.label" default="Complemento" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="complemento" required=""
		value="${fieldValue(bean: curriculoInstance, field: "complemento")}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'bairro', 'error')} required">
	<label for="bairro"> <g:message code="curriculo.bairro.label"
			default="Bairro" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="bairro" required=""
		value="${fieldValue(bean: curriculoInstance, field: "bairro")}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'cidade', 'error')} required">
	<label for="cidade"> <g:message code="curriculo.cidade.label"
			default="Cidade" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="cidade" required=""
		value="${fieldValue(bean: curriculoInstance, field: "cidade")}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'uf', 'error')} required">
	<label for="uf"> <g:message code="curriculo.uf.label"
			default="Uf" /> <span class="required-indicator">*</span>
	</label>

	<g:select name="uf" required="" value="${fieldValue(bean: curriculoInstance, field: "uf")}"
		from="${['AC':'AC','AL':'AL','AP':'AP','AM':'AM','BA':'BA','CE':'CE','DF':'DF','ES':'ES','GO':'GO','MA':'MA','MS':'MS',
			'MT':'MT','MG':'MG','PA':'PA','PB':'PB','PR':'PR','PE':'PE','PI':'PI','RJ':'RJ','RN':'RN','RS':'RS','RO':'RO',
			'RR':'RR','SC':'SC','SP':'SP','SE':'SE','TO':'TO']}"
		optionKey="key" optionValue="value"
		noSelection="['':'Selecione um estado-']" />

</div>
</g:each>
<%--<g:each in="${consultacep}" status="i" var="curriculoInstance">--%>
<%--					${fieldValue(bean: curriculoInstance, field: "cep")}--%>
<%--					${fieldValue(bean: curriculoInstance, field: "end")}--%>
<%--					${fieldValue(bean: curriculoInstance, field: "bairro")}--%>
<%--					${fieldValue(bean: curriculoInstance, field: "cidade")}--%>
<%--					${fieldValue(bean: curriculoInstance, field: "uf")}--%>
<%--</g:each>--%>
</div>