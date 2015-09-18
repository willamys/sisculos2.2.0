<div id="form_curriculo">
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
</div>