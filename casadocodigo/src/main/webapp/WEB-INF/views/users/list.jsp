<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags"%>

<customTags:page bodyClass="" title="">

	<jsp:body>


	<div class="container">
		<a href="${spring:mvcUrl('formProduct').build()}"
				class="waves-effect waves-light btn">Novo Usuário</a>
		<br>
		<br>
		
		<div class="chip">
			Lista carregada com sucesso!
			<i class="close material-icons">close</i>
		</div>
		<table class="striped">
			<thead>
				<tr>
					<th>Usuario</th>
					<th>Senha</th>
				</tr>
			</thead>

			<c:forEach items="${users}" var="user">
				<tr>
					<td>${user.login }</td>
					<td>${user.password}</td>
				</tr>
			</c:forEach>
		</table>

	</div>

</jsp:body>
</customTags:page>