<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
     //Obtenha o token da sess�o
   String jwtToken = (String) session.getAttribute("jwtToken");

    // Verifique se o token est� presente
    if (jwtToken == null || jwtToken.isEmpty()) {
%>
        <script>
            // Exiba um pop-up informando ao usu�rio que a sess�o foi encerrada
            alert("Sua sess�o foi encerrada. Fa�a login novamente.");
            // Redirecione para a p�gina de login
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
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Work+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        body {
            font-family: 'Work Sans', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .form-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-box {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 10px; /* Added border-radius for round corners */
        }

        .radio-group {
            margin-top: 10px;
        }

        .radio-group label {
            margin-right: 15px;
        }

        .login-button button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .login-button button:hover {
            background-color: #45a049;
        }

        .view-expenses button {
            background-color: #008CBA;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .view-expenses button:hover {
            background-color: #0077A6;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="form-header">
            <h1>Inserir Gastos</h1>
        </div>

        <form id="insereForm" action="/enviarGasto" method="POST">
            <div class="input-group">
                <div class="input-box">
                    <label for="item">Item:</label>
                    <input id="item" type="text" name="item" placeholder="Informe o item" required>
                </div>

                <div class="input-box">
                    <label for="valor">Valor:</label>
                    <input id="valor" type="text" name="valor" placeholder="Informe o valor" required>                       
                </div>

                <div class="input-box">
                    <label>Categoria:</label>
                    <div class="radio-group">
                        <input type="radio" id="alimentacao" name="categoria" value="alimentacao" required>
                        <label for="alimentacao">Alimenta��o</label>
    
                        <input type="radio" id="saude" name="categoria" value="saude" required>
                        <label for="saude">Sa�de</label>
    
                        <input type="radio" id="transporte" name="categoria" value="transporte" required>
                        <label for="transporte">Transporte</label>
    
                        <input type="radio" id="educacao" name="categoria" value="educacao" required>
                        <label for="educacao">Educa��o</label>
    
                        <input type="radio" id="moradia" name="categoria" value="moradia" required>
                        <label for="moradia">Moradia</label>
                    </div>
                </div>
            </div>
            
            <div class="login-button">
                <button type="submit" onclick="submitForm()">Cadastrar</button>
            </div>
        </form>

        <div class="view-expenses">
            <button>
                <a href="gerenciarGastos">Visualizar Gastos</a>
            </button>
        </div>
    </div>

    <script>
	    function submitForm() {
	        var form = $('#insereForm');
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
	                alert('Cadastro conclu�do com sucesso! Clique em OK para continuar.');
	
	                // Redirecionar para a p�gina de login ap�s o clique em OK
	                //window.location.href = 'http://localhost:8081/login';
	            },
	            error: function () {
	                // L�gica de tratamento de erro, se necess�rio...
	            }
	        });
	    }

    </script>

</body>
</html>
