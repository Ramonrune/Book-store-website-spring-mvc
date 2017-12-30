<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<nav>
	<div class="nav-wrapper" style="background: #0277bd;">
		<a href="${spring:mvcUrl('home').build()}" class="brand-logo"
			style="padding: 5px;"><img
			src="https://freeiconshop.com/wp-content/uploads/edd/book-open-flat.png"
			width="50px"></a>



		<ul id="nav-mobile" class="right hide-on-med-and-down">
		
			<li><a href="${spring:mvcUrl('home').build()}">Início</a></li>
			
			<li><a href="${spring:mvcUrl('listProduct').build()}">Lista
					de Livros</a></li>
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="${spring:mvcUrl('formProduct').build()}">Novo
						Livro</a></li>


			</security:authorize>

			<li><a href="${spring:mvcUrl('SCC#items').build()}"
				rel="nofollow">Seu carrinho (${shoppingCart.quantity}) </a></li>

			<security:authorize access="isAuthenticated()">
				<security:authentication property="principal" var="user" />
				<li><a href="<c:url value="/logout"/>" rel="nofollow">Logout</a></li>

			</security:authorize>

			<security:authorize access="!isAuthenticated()">
				<security:authentication property="principal" var="user" />
				<li><a href="${spring:mvcUrl('logout').build()}" rel="nofollow">Login</a></li>

			</security:authorize>

		</ul>
	</div>
</nav>