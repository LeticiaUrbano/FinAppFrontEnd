<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Work+Sans&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

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

    
    <section class="container d-flex tela flex-column g-3 mb-3">
    	<div class="my-3 text-center">
	    	<h2 class="fs-1">Vamos começar!</h2>
	    	<p class="textopreto fs-5">Como você tem dividido seus gastos? Será que estão distribuidos de forma saudável e correta, ou você está gastando mais do que deveria?</p>
    	</div>
    	<div class="text-center">
    		<p class="textopreto">Vamos começar pela sua renda. Preencha suas informações para definir a renda inicial e começarmos o acompanhamento dos gastos.</p>
    	</div>
    	<div class="d-flex flex-column align-items-center justify-content-center">
    		<h2 class="mb-3">Renda</h2>
    		<form id="" action="" method="POST" class="w-50">
	    		<div class="d-flex flex-row justify-content-around">
					<div class="mb-3">
					  <label for="salario" class="form-label textopreto">Salário</label>
					  <input type="text" class="form-control" name="salario" placeholder="R$ 0,00" id="salario">
					</div>
					<div class="mb-3">
					  <label for="rendaExtra" class="form-label textopreto">Renda extra</label>
					  <input type="text" class="form-control" name="rendaExtra" placeholder="R$ 0,00" id="rendaExtra">
					</div>
				</div>
				<div class="d-flex flex-row justify-content-around">
					<div class="mb-3">
					  <label for="beneficio" class="form-label textopreto">Benefício</label>
					  <input type="text" class="form-control" name="beneficio" placeholder="R$ 0,00" id="beneficio">
					</div>
					<div class="mb-3">
					  <label for="outros" class="form-label textopreto">Outros</label>
					  <input type="text" class="form-control" name="outros" placeholder="R$ 0,00" id="outros">
					</div>
				</div>
				<div class="text-center mt-5">
					<p>Agora vamos cadastrar os gastos!</p>
		            <a href="inserirGastos" class="btn btn-primary text-light">Cadastrar gastos</a>
		        </div> 
			</form>
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