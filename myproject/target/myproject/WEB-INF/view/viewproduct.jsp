<!DOCTYPE html>
<html lang="en">
<head>
<title>View Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <%--For getting images start--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:url value="/resources/images/product" var="productImages" />
<%--For getting images ends--%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
	<%@include file="header.jsp"%>
	<p></p>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<h2>Product Detail</h2>
		<p>Here is the detail information of the product.</p>

		
	</div>
	<div class="container" ng-app="cartApp">
		<div class="row">
			<div class="col-md-5">
				<img alt="${product.productName}" src="${productImages}/${product.productid}.jpg" style="width: 100%; height: 300px" />
			</div class="col-md-5">
			<h3>${product.productName}</h3>		
			<p>${product.productDescription}</p>
			<p>
			<strong>Product Category</strong>:${product.productCategory}
			</p>
			<p>
			<strong>Price</strong>:Rs ${product.productPrice}0
			</p>
			<br>
			<c:set var="role" scope="page" value="${param.role}"/>
			<c:set var="url" scope="page" value="/productlist"/>
			<c:if test="${role='admin'}">
			<c:set var="url" scope="page" value="/admin/productinventory"/>
			</c:if>
			<p ng-controller="cartCtrl">
			<a href="<c:url value='${url}'/>" class="btn btn-default">Back</a>
			<a href="#" class="btn btn-warning btn-large" ng-click="addToCart('${product.productid}')"><span 
			class="glyphicon glyphicon-shopping-cart"></span>Order Now</a>
			<!-- <a href="<spring:url value="/cart"/>" class="btn btn-default"><span class="glyphicon glyphicon-hand-right"></span>View Cart</a> -->
			<a href="${req}/cart" class="btn btn-default"><span class="glyphicon glyphicon-hand-right"></span>View Cart</a>
			</p>
		</div>
		<script src="<c:url value="/resources/js/controller.js" />" > </script>
		<%@include file="footer.jsp"%>
	</div>
	
</body>
</html>

