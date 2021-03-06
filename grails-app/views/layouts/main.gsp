<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'application.css')}" type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
<g:layoutHead />
<link rel="stylesheet" href="${resource(dir: 'js/jquery/jquery-ui', file: 'jquery-ui.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'js/jquery/jquery-ui', file: 'jquery-ui.theme.css')}" type="text/css">
		<g:javascript src="jquery/jquery-1.11.1.js"/>
		<g:javascript src="jquery/jquery-ui/jquery-ui.js"/>
		<g:javascript src="jquery/jquery.maskedinput.js"/>
		<g:javascript src="mascaras.js"/>
<r:layoutResources />
</head>
<body>
	<div id="grailsLogo" role="banner">
		<a href="#"><img
			src="${resource(dir: 'images', file: 'logoifce-2.png')}"
			alt="Curriculos IF" /></a>
		<p align="right" style="padding-right: 10px;">
			<g:if test="${session.user != null}"> Usuário:<b> ${session.user.login}
				</b>
			</g:if>
		</p>
	</div>
	<g:layoutBody />
	<div class="footer" role="contentinfo">Desenvolvido por
		Poneys&copy;</div>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
</body>
</html>
