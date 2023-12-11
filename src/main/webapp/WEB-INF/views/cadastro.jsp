<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
	<div class="container w-100 tela100 d-flex mx-0 p-0 justify-content-between">
		<div class="tela100 d-flex flex-column gap-3 w-25 bg-primary p-4 justify-content-center align-items-center">
			<img src="../../images/controlaAi.png" class="cadastro__img__texto">
			<img src="../../images/cofrinho_1.png" class="cadastro__img__porco">
			<h2 class="fs-1 textobranco">Bem-vindo de volta!</h2>
			<p class="textobranco">Acesse sua conta agora mesmo.</p>
			<a class="btn btn-light" href="login">Entrar</a>
		</div>
		<div class="tela100 w-50 justify-content-center align-items-center text-center d-flex flex-column">
			<h2 class="fs-1">Crie sua conta</h2>
			<form id="registrationForm" action="/create-new-user" method="POST" class="d-flex flex-column justify-content-center p-3 ml-2 w-50 text-start">
				<div class="mb-3">
				  <label for="nomeUser" class="form-label textopreto">Nome</label>
				  <input type="text" class="form-control" name="nome" placeholder="Digite seu nome" id="nomeUser" required>
				</div>
				<div class="mb-3">
				  <label for="sobrenomeUser" class="form-label textopreto">Sobrenome</label>
				  <input type="text" class="form-control" name="sobrenome" placeholder="Digite seu sobrenome" id="sobrenomeUser" required>
				</div>
				<div class="mb-3">
				  <label for="emailUser" class="form-label textopreto">E-mail</label>
				  <input type="email" class="form-control" name="email" placeholder="Digite seu e-mail" id="emailUser" required>
				</div>
				<div class="mb-3">
				  <label for="senhaUser" class="form-label textopreto">Senha</label>
				  <input type="password" class="form-control" name="senha" placeholder="Digite sua senha" id="senhaUser" required>
				</div>
				<div class="mb-3">
				  <label for="confirmarSenhaUser" class="form-label textopreto">Confirmar senha</label>
				  <input type="password" class="form-control" name="confirmarSenhaUser" placeholder="Confirme sua senha" id="confirmarSenhaUser" required>
				</div>
                <button type="button" onclick="submitForm()" class="btn btn-primary">Cadastrar</button> 
			</form>
		</div>
	</div>

    <script>
	    function submitForm() {
	        var form = $('#registrationForm');
	        var formData = form.serializeArray();
	        var jsonData = {};
	
	        $.each(formData, function (_, record) {
	            jsonData[record.name] = record.value;
	        });
	
	        $.ajax({
	            type: 'POST',
	            url: form.attr('action'),
	            contentType: 'application/json',
	            data: JSON.stringify(jsonData),
	            success: function () {
	                // Mostrar mensagem de sucesso
	                //alert('Cadastro conclu�do com sucesso! Clique em OK para continuar.');
	
	                // Redirecionar para a p�gina de login ap�s o clique em OK
	                window.location.href = 'http://localhost:8081/login';
	            },
	            error: function () {
	                // L�gica de tratamento de erro, se necess�rio...
	            }
	        });
	    }

    </script>

</body>
</html>
