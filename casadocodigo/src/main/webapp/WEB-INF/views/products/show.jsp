<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags"%>

<customTags:page bodyClass="" title="">

	<jsp:body>

	<div class="container">
		<a href="${spring:mvcUrl('SCC#items').build()}" rel="nofollow">Seu carrinho (${shoppingCart.quantity}) </a>
		<div>
			
				<h1 class="product-title" itemprop="name">${product.title}</h1>
			

				<p itemprop="description" class="book-description">
				${product.description}
				
				</p>
			</div>
			<form:form servletRelativeAction="/shopping" method="post"
				class="container">
				<input type="hidden" value="${product.id}" name="productId" />
				<ul id="variants" class="clearfix">
					<c:forEach items="${product.prices}" var="price">
						<li class="buy-option">
							
							<input type="radio" name="bookType" class="variant-radio"
							id="${product.id}-${price.bookType}" value="${price.bookType}"
							${price.bookType.name() == 'COMBO' ? 'checked' : ''}>
							 
							<label class="variant-label"
							for="${product.id}-${price.bookType}"> 
								${price.bookType}								
							</label> 
							<p class="variant-price">${price.value}</p>
						</li>
					</c:forEach>




				</ul>

				<input type="submit" class="waves-effect waves-light btn"
					alt="Compre agora" title="Compre agora '${product.title}'!"
					value="Comprar" />

			</form:form>
	</div>
	</jsp:body>


</customTags:page>




