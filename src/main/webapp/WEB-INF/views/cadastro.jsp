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

    <div class="e5_231">
        <div class="e5_232"></div>
        <div class="e11_515">
            <div class="e7_276"></div>
            <div class="e7_346"></div>
            <div class="e7_347"></div>
        </div>
        <span class="e5_245">Bem-vindo de volta!</span>
        <span class="e5_246">Acesse sua conta agora mesmo.</span>
        <div class="e5_252">
            <div class="e11_514">
                <span class="e5_250">
                    <button><a href="login">Entrar</a></button>
                </span>
            </div>
        </div>
        <div class="e5_233">
            <div class="form">
                <form id="registrationForm" action="/create-new-user" method="POST">
                    <div class="form-header">
                        <div class="title">
                            <h1>Crie sua conta! <br></h1>
                            <br><p>Cadastre seus dados.</p>
                        </div>
                    </div>

                    <div class="input-group">
                        <div class="input-box">
                            <label for="nomeUser">Nome</label>
                            <input id="nomeUser" type="text" name="nome" placeholder="Digite seu nome" required>
                        </div>
                        <div class="input-box">
                            <label for="sobrenomeUser">Sobre Nome</label>
                            <input id="sobrenomeUser" type="text" name="sobrenome" placeholder="Digite seu sobre nome" required>
                        </div>
                        <div class="input-box">
                            <label for="emailUser">E-mail</label>
                            <input id="emailUser" type="email" name="email" placeholder="Digite seu e-mail" required>
                        </div>
                        <div class="input-box">
                            <label for="senhaUser">Senha</label>
                            <input id="senhaUser" type="password" name="senha" placeholder="Digite sua senha" required>
                        </div>
                        <div class="input-box">
                            <label for="confirmSenhaUser">Confirmar Senha</label>
                            <input id="confirmSenhaUser" type="password" name="confirmSenhaUser" placeholder="Digite novamente sua senha" required>
                        </div>
                    </div>

                    <div class="login-button">
                        <button type="button" onclick="submitForm()">Cadastrar</button>
                    </div>
                </form>
            </div>
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
                alert('Cadastro concluído com sucesso! Clique em OK para continuar.');

                // Redirecionar para a página de login após o clique em OK
                window.location.href = 'http://localhost:8081/login';
            },
            error: function () {
                // Lógica de tratamento de erro, se necessário...
            }
        });
    }

    </script>

</body>
</html>
