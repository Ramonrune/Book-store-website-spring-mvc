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
					<th width="20%">Imagem</th>
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
							
							<input type="submit" class="waves-effect waves-light btn" style="padding-top: 8px;" name="checkout" value="Finalizar compra" />
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