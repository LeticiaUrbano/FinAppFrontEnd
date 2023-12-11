<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
	
	
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
					<li class="nav-item"><a class="nav-link text-light" href="#">Perfil</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<section class="container w-100 tela100 d-flex justify-content-center">
		<div class="d-flex flex-column justify-content-center align-items-center w-75">
			<h2>Despesas mensais</h2>
			<h3 class="textopreto">Suas despesas então assim hoje</h3>
			<div class="d-flex flex-column gap-3 w-100">
				<div class="card w-100">
					<div class="card-body">
						<h5 class="card-title">Renda mensal</h5>
						<p class="card-text textopreto">Valor atual: $0,00</p>
					</div>
				</div>
				<div class="card w-100">
					<div class="card-body">
						<h5 class="card-title mb-3">Custos totais mensais</h5>
						<p class="card-text textopreto">Valor atual: $0,00</p>
						<p class="card-text textopreto">Hoje corresponde a X% da renda</p>
					</div>
				</div>
				<div class="card w-100">
					<div class="card-body">
						<h5 class="card-title mb-3">Quanto sobra?</h5>
						<p class="card-text textopreto">Valor atual: $0,00</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="w-100 text-center p-3 bg-primary mx-0">
		<p class="textopreto">Gabriel | Letícia | Matheus</p>
	</footer>
	<!-- 
<div class=e8_471>
  <div class=e8_472>
    <div class=e8_474>
      <div class="ei8_474_501_22"></div>
      <div class="ei8_474_501_399"></div>
    </div>
    <div class=e11_527>
      <div class="e8_476"></div>
      <div class="e8_477"></div>
      <div class="e8_473"></div>
    </div>
  </div>
  <div class=e8_478>
    <div class="e8_509"></div>
    <div class=e8_510><span  class="e11_560">Despesas mensais</span></div>
    <div class="e11_558"></div>
    <div class="e16_562"></div>
  </div>
</div>
-->

</body>
</html>