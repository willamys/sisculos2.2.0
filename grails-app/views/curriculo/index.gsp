
<%@ page import="sisculos1.Curriculo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'curriculo.label', default: 'Curriculo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-curriculo" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home"
				href="${createLink(uri: '/usuario/initial')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="exit" controller="usuario" action="logout">
					<g:message code="Logout" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-curriculo" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:form action="index" method="POST">
			<div class="fieldcontain" align="left">
				<label for="query">Pesquisa de Curriculos:</label> <input
					type="text" name="query" onchange="greetName(this.value)"
					id="query" alt="digite o texto para pesquisar"
					value="${params.query}" /><input type="submit" value="pesquisar">
				<br>
			</div>
<%--			<div class="" style="padding: 5px;" align="left">--%>
<%--				<p><h4>Opções de pesquisa:</h4><label for="pesquisa">nome:</label><input--%>
<%--					type="radio" name="pesquisa" id="pesquisa" value="nome"--%>
<%--					checked="checked"> <label for="pesquisa">formação:</label><input--%>
<%--					type="radio" name="pesquisa" id="pesquisa" value="formacao">--%>
										<script type="text/javascript">
											function greetName(query) {
								document.getElementById("myForm").submit();
								alert(query)
							}
										</script>
<%--				</p>--%>
<%--			</div>--%>
		</g:form>
		<br>
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="nome"
						title="${message(code: 'curriculo.nome.label', default: 'Nome')}" />

					<g:sortableColumn property="cpf"
						title="${message(code: 'curriculo.cpf.label', default: 'Cpf')}" />

					<g:sortableColumn property="rg"
						title="${message(code: 'curriculo.rg.label', default: 'Rg')}" />

					<g:sortableColumn property="email"
						title="${message(code: 'curriculo.email.label', default: 'Email')}" />

					<g:sortableColumn property="telefone"
						title="${message(code: 'curriculo.telefone.label', default: 'Telefone')}" />

					<g:sortableColumn property="formacao"
						title="${message(code: 'curriculo.formacao.label', default: 'Formacao')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${curriculoInstanceList}" status="i"
					var="curriculoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${curriculoInstance.id}">
								${fieldValue(bean: curriculoInstance, field: "nome")}
							</g:link></td>

						<td>
							${fieldValue(bean: curriculoInstance, field: "cpf")}
						</td>

						<td>
							${fieldValue(bean: curriculoInstance, field: "rg")}
						</td>

						<td>
							${fieldValue(bean: curriculoInstance, field: "email")}
						</td>

						<td>
							${fieldValue(bean: curriculoInstance, field: "telefone")}
						</td>

						<td>
							${fieldValue(bean: curriculoInstance, field: "formacao")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${curriculoInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
