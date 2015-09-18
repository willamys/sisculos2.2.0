<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Bem Vindos ao Sistema de Currículos do IF</title>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<a href="#page-body" class="skip"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<g:if test="${session.user}">
		<div class="nav" role="navigation">
			<ul>
				<%--				<li><g:link class="" url="#">Logado como <b>${session.user.login}</b></g:link></li>--%>
				<li><a class="home"
					href="${createLink(uri: '/usuario/initial')}"><g:message
							code="default.home.label" /></a></li>
				<li><g:link class="exit" controller="usuario" action="logout">
						<g:message code="Logout" />
					</g:link></li>
			</ul>
		</div>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div id="status" role="complementary">
			<h1>Menu</h1>
			<ul>
				<%--			<g:each var="c"--%>
				<%--				in="${grailsApplication.controllerClasses.sort { it.fullName } }">--%>
				<%--				<li class="controller"><g:link--%>
				<%--						controller="${c.logicalPropertyName}">--%>
				<%--						${c.naturalName.replaceAll("Controller", "")}--%>
				<%--					</g:link></li>--%>
				<%--			</g:each>--%>
				<li class="controller"><a class=""
					href="${createLink(uri: '/curriculo/index')}">Currículo</a></li>
				<li class="controller"><a class=""
					href="${createLink(uri: '/usuario/index')}">Usuário</a></li>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Bem Vindos ao Sistema de Currículos do IF</h1>
			<p>O sistema de cadastro de currículos surge com o intuito de
				formar um banco de dados com informações dos alunos do IF, com o
				objetivo de proporcionar às empresas parceiras a possibilidade de
				seleção de profissionais formados ou em formação.</p>
		</div>
	</g:if>
	<g:else>
		${response.sendRedirect("/usuario/initial") }
	</g:else>
</body>
</html>
