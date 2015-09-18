
<%@ page import="sisculos1.Curriculo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'curriculo.label', default: 'Curriculo')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-curriculo" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home"
				href="${createLink(uri: '/usuario/initial')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="exit" controller="usuario" action="logout">
					<g:message code="Logout" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-curriculo" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list curriculo">

			<g:if test="${curriculoInstance?.nome}">
				<li class="fieldcontain"><span id="nome-label"
					class="property-label"><g:message
							code="curriculo.nome.label" default="Nome" /></span> <span
					class="property-value" aria-labelledby="nome-label"><g:fieldValue
							bean="${curriculoInstance}" field="nome" /></span></li>
			</g:if>

			<g:if test="${curriculoInstance?.cpf}">
				<li class="fieldcontain"><span id="cpf-label"
					class="property-label"><g:message code="curriculo.cpf.label"
							default="Cpf" /></span> <span class="property-value"
					aria-labelledby="cpf-label"><g:fieldValue
							bean="${curriculoInstance}" field="cpf" /></span></li>
			</g:if>

			<g:if test="${curriculoInstance?.rg}">
				<li class="fieldcontain"><span id="rg-label"
					class="property-label"><g:message code="curriculo.rg.label"
							default="Rg" /></span> <span class="property-value"
					aria-labelledby="rg-label"><g:fieldValue
							bean="${curriculoInstance}" field="rg" /></span></li>
			</g:if>

			<g:if test="${curriculoInstance?.sexo}">
				<li class="fieldcontain"><span id="sexo-label"
					class="property-label"><g:message
							code="curriculo.sexo.label" default="Sexo" /></span> <span
					class="property-value" aria-labelledby="sexo-label"><g:fieldValue
							bean="${curriculoInstance}" field="sexo" /></span></li>
			</g:if>

			<g:if test="${curriculoInstance?.email}">
				<li class="fieldcontain"><span id="email-label"
					class="property-label"><g:message
							code="curriculo.email.label" default="Email" /></span> <span
					class="property-value" aria-labelledby="email-label"><g:fieldValue
							bean="${curriculoInstance}" field="email" /></span></li>
			</g:if>

			<g:if test="${curriculoInstance?.telefone}">
				<li class="fieldcontain"><span id="telefone-label"
					class="property-label"><g:message
							code="curriculo.telefone.label" default="Telefone" /></span> <span
					class="property-value" aria-labelledby="telefone-label"><g:fieldValue
							bean="${curriculoInstance}" field="telefone" /></span></li>
			</g:if>

			<g:if test="${curriculoInstance?.formacao}">
				<li class="fieldcontain"><span id="formacao-label"
					class="property-label"><g:message
							code="curriculo.formacao.label" default="Formacao" /></span> <span
					class="property-value" aria-labelledby="formacao-label"><g:fieldValue
							bean="${curriculoInstance}" field="formacao" /></span></li>
			</g:if>

			<g:if test="${curriculoInstance?.experiencia}">
				<li class="fieldcontain"><span id="experiencia-label"
					class="property-label"><g:message
							code="curriculo.experiencia.label" default="Experiencia" /></span> <span
					class="property-value" aria-labelledby="experiencia-label"><g:fieldValue
							bean="${curriculoInstance}" field="experiencia" /></span></li>
			</g:if>

			<g:if test="${curriculoInstance?.datanasc}">
				<li class="fieldcontain"><span id="datanasc-label"
					class="property-label"><g:message
							code="curriculo.datanasc.label" default="Datanasc" /></span> <span
					class="property-value" aria-labelledby="datanasc-label"><g:fieldValue
							bean="${curriculoInstance}" field="datanasc" /></span></li>
			</g:if>

			<g:if test="${curriculoInstance?.endereco}">
				<li class="fieldcontain"><span id="endereco-label"
					class="property-label"><g:message
							code="curriculo.endereco.label" default="Endereco" /></span> <span
					class="property-value" aria-labelledby="endereco-label"><g:fieldValue
							bean="${curriculoInstance}" field="endereco" /></span></li>
			</g:if>

			<g:if test="${curriculoInstance?.usuario}">
				<li class="fieldcontain"><span id="usuario-label"
					class="property-label"><g:message
							code="curriculo.usuario.label" default="Usuario" /></span> <span
					class="property-value" aria-labelledby="usuario-label"><g:link
							controller="usuario" action="show"
							id="${curriculoInstance?.usuario?.id}">
							${curriculoInstance?.usuario?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

		</ol>
		<g:form url="[resource:curriculoInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${curriculoInstance?.id}" />
				<g:link class="edit" action="edit" id="${curriculoInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
		<fieldset class="buttons">
<%--			<g:jasperReport jasper="report1" format="PDF" delimiter=" ">--%>
<%--				<input type="hidden" name="nome" value="${curriculoInstance?.nome}" />--%>
<%--			</g:jasperReport>--%>
		</fieldset>
	</div>
</body>
</html>
