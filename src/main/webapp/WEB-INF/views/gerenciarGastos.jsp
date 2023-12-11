<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div class=e8_379>
		  <div class=e8_380>
		    <div class=e8_382>
		      <div class="ei8_382_501_22"></div>
		      <div class="ei8_382_501_399"></div>
		    </div>
		    <div class=e11_525>
		      <div class="e8_381"></div>
		      <div class="e8_384"></div>
		      <div class="e8_385"></div>
		    </div>
		  </div>
		
		  <div class=e16_567>
		    
		        <c:forEach var="expense" items="${expenses}">
		          <span  class="e16_604">Codigo: ${expense.code}</span><br>
		          <span  class="e16_603">Item: ${expense.expenseName} Valor: ${expense.expensePrice} - Tipo de Gasto: ${expense.type}</span>        
		        </c:forEach>
		        
		</div>
		</div>
		<div class=e16_590><span  class="ei16_590_8_469"><button><a href="mostraGastos">Visualizar Gastos</a> </button></span></div>
		<div class="e16_591"></div>
	</body>
</html>