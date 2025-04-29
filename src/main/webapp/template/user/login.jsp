<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<c:import url="../common/header.jsp" />
</head>
<body>

  <div class="container">
    <div class="card mt-5 col-md-6 mx-auto col-sm-12">
      <div class="card-body">
        <c:if test="${not empty ok }">
        <div class="alert alert-success" role="alert">
          Username or Password is incorrect!</div>
        </c:if>

        <h5 class="card-title">Login Here</h5>
        <form action="login" method="post">
          <input type="hidden" name="mode" value="LOGIN">
          <div class="mb-3">
            <label for="email" class="form-label">Email</label> <input
              type="email" class="form-control" id="email" name="email">
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label> <input
              type="password" class="form-control" id="password" name="password">
          </div>

          <button type="submit" class="btn btn-primary float-end">Log In</button>
        	<p class="card-text">Don't have an account? <a href="user">Create Here</a></p>
        </form>
      </div>
    </div>

  </div>


  <c:import url="../common/footer.jsp" />

</body>
</html>