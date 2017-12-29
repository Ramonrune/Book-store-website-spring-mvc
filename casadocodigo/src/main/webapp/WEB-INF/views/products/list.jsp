<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags"%>

<customTags:page bodyClass="" title="">
	<jsp:attribute name="extraScripts">
<script type="text/javascript"
			src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
			src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	</jsp:attribute>

	<jsp:body>
	<div class="container">

		<security:authorize access="isAuthenticated()">
			<security:authentication property="principal" var="user" />
		Olá ${ user.name}
		</security:authorize>

		<br> <br>
		<security:authorize access="hasRole('ROLE_ADMIN')">
			<a href="${spring:mvcUrl('formProduct').build()}"
					class="waves-effect waves-light btn">Novo Livro</a>
			<br>
			<br>

		</security:authorize>


		<div class="chip">
			Lista carregada com sucesso! ${sucesso } <i
					class="close material-icons">close</i>
		</div>
		<table class="striped">
			<thead>
				<tr>
					<th>Ver</th>
					<th>Título</th>
					<th>Valores</th>
				</tr>
			</thead>

			<c:forEach items="${products}" var="product">
				<tr>
					<td><a
							href="${spring:mvcUrl('showProduct').arg(0, product.id).build() }">Ver</a></td>
					<td>${product.title}</td>
					<td><c:forEach items="${product.prices}" var="price">
					[${price.value} - ${price.bookType}]
					</c:forEach></td>
				</tr>
			</c:forEach>
		</table>

	</div>
	</jsp:body>


</customTags:page>
