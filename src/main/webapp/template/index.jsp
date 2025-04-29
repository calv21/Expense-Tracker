<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="common/header.jsp" />
</head>
<body>
	
	<div class="container-fluid">
		<!--  Nav Bar -->
		<c:import url="common/admin-nav.jsp" />
	
		<div class="container">
		
			<div class="row mt-3">
			<c:forEach var="expense" items="${expenses }">
				<div class="col-md-4 col-lg-3 col-xl-2 col-xxl-2">
				<div class="card mb-3" style="height: 22rem" >
				  <img src="${expense.image }" class="card-img-top" style="height: 12rem;" alt="expense">
				  <div class="card-body text-center">
				  <h5 class="card-title" >${expense.name }</h5>
				  <p class="card-text text-primary">
				  	Price : ${ expense.price } <br>
				  	Qty : ${expense.qty } items
				  </p>
				  <c:url var="detailsLink" value="expense">
				  	<c:param name="mode" value="DETAILS"/>
				  	<c:param name="expenseId" value="${ expense.id }"/>
				  </c:url>
				  <a href="${ detailsLink }" class="btn btn-primary">View</a>
 			</div>
	</div>
				</div>
				</c:forEach>
			</div>
		
	</div>
	
	</div>

	<c:import url="common/footer.jsp" />
</body>
</html>