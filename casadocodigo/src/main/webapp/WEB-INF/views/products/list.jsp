<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Produtos</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">


<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>

	<div class="container">
		<a href="${spring:mvcUrl('formProduct').build()}"
			class="waves-effect waves-light btn">Novo Livro</a>
		<br>
		<br>
		
		<div class="chip">
			Lista carregada com sucesso!
			${sucesso }
			<i class="close material-icons">close</i>
		</div>
		<table class="striped">
			<thead>
				<tr>
					<th>Título</th>
					<th>Valores</th>
				</tr>
			</thead>

			<c:forEach items="${products}" var="product">
				<tr>
					<td>${product.title}</td>
					<td><c:forEach items="${product.prices}" var="price">
					[${price.value} - ${price.bookType}]
					</c:forEach></td>
				</tr>
			</c:forEach>
		</table>

	</div>


</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</html>