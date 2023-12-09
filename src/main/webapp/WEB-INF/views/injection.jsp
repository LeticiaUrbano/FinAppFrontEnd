<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Injeção de Dados com Spring</h1>

	<form action="/processForm" method="POST">
		<label for="message">Mensagem:</label>
		<input type="text" id="message" name="message" value="${recicla}">
		<button type="submit">Enviar</button>
		
	</form>
<p> Mensagem do Spring: ${messageFromSpring} </p>


</body>
</html>