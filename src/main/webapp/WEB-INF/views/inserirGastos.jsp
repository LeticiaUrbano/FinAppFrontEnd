<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ControlaAi</title>
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Work+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles.css">
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

    <form id="insereForm" action="/cadastrarGastos" method="POST">
        <div class="input-group">
            <div class="input-box">
                <label for="item">Item:</label>
                <input id="item" type="text" name="item" placeholder="Informe o item" required>
            </div>
        </div>

        <div class="input-box">
          <label for="valor">Valor:</label>
          <input id="valor" type="text" name="valor" placeholder="Informe o valor" required>
      </div>

      <div class="input-box">
          <label>Categoria:</label>
          <div class="radio-group">
              <input type="radio" id="alimentacao" name="categoria" value="alimentacao" required>
              <label for="alimentacao">Alimentação</label>

              <input type="radio" id="saude" name="categoria" value="saude" required>
              <label for="saude">Saúde</label>

              <input type="radio" id="transporte" name="categoria" value="transporte" required>
              <label for="transporte">Transporte</label>

              <input type="radio" id="educacao" name="categoria" value="educacao" required>
              <label for="educacao">Educação</label>

              <input type="radio" id="moradia" name="categoria" value="moradia" required>
              <label for="moradia">Moradia</label>
          </div>
      </div>


        <div class="login-button">
            <button type="button" onclick="submitForm()">Cadastrar</button>
        </div>
    </form>

    <div class="view-expenses">
        <button>
            <a href="gerenciarGastos">Visualizar Gastos</a>
        </button>
    </div>
</div>

</body>
</html>
