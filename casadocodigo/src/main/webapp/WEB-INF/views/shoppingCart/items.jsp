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

		<h1>Seu carrinho de compras!</h1>
		<table class="striped">
			<thead>
				<tr>
					<th>Item</th>
					<th>Tipo</th>
					<th>Preço</th>
					<th>Quantidade</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${shoppingCart.list}" var="item">
					<tr>
						<td>${item.product.title }</td>
						<td>${item.bookType }</td>
						<td>${item.price }</td>
						<td>${shoppingCart.getQuantity(item)}</td>
						<td>${shoppingCart.getTotal(item) }</td>
					</tr>

				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<form:form action="${spring:mvcUrl('checkout').build() }"
								method="post">
							<security:csrfInput />
							
							<input type="submit" name="checkout" value="Finalizar compra" />
						</form:form>
					</td>
					<td>${shoppingCart.total }</td>
				</tr>
			</tfoot>

		</table>

	</div>
</jsp:body>
</customTags:page>