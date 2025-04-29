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
	<div class="card mt-5 col-md-6 col-sm-12 mx-auto" >
  <div class="card-body">
  	<c:if test="${ not empty ok }">
		<c:choose>
			<c:when test="${ ok }">
				<div class="alert alert-success">Account creation is succeed.</div>
			</c:when>
			<c:otherwise>
				<div class="alert alert-danger">Account creation is failed.</div>
			</c:otherwise>
		</c:choose>
	</c:if>
    <h5 class="card-title">Create New User</h5>
    
    <form action="user" method="post">
    <input type="hidden" name="mode" value="REGISTER" />
  <div class="mb-3">
    <label for="firstname" class="form-label">FirstName</label>
    <input type="text" class="form-control" id="firstname" name="firstname">
  </div>
  <div class="mb-3">
    <label for="lastname" class="form-label">LastName</label>
    <input type="text" class="form-control" id="lastname" name="lastname">
  </div>
  <div class="mb-3">
    <label for="email" class="form-label">Email</label>
    <input type="text" class="form-control" id="email" name="email">
  </div>
  <div class="mb-3">
    <label for="password" class="form-label">Password</label>
    <input type="password" class="form-control" id="password" name="password">
  </div>
  
  
  <button type="submit" class="btn btn-primary float-end">Create</button>
	<p class="card-text">Already have an account? <a href="login">Login Here</a></p>
</form>
  </div>
</div>
	</div>

	<c:import url="../common/footer.jsp" />
</body>
</html>