<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Produtos</title>
<!--Import Google Icon Font-->
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
		<a href="${spring:mvcUrl('listProduct').build()}" class="waves-effect waves-light btn">Lista</a>

	<!-- 
		<spring:hasBindErrors name="product">
			<ul>
				<c:forEach var="error" items="${errors.allErrors}">
					<li>${error.code}-${error.field}</li>
				</c:forEach>
			</ul>
		</spring:hasBindErrors>
	-->

		<form:form action="${spring:mvcUrl('saveProduct').build()}"
			method="post" commandName="product" enctype="multipart/form-data">

			<div>
				<label for="title">Título</label>
				<form:input path="title" />

				<form:errors path="title" />

			</div>

			<div>
				<label for="description">Descrição</label>
				<form:textarea rows="10" cols="20" path="description"
					class="materialize-textarea" />

				<form:errors path="description" />

			</div>

			<div>
				<label for="pages">Número de paginas</label>

				<form:input path="pages" />

				<form:errors path="pages" />

			</div>

			<div>
				<label for="releaseDate">Data de lançamento</label>

				<form:input path="releaseDate" type="date" />

				<form:errors path="releaseDate" />

			</div>

			<div>
				<label for="summary">Sumário</label>

				<input type="file" name="summary" />

				<form:errors path="summaryPath" />

			</div>

			<c:forEach items="${types}" var="bookType" varStatus="status">
				<div>
					<label for="price_${bookType}">${bookType}</label> <input
						type="text" name="prices[${ status.index}].value"
						id="price_${ bookType }"> <input type="hidden"
						name="prices[${status.index }].bookType" value="${bookType }">
				</div>

			</c:forEach>

			<div>
				<input type="submit" value="Enviar"
					class="waves-effect waves-light btn" style="padding-top: 7px;">
			</div>
		</form:form>


	</div>



</body>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</html>