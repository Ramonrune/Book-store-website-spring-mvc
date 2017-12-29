<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="customTags"%>

<customTags:page bodyClass="" title="">

	<div class="container">
		<h1>Seja bem-vindo a loja de livros!</h1>
		<div class="row">

			<c:forEach items="${products }" var="product">
				<div class="col s12 m6">
					<div class="card">
						<div class="card-image">
							<img src="http://materializecss.com/images/sample-1.jpg">  <a
								class="btn-floating halfway-fab waves-effect waves-light red"><i
								class="material-icons">add</i></a>
						</div>
						<div class="card-content">
						<span class="card-title">${product.title }</span>
							<p>${product.description }</p>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>

	</div>



</customTags:page>

