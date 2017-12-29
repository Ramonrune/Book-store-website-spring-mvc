<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags"%>

<customTags:page bodyClass="" title="">

	<jsp:body>

	<div class="container">
		<a href="${spring:mvcUrl('listProduct').build()}"
				class="waves-effect waves-light btn">Lista</a>

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
			<security:csrfInput />
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
						class="waves-effect waves-light btn" >
			</div>
		</form:form>


	</div>
</jsp:body>
</customTags:page>