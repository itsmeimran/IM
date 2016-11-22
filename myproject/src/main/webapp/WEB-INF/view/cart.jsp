<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="req" value="${pageContext.request.contextPath}" />
<%@include file="header.jsp"%>
<div class="container-wrapper">
	<div class="container">
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1>Cart</h1>
					<p>All the selected products in your shopping cart.</p>
				</div>
			</div>
		</section>
		<section class="container" ng-app="cartApp">
			<div>
				<a class="btn btn-danger pull-left" ng-click="clearCart()"><span
					class="glyphicon glyphicon-remove-sign"></span>Clear Cart</a>
			</div>
			<table class="table table-hover">
				<tr>
					<th>Product</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
				<tr ng-repeat=item in cart.cartItems"">
				<div ng-controller="cartCtrl" ng-init="initCartId('${cartId}')">
					<td>{{item.product.productName}}</td>
					<td>{{item.product.productPrice}}</td>
					<td>{{item.quantity}}</td>
					<td>{{item.totalPrice}}</td>
					<td><a href="#" class="label label-danger" 
					ng-click="removeFromCart(item.product.productId)">
					<span class="glyphicon glyphicon-remove"></span>remove</a></td>
				</tr>
				<tr>
					<th></th>
					<th></th>
					<th>Grand Total</th>
					<th>{{cart.grandTotal}}</th>
					<th></th>
				</tr>
			</table>
			<a href="${req}/productlist" class="btn btn-default">Continue Shopping</a>
			</div>
		</section>
	</div>

</div>
<script src='<c:url value="/resources/js/controller.js" />'></script>
<%@include file="footer.jsp"%>