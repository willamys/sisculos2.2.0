<%@ page import="sisculos1.Usuario" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="Sisculos Login" />
        <title><g:message code="Sisculos Login" args="[entityName]" /></title>
    </head>
    <body>
        <div id="create-usuario" class="content scaffold-create" role="main">
            <h1><g:message code="Sisculos Login" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuarioInstance}">
            <ul class="errors" role="alert">
				<g:eachError bean="${usuarioInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
            </g:hasErrors>
            <g:form action="authenticate" >
                <fieldset class="form">
                    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'login', 'error')} ">
                        <label for="login">
                            <g:message code="usuario.login.label" default="Login" />
                           
                        </label>
                        <g:textField name="login" value="${usuarioInstance?.login}"/>
                    </div>
                   
                    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} ">
                        <label for="senha">
                            <g:message code="usuario.senha.label" default="Senha" />
                           
                        </label>
                        <g:field type="password" name="senha" value="${usuarioInstance?.senha}"/>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="entrar" class="save" value="Entrar" />
                    <g:link class="edit" action="create_comum"><g:message code="Deseja se cadastrar?" /></g:link>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>