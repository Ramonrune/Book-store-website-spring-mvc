<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags"%>

<customTags:page bodyClass="" title="">

	<jsp:body>

	<div class="container">

		<h1>
		<spring:message code="cart.title"/>
		</h1>
		<table class="striped">
			<thead>
				<tr>
					<th width="20%"><spring:message code="cart.form.image"/></th>
					<th><spring:message code="cart.form.item"/></th>
					<th><spring:message code="cart.form.type"/></th>
					<th><spring:message code="cart.form.value"/></th>
					<th><spring:message code="cart.form.quantity"/></th>
					<th><spring:message code="cart.form.total"/></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${shoppingCart.list}" var="item">
					<tr>
						<td><img src="${item.product.summaryPath }" width="50%"/></td>
						<td>${item.product.title }</td>
						<td>${item.bookType }</td>
						<td>R$ ${item.price }</td>
						<td>${shoppingCart.getQuantity(item)}</td>
						<td>R$ ${shoppingCart.getTotal(item) }</td>
					</tr>

				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<form:form action="${spring:mvcUrl('checkout').build() }"
								method="post">
							<security:csrfInput />
							
							<input type="submit" class="waves-effect waves-light btn" style="padding-top: 8px;" name="checkout" value="<spring:message code="cart.form.finalize"/>" />
						</form:form>
					</td>
					<td>R$ ${shoppingCart.total }</td>
				</tr>
			</tfoot>

		</table>

	</div>
	<br><br><br><br><br><br><br><br>
</jsp:body>
</customTags:page>