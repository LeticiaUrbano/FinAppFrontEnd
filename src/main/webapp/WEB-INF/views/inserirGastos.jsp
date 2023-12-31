<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
//Obtenha o token da sess�o
String jwtToken = (String) session.getAttribute("jwtToken");

//Verifique se o token est� presente
if (jwtToken == null || jwtToken.isEmpty()) {
%>
<script>
	//Exiba um pop-up informando ao usuario que a sessao foi encerrada
	alert("Sua session foi encerrada. Fa�a login novamente.");
	//Redirecione para a pagina de login
	window.location.href = "login";
</script>
<%
}
%>

<!DOCTYPE html>
<html lang="en">
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
</head>

<body>

	<nav class="navbar navbar-expand-lg bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img
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

	<section class="container tela d-flex flex-column pt-3 align-items-center">
		<form id="insereForm" action="javascript:void(0)" method="POST" class="w-50">
			<h2 class="text-center mb-4 fs-1">Adicionar gastos</h2>
			<div class="mb-3">
				<label for="item" class="form-label">Item</label> 
				<input id="item" type="text" name="item" class="form-control" placeholder="Informe o item" required>
			</div>
			<div class="mb-3">
				<label for="valor" class="form-label">Valor</label> 
				<input id="valor" type="text" name="valor" class="form-control" placeholder="Informe o item" required>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" id="alimentacao"
					name="categoria" value="alimentacao" required /> <label
					class="form-check-label" for="alimentacao"> Alimentacao </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" id="saude"
					name="categoria" value="saude" required /> <label
					class="form-check-label" for="saude"> Saude </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" id="transporte"
					name="categoria" value="transporte" required /> <label
					class="form-check-label" for="transporte"> Transporte </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" id="educacao"
					name="categoria" value="educacao" required /> <label
					class="form-check-label" for="educacao"> Educacao </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" id="moradia"
					name="categoria" value="moradia" required /> <label
					class="form-check-label" for="moradia"> Moradia </label>
			</div>
			<div class="text-center d-flex flex-row mt-3 justify-content-around">
				<div class="">
					<button type="button" onclick="submitForm()"
						class="btn btn-primary">Cadastrar</button>
				</div>
				<div class="">
					<a href="gerenciarGastos" class="btn btn-secondary">Visualizar
						Gastos</a>
				</div>
			</div>
		</form>


	</section>

	<footer class="w-100 text-center p-3 bg-primary mx-0">
		<p class="textopreto">Gabriel | Leticia | Matheus</p>
	</footer>
	<script>
		function submitForm() {
			// Crie um objeto FormData com os valores do formulário
			var formData = new FormData(document.getElementById('insereForm'));
	
			// Converta o objeto FormData para um objeto JSON com nomes específicos
			var jsonData = {
				expenseName: formData.get('item'),
				expensePrice: parseFloat(formData.get('valor')),
				expenseType: formData.get('categoria')
			};
	
			// Realize a chamada para o endpoint de envio de gastos
			$.ajax({
				url: 'enviarGasto',
				type: 'POST',
				data: JSON.stringify(jsonData),
				contentType: 'application/json',
				success: function() {
					// Faça algo com a resposta, se necessário
					window.location.href = 'http://localhost:8081/inserirGastos';
				},
				error: function() {
					//alert('Erro ao cadastrar o gasto.');
				}
			});
		}
	</script>
	<script>
    function deslogar() {
        $.ajax({
            type: "GET",
            url: "logout",
            success: function() {
                // Redirecione para a p�gina de login ap�s a invalida��o da sess�o
                window.location.href = "login";
            },
            error: function() {
                // Exiba uma mensagem de erro se necess�rio
                alert("Erro ao realizar logout");
            }
        });
    }
</script>
</body>
</html>
