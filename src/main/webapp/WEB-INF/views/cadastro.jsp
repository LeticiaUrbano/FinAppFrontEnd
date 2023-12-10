<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ControlaAi</title>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Work+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>

<div class=e5_231>
  <div class="e5_232"></div>
  <div class=e11_515>
    <div class="e7_276"></div>
    <div class="e7_346"></div>
    <div class="e7_347"></div>
  </div><span  class="e5_245">Bem-vindo de volta!</span><span  class="e5_246">Acesse sua conta agora mesmo.</span>
    <div class=e5_252>
    <div class=e11_514><span  class="e5_250"><button><a href="login">Entrar</a> </button></span></div>
  </div>
  <div class=e5_233>
<div class="form">
            <form action="processar_formAluno.php" method="POST">
                <div class="form-header">
                    <div class="title">
                        <h1>Crie sua conta! <br></h1>
						<br><p>Cadastre seus dados . </p>
                    </div>

                </div>

                <div class="input-group">
                    <div class="input-box">
                        <label for="nomeUser">Nome</label>
                        <input id="nomeUser" type="nomeUser" name="nomeUser" placeholder="Digite seu nome" required>
                    </div>
                    <div class="input-box">
                        <label for="emailUser">E-mail</label>
                        <input id="emailUser" type="emailUser" name="emailUser" placeholder="Digite seu e-mail" required>
                    </div>
                    <div class="input-box">
                        <label for="senhaUser">Senha</label>
                        <input id="senhaUser" type="senhaUser" name="senhaUser" placeholder="Digite sua senha" required>
                    </div>
                    <div class="input-box">
                        <label for="confirmSenhaUser">Confirmar Senha</label>
                        <input id="confirmSenhaUser" type="confirmSenhaUser" name="confirmSenhaUser" placeholder="Digite novamente sua senha" required>
                    </div>
                </div>
                
                <div class="login-button" input type="submit" >
                    <button><a href=login>Cadastrar</a> </button>
                </div>
            </form>

  </div>

</div>

</body>
</html>

