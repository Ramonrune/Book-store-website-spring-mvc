<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
	
<footer class="page-footer" style="background: #0277bd;">
	<div class="container">
		<div class="row">
			<div class="col l12 m12 s12">
				<h5 class="white-text">
				<spring:message code="footer.books"/>
				</h5>
				<p class="grey-text text-lighten-4">
				<spring:message code="footer.description"/>
				</p>
			</div>
		
		</div>
	</div>
	<div class="footer-copyright">
		<div class="container">
			© 2018 Copyright 
		</div>
	</div>
	<script type="text/javascript"
			src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
			src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</footer>