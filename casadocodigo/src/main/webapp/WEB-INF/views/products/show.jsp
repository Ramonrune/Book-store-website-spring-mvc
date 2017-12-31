<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags"%>

<customTags:page bodyClass="" title="">

	<jsp:body>

	<div class="container">
			
		<h1 class="product-title" itemprop="name">${product.title}</h1>
		
		<div class="row">
			<div class="col s12 m6 l6">
				<img src="${product.summaryPath }" width="100%" />
			</div>
			
			<div class="col s12 m6 l6">
			<form:form servletRelativeAction="/shopping" method="post">
				<input type="hidden" value="${product.id}" name="productId" />
					<c:forEach items="${product.prices}" var="price">
						<div class="col s12 m4 l4 card">
							<i class="large material-icons">book</i>
							
							<input type="radio" name="bookType"
									id="${product.id}-${price.bookType}" value="${price.bookType}"
									${price.bookType.name() == 'COMBO' ? 'checked' : ''}>
							 
							<label for="${product.id}-${price.bookType}"> 
								${price.bookType}								
							</label> 
							<br>
							R$ ${price.value}
						</div>
					</c:forEach>



			<br><br><br>


				<input type="submit" class="waves-effect waves-light btn"
							alt="<spring:message code="items.buy"/>" title="<spring:message code="items.buy"/> '${product.title}'!"
							value=<spring:message code="items.buy"/> style="padding-top: 8px;float:right;" />

			</form:form>
			
			</div>
		</div>	
		
			
			
		<p>
		${product.description}
				
		</p>
			
	</div>
	</jsp:body>


</customTags:page>




