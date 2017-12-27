<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!doctype html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8" lang="pt"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9" lang="pt"><![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="pt">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<title>${product.title}</title>
</head>
<body>
	<div class="container">
		<a href="${spring:mvcUrl('SCC#items').build()}" rel="nofollow">Seu carrinho (${shoppingCart.quantity}) </a>
		<div>
			
				<h1 class="product-title" itemprop="name">${product.title}</h1>
			

				<p itemprop="description" class="book-description">
				${product.description}
				
				</p>
			</div>
			<form action="<c:url value="/shopping"/>" method="post" class="container">
				<input type="hidden" value="${product.id}" name="productId"/>
				<ul id="variants" class="clearfix">
					<c:forEach items="${product.prices}" var="price">
						<li class="buy-option">
							
							<input type="radio"
							name="bookType" class="variant-radio" id="${product.id}-${price.bookType}"
							value="${price.bookType}" ${price.bookType.name() == 'COMBO' ? 'checked' : ''}>
							 
							<label  class="variant-label" for="${product.id}-${price.bookType}"> 
								${price.bookType}								
							</label> 
							<p class="variant-price">${price.value}</p>
						</li>
					</c:forEach>




				</ul>

				<input type="submit" class="waves-effect waves-light btn" 
					alt="Compre agora"
					title="Compre agora '${product.title}'!" value="Comprar"/>

			</form>
	</div>




</body>
</html>