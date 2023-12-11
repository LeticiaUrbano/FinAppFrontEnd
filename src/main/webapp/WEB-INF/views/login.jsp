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
			<h2 class="fs-1 textobranco">Novo aqui? Junte - se à nós!</h2>
			<p class="textobranco">Obtenha acesso a nossa plataforma de controle de gastos agora mesmo.</p>
			<a class="btn btn-light" href="cadastro">Cadastrar-se</a>
		</div>
		<div class="tela100 w-50 justify-content-center align-items-center text-center d-flex flex-column">
			<h2 class="fs-1">Fazer login</h2>
			<form id="loginForm" action="/logins" method="POST" class="d-flex flex-column justify-content-center p-3 ml-2 w-50 text-start">
				<div class="mb-3">
				  <label for="email" class="form-label textopreto">E-mail</label>
				  <input type="email" class="form-control" name="email" placeholder="Digite seu e-mail" id="email" required>
				</div>
				<div class="mb-3">
				  <label for="senha" class="form-label textopreto">Senha</label>
				  <input type="password" class="form-control" name="senha" placeholder="Digite sua senha" id="senha" required>
				</div>
                <button type="button" onclick="submitForm()" class="btn btn-primary">Entrar</button> 
			</form>
		</div>
	</div>
    <!--  
        <div class=e1_2>
            <div class="e6_254"></div>
            <div class="e5_230"></div>
            <div class=e11_520>
                <div class="e7_349"></div>
                <div class="e7_350"></div>
            </div>
            <span  class="e6_264">Novo aqui? Junte - se a nos!</span>
            <span  class="e6_265">Obtenha acesso a nossa plataforma de controle de gastos agora mesmo.</span>
            <div class=e11_521>
                <div class=e6_267>
                    <span  class="e6_268">
                        <button>
                            <a href="cadastro">Cadastre - se</a>
                         </button>
                    </span>
                </div>
            </div>
            <div class=e1_12>
                <div class=e1_13>
                    <span  class="e1_16"></span>
                    <div class="form">
                        <form id="loginForm" action="/logins" method="POST">
                            <div class="form-header">
                                <div class="title">
                                    <h1>Faï¿½a login <br></h1>
                                    <br><p>Entre com seu email e senha.</p>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="input-box">
                                    <label for="email">E-mail</label>
                                    <input id="email" type="email" name="email" placeholder="Digite seu e-mail" required>
                                </div>
                            </div>
                            <div class="input-box">
                                <label for="senha">Senha</label>
                                <input id="senha" type="password" name="senha" placeholder="Digite sua senha" required>
                            </div>
                            <div class="login-button">
                                <button type="button" onclick="submitForm()">Entrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        -->
        
       <script>
       function submitForm() {
    	    var form = $('#loginForm');
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
    	            // Redireciona para a página de login após o clique em OK
    	            window.location.href = 'http://localhost:8081/telaInicial';
    	        },
    	        error: function () {
    	            // Mostra mensagem de erro
    	            alert('Email ou senha incorretos');
    	        }
    	    });
    	}
</script>

    </body>
</html>