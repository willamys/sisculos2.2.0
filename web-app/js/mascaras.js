if (typeof jQuery !== 'undefined') {
	$(document).ready(function(){
		$("#telefone").mask("(99)99999-9999");
		$("#cpf").mask("999.999.999-99");
		$("#cep").mask("99999-999");
		//$("#datanasc").mask("99/99/9999");
	    $( "#datanasc" ).datepicker({
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true
	      });
	});
}