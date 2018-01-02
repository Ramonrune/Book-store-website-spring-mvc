<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listagem de produtos</title>
</head>
<body>

	<table>
	
		<tr>
			<td>Titulo</td>
			<td>Valores</td>
			
			<c:forEach items="${products}" var="product">
			
				<tr>
					<td>
						${product.title }
					
					</td>
					
					<td>
						<c:forEach items="${product.prices }" var="price">
							
								${price.value} - ${price.bookType}
							<br>
						</c:forEach>
					</td>
				</tr>
			
			</c:forEach>
			
		</tr>
	</table>

</body>
</html>