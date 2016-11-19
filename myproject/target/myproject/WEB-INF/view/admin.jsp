<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 

</head>
<body>
  <%@include file="header.jsp" %>
<p></p>
<br>
<br>
<br>
<br>
<div class="container">
  <h2>Administrator Page</h2>
  <p>This is for Admin</p>
  <c:if test="${pageContext.request.userPrincipal.name!=null}">
  <h2>
  Welcome:${pageContext.request.userPrincipal.name}|<a href="#">Logout</a>
</h2>
  
  </c:if>

  <h3><a href="${req}/admin/productinventory">Product Inventory</a></h3>
  <p>Here you can view , check and modify the product inventory!</p>
  <%@include file="footer.jsp" %>
</div>

</body>
</html>

