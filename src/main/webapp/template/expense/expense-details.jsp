<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/header.jsp" />
</head>
<body>
	<c:import url="../common/nav.jsp"></c:import>

		<div class="container">
			<div class="col-lg-6 mt-5">
				<div class="card mb-5" >
				  <img src="${expense.image }" class="card-img-top" alt="expense">
				  <div class="card-body text-center">
				  <h5 class="card-title" >${expense.name }</h5>
				  <p class="card-text text-primary">
				  	$ ${ expense.price } <br>
				  	${expense.qty } items <br>
				  	${ expense.price } x ${ expense.qty } = ${ expense.subTotal } <br>
				  	issued at ${ expense.issuedDate }
				  </p>
				  <h5>Description</h5>
				  <p class="card-text">
				  	${ expense.description }
				  </p>
				  
				  <c:url var="updateLink" value="expense">
				  	<c:param name="mode" value="LOAD"/>
				  	<c:param name="expenseId" value="${ expense.id }"/>
				  </c:url>
				  <a href="${ updateLink }" class="btn btn-info">Edit</a>
				  <c:url var="deleteLink" value="expense">
				  	<c:param name="mode" value="DELETE"/>
				  	<c:param name="expenseId" value="${ expense.id }"/>
				  </c:url>
				  <a href="${ deleteLink }" class="btn btn-danger">Delete</a>
 			</div>
	</div>
				</div>
			</div>
		
	</div>

	<c:import url="../common/footer.jsp" />
</body>
</html>