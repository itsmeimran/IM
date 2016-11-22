<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	
	<div class="container">
		<h2>Add Product</h2>
		<p>Fill the below information to add a product:</p>		
	</div>
	<div class="container">
	
	<form:form  action="${req}/admin/productinventory/addproduct" method="post" enctype="multipart/form-data" commandName="product">
	<div class ="form-group">
	<label for="name">Name</label><form:errors path="productName" cssStyle="color:#ff0000;"/>
	<form:input path="productName" id="name" class="form-control"/>
	
	</div>
	<div class ="form-group">
	<label for="category">Category</label>
	<label class="checkbox-inline"><form:radiobutton path="productCategory" id="category"
	value="Mobile"/>Mobile</label>
	<label class="checkbox-inline"><form:radiobutton path="productCategory" id="category"
	value="AirConditioner"/>Air Conditioner</label>
	<label class="checkbox-inline"><form:radiobutton path="productCategory" id="category"
	value="Television"/>Television</label>
	</div>
	<div class ="form-group">
	<label for="description">Product Description</label>
	<form:textarea path="productDescription" id="description" class="form-control"/>
	</div>
	<div class ="form-group">
	<label for="price">Product Price</label><form:errors path="productPrice" cssStyle="color:#ff0000;"/>
	<form:input path="productPrice" id="price" class="form-control"/>
	</div>
	<div class="form-group">
	<label class="control-label" for="file">Upload Picture</label>
	<form:input id="file" path="file" type="file" class="form:input-large"/>
	</div>
	<br><br>
	<input type="submit" value="submit" class="btn btn-default">
	<a href="${req}/admin/productinventory" class="btn btn-default">Cancel</a>
	
	</form:form>
	
	<%@include file="footer.jsp"%>
	</div>
	
</body>
</html>

