<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags"%>

<customTags:page bodyClass="" title="">



	<jsp:body>

	<div class="container">
		

	<!-- 
		<spring:hasBindErrors name="product">
			<ul>
				<c:forEach var="error" items="${errors.allErrors}">
					<li>${error.code}-${error.field}</li>
				</c:forEach>
			</ul>
		</spring:hasBindErrors>
	-->

		<h1><spring:message code="newbook.title"/></h1>
		<form:form action="${spring:mvcUrl('saveProduct').build()}"
				method="post" commandName="product" enctype="multipart/form-data">
			<div class="input-field">
			    <i class="material-icons prefix">book</i>
			
				<form:input path="title" class="validate" id="icon_prefix" />
				<label for="icon_prefix"><spring:message code="newbook.form.title"/></label>
				
				<form:errors path="title" class = "chip" style="background:red; color:#fff;" />

			</div>

			<div class="input-field">
				 <i class="material-icons prefix">format_align_justify</i>
			
				<form:textarea rows="10" cols="20" path="description"
						class="materialize-textarea" />
				<label for="description"><spring:message code="newbook.form.description"/></label>
						

				<form:errors path="description" class = "chip" style="background:red; color:#fff;" />

			</div>

			<div class="input-field">
				 <i class="material-icons prefix">format_list_numbered</i>

				<form:input path="pages" type="number" />
				<label for="pages"><spring:message code="newbook.form.pagenumber"/></label>
				

				<form:errors path="pages" class = "chip" style="background:red; color:#fff;" />

			</div>

			<div class="input-field">
				 <i class="material-icons prefix">date_range</i>

				<form:input path="releaseDate" type="date" />
				 <label for="releaseDate"></label>

				<form:errors path="releaseDate" class = "chip" style="background:red; color:#fff;" />

			</div>
			
			<div class="file-field input-field">
			<i class="material-icons prefix">image</i>
			
		      <div class="btn" style="margin-left:44px;">
		        <span><spring:message code="newbook.form.file"/></span>
				<input type="file" name="summary" />
		      </div>
		      <div class="file-path-wrapper">
		        <input class="file-path validate" type="text">
		      </div>
		      <form:errors path="summaryPath" class = "chip" style="background:red; color:#fff;" />
		      
		    </div>

		<br>
			
				<div class="row">
					<c:forEach items="${types}" var="bookType" varStatus="status">
						<div class="col s12 m4 l4">
							<div class="input-field">
							    <i class="material-icons prefix">attach_money</i>
								
								<label for="price_${bookType}">${bookType}</label>
								 <input type="number" name="prices[${ status.index}].value"
									id="price_${ bookType }"> <input type="hidden"
									name="prices[${status.index }].bookType" value="${bookType }">
								
							</div>
								
						</div>
						
						
					</c:forEach>
					
					<c:forEach items="${types}" var="bookType" varStatus="status">
						<div class="col s12 m4 l4">
							 <form:errors path="prices[${ status.index}].value" class = "chip" style="background:red; color:#fff;" />
						</div>
					</c:forEach>
					
				</div>
			

			<div style="float: right;">
				<input type="submit" value="<spring:message code="newbook.form.send"/>"
						class="waves-effect waves-light btn" style="padding-top: 9px;">
			</div>
			<br>
			<br>
			<br>
		</form:form>


	</div>
</jsp:body>
</customTags:page>