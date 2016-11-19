<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--For getting images start--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:url value="/resources/images/product" var="productImages" />
<%--For getting images ends--%>
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
  <h2>All Products</h2>
  <p>Check out all the awesome products available now!</p>
  <table class="table">
    <thead>
      <tr>
<th>Product Image</th>
        <th>Product Name</th>
        <th>Product Category</th>
        <th>Price</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var ="product">
      <tr class="success">
<td>

<a href="${req}/productlist/viewproduct/${product.productid}"><img  src="${productImages}/${product.productid}.jpg" 
					alt="${product.productName}" style="width: 100px; height: 100px" /></a>
       <td>${product.productName}</td>
<td>${product.productCategory}</td>
<td>${product.productPrice}</td>
<td><a href="${req}/productlist/viewproduct/${product.productid}" class="btn btn-primary" >View</a></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <%@include file="footer.jsp" %>
</div>

</body>
</html>

