<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="customTags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<customTags:page bodyClass="" title="">

	<div class="container">
		<h2>
			<security:authorize access="isAuthenticated()">
				<security:authentication property="principal" var="user" />
				<spring:message code="users.welcome" arguments="${user.name }" />
			</security:authorize>

		</h2>
		<b>Para testar: <br>ramonrune@gmail.com : admin (conta admin)<br>usercomprador@gmail.com : admin (conta padrão)</b>
		<div class="row">

			<c:forEach items="${products }" var="product">
				<div class="col s12 m4 l4">
					<div class="card">
						<div class="card-image">
							<img src="${product.summaryPath }" width="50%"> <a
								href="${spring:mvcUrl('showProduct').arg(0, product.id).build() }"
								class="btn-floating halfway-fab waves-effect waves-light red"><i
								class="material-icons">add</i></a>
						</div>
						<div class="card-content">
							<span class="card-title">${product.title }</span>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>

	</div>



</customTags:page>

