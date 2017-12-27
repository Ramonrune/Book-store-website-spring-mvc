<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Itens</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
</head>
<body>
	<div class="container">

		<h1>Seu carrinho de compras!</h1>
		<table  class="striped">
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
						<form action="${spring:mvcUrl('checkout').build() }"
							method="post">

							<input type="submit" name="checkout" value="Finalizar compra" />
						</form>
					</td>
					<td>${shoppingCart.total }</td>
				</tr>
			</tfoot>

		</table>

	</div>

</body>
</html>