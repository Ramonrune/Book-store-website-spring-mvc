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

		

		<br> <br>
		


		<div class="chip">
			<spring:message code="listofbooks.listloaded"/>! ${sucesso } <i
					class="close material-icons">close</i>
		</div>
		<table class="striped">
			<thead>
				<tr>
					<th><spring:message code="booklist.see"/></th>
					<th width="20%"><spring:message code="booklist.image"/></th>
					<th><spring:message code="booklist.title"/></th>
					<th><spring:message code="booklist.value"/></th>
				</tr>
			</thead>

			<c:forEach items="${products}" var="product">
				<tr>
					<td><a
							href="${spring:mvcUrl('showProduct').arg(0, product.id).build() }"><i
								class="material-icons">search</i></a></td>
					<td><img src="${product.summaryPath}" width="40%"></td>
					<td>${product.title}</td>
					<td><c:forEach items="${product.prices}" var="price">
					R$ ${price.value} - ${price.bookType}
					<br>
					</c:forEach></td>
				</tr>
			</c:forEach>
		</table>

	</div>
	
	<br><br><br><br>
	</jsp:body>


</customTags:page>
