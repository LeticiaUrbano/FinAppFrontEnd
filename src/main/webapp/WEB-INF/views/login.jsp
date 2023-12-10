<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>ControlaAi</title>
        <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Work+Sans&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    </head>
    <body>
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