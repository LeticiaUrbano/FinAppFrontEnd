<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
//Obtenha o token da sess�o
String jwtToken = (String) session.getAttribute("jwtToken");

//Verifique se o token est� presente
if (jwtToken == null || jwtToken.isEmpty()) {
%>
<script>
	//Exiba um pop-up informando ao usuario que a sessao foi encerrada
	alert("Sua sess�o foi encerrada. Fa�a login novamente.");
	//Redirecione para a pagina de login
	window.location.href = "login";
</script>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ControlaAi</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" />
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="telaInicial"><img
				src="../../images/cofrinho_1.png" class="navbar__logo__porco"><img
				src="../../images/controlaAi.png" class="navbar__logo__texto"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link text-light" href="telaInicial">Renda</a>
					</li>
					<li class="nav-item"><a class="nav-link text-light" href="inserirGastos">Adicionar gasto</a>
					</li>
					<li class="nav-item"><a class="nav-link text-light" href="gerenciarGastos">Gastos</a>
					</li>
					<li class="nav-item"><a class="nav-link text-light" href="mostraGastos">Relat�rio</a>
					</li>
					<li class="nav-item"><button class="nav-link text-light" onclick="deslogar()">Sair</button>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<section class="container w-50 tela">
		<c:forEach var="expense" items="${expenses}">
  <div class="card my-4">
    <div class="card-body d-flex justify-content-between align-items-center">
      <div>
        <p class="textopreto">Id: ${expense.code}</p>
        <p class="textopreto">Item: <span id="item-${expense.code}">${expense.expenseName}</span><input id="edit-item-${expense.code}" type="text" style="display: none;"></p>
        <p class="textopreto">Valor: <span id="valor-${expense.code}">${expense.expensePrice}</span><input id="edit-valor-${expense.code}" type="text" style="display: none;"></p>
        <p class="textopreto">Tipo de Gasto: <span id="tipo-${expense.code}">${expense.expenseType}</span><input id="edit-tipo-${expense.code}" type="text" style="display: none;"></p>
      </div>
      <div class="">
        <button class="confirm-button" id="confirm-button-${expense.code}" data-code="${expense.code}" style="display: none">Confirmar</button>
        <button class="edit-button" data-code="${expense.code}">
          <i class="bi bi-pencil textopreto fs-3 mx-1"></i>
        </button>
        <button class="delete-button" data-code="${expense.code}">
          <i class="bi bi-trash text-danger fs-3 mx-1"></i>
        </button>
      </div>
    </div>
  </div>
</c:forEach>

		<div class="text-center mt-5">
		  <a href="mostraGastos" class="btn btn-secondary">Visualizar Gastos</a>
		</div>
	  </section>

	<footer class="w-100 text-center p-3 bg-primary mx-0">
		<p class="textopreto">Gabriel | Letícia | Matheus</p>
	</footer>
	
	<script>
		$(document).ready(function() {
			// Quando um botão de exclusão for clicado
			$('.delete-button').on('click', function() {
				// Obtenha o código associado ao botão clicado
				var expenseCode = $(this).data('code');
				
				// Realize a chamada para o endpoint de exclusão
				$.ajax({
					url: 'deleteGasto',
					type: 'DELETE',
					data: { expenseCode: expenseCode },
					success: function() {
						// Atualize a página ou faça qualquer ação desejada após a exclusão
						location.reload();
					},
					error: function() {
						location.reload();
					}
				});
			});
		});
	</script>

<script>
	$(document).ready(function () {
	  $('.edit-button').on('click', function () {
		var expenseCode = $(this).data('code');
		toggleEdit(expenseCode);
	  });
  
	  function toggleEdit(expenseCode) {
		var itemSpan = $('#item-' + expenseCode);
		var valorSpan = $('#valor-' + expenseCode);
		var tipoSpan = $('#tipo-' + expenseCode);
		var expenseCodeSpan = $('#id-' + expenseCode);
  
		var itemInput = $('#edit-item-' + expenseCode);
		var valorInput = $('#edit-valor-' + expenseCode);
		var tipoInput = $('#edit-tipo-' + expenseCode);
		var expenseCodeInput = $('#confirm-button-' + expenseCode);
  
		// Botão de confirmação
		var confirmButton = $('#confirm-button-' + expenseCode);
  
		// Alternar entre a exibição e a edição para cada campo
		toggleDisplay(itemSpan, itemInput, confirmButton);
		toggleDisplay(valorSpan, valorInput, confirmButton);
		toggleDisplay(tipoSpan, tipoInput, confirmButton);
		toggleDisplay(expenseCodeSpan, expenseCodeInput, confirmButton);
		confirmButton.show();
	  }
  
	  function toggleDisplay(span, input, confirmButton) {
		if (span.is(':visible')) {
		  // Modo de exibição
		  span.hide();
		  input.show().val(span.text().trim());
		} else {
		  // Modo de edição
		  span.show().text(input.val());
		  input.hide();
		  confirmButton.hide();
		}
	  }
  
	  // Adicionar evento ao botão de confirmação
	  $('.confirm-button').on('click', function () {
		var expenseCode = $(this).data('code');
		var itemInput = $('#edit-item-' + expenseCode);
		var valorInput = $('#edit-valor-' + expenseCode);
		var tipoInput = $('#edit-tipo-' + expenseCode);
  
		// Montar objeto com os dados editados
		var editedData = {
		  expenseCode: expenseCode,
		  expenseName: itemInput.val(),
		  expensePrice: parseFloat(valorInput.val()),
		  expenseType: tipoInput.val()
		};
  
		// Realizar a chamada PUT para o endpoint atualizarGasto
		$.ajax({
		  url: 'atualizarGasto',
		  type: 'PUT',
		  contentType: 'application/json',
		  data: JSON.stringify(editedData),
		  success: function (response) {
			// Lógica de sucesso, se necessário
			location.reload();
		  },
		  error: function () {
			//alert('Erro ao atualizar o registro.');
		  }
		});
  
		// Após confirmar, alternar de volta para o modo de exibição
		toggleEdit(expenseCode);
		var confirmButton = $('#confirm-button-' + expenseCode);
  
		confirmButton.hide();
	  });
	});
  </script>
  
  
  <script>
	function deslogar() {
		//session.destroy();
		window.location.href = "";
	}
</script>
  
  

</body>
</html>