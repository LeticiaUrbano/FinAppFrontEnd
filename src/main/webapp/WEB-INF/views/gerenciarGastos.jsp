<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
//Obtenha o token da sessï¿½o
String jwtToken = (String) session.getAttribute("jwtToken");

//Verifique se o token estï¿½ presente
if (jwtToken == null || jwtToken.isEmpty()) {
%>
<script>
	//Exiba um pop-up informando ao usuario que a sessao foi encerrada
	alert("Sua sessão foi encerrada. Faça login novamente.");
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
					<li class="nav-item"><a class="nav-link text-light" href="mostraGastos">Relatório</a>
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
				<div
					class="card-body d-flex justify-content-between align-items-center">
					<div>
						<p class="textopreto">Código: ${expense.code}</p>
						<p class="textopreto">Item: ${expense.expenseName} - Valor:
							${expense.expensePrice} - Tipo de Gasto: ${expense.expenseName}</p>
					</div>
					<div class="">
						<i class="bi bi-pencil textopreto fs-3 mx-1"></i> <i
							class="bi bi-trash text-danger fs-3 mx-1"></i>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="text-center mt-5">
			<a href="mostraGastos" class="btn btn-secondary">Visualizar
				Gastos</a>
		</div>
	</section>

	<footer class="w-100 text-center p-3 bg-primary mx-0">
		<p class="textopreto">Gabriel | Letícia | Matheus</p>
	</footer>
	
	<script>
		function deslogar() {
			//session.destroy();
			window.location.href = "";
		}
	</script>

</body>
</html>