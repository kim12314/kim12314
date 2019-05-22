<%@page import="net.Delivery.db.*"%>
<%@page import="net.member.db.*"%>
<%@page import="java.lang.reflect.Member"%>
<%@page import="java.util.List"%>
<%@page import="net.product.db.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	MemberDAO md = new MemberDAO();
	ProductBean bean = (ProductBean) session.getAttribute("detailOrder");
	int count = bean.getProduct_count();
	int price = bean.getProduct_price();
	String id = (String) session.getAttribute("id");
	String address = md.getMemDetail(id).getMember_address();
%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function myFunction() {
		var x= parseInt(document.getElementById("Order_count").value);  
		var y ="<%=price%>"; 
		document.getElementById("demo").innerHTML =(x*y)+'원';
		document.getElementById("count").value=x;
		document.getElementById("count1").value=x;
		document.getElementById("price").value=x*y;
                 
		var point= parseInt(document.getElementById("Order_count").value);  
		var y ="<%=price%>";
                 
		document.getElementById("pointgo").innerHTML = parseInt((x * y) / 1000)+'원';
		document.getElementById("point").value = parseInt((x * y) / 1000);
	}

	function goCart() {
        basketform.submit();
     }
	
	function deliveryaction(){
		deliveryaction.submit();
	}
</script>

<style>
div.detailimage img {
	position: absolute;
	left: 400px;
	top: 300px;
}

div.detail {
	position: absolute;
	left: 1000px;
	top: 300px;
}

.detailimage {
	overflow: hidden;
}

.detailimage img {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-ms-transition: .3s;
	-o-transition: .3s;
	transition: .3s;
}
/* img 마우스 오버시*/
.detailimage:hover img {
	cursor: pointer;
	transform: scale(1.1); /* 마우스 오버시 이미지 크기를 1.1 배만큼 확대 */
	-o-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-webkit-transform: scale(1.1);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
	/* 마우스 오버시 이미지가 즉시 커지지 않고 30.5 second 의 시간에 걸쳐 커지는 애니메이션 효과*/
}	
	
.butn {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
}

.button4 {
  background-color: white;
  color: black;
  border: 2px solid #e7e7e7;
}

.button4:hover {background-color: #e7e7e7;}

.button5 {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}

.button5:hover {
  background-color: #555555;
  color: white;

</style>

<meta charset="UTF-8">
<title>Product_detail</title>
<link rel="stylesheet" href="css/style.css" />

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="date" />

</head>

<body onload="myFunction()">
<jsp:include page="/header.jsp"></jsp:include>
	
	
	<div class="detailimage">
			<img src="<%=bean.getProduct_image()%>" style="width: 400px;">
	</div>
	
		<div class="detail">
			<table>
				<tr>
					<td><h2>PRODUCT NAME</h2></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=bean.getProduct_name()%></td>
				</tr>
				<tr>
					<td><h2>PRICCE</h2></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=price%>원</td>
				</tr>
				<tr>
					<td><h2>COUNT</h2></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp; <select id="Order_count"
						name="count" onchange="myFunction()">
							<%
								for (int i = 1; i <= count; i++) {
							%>
							<option value="<%=i%>" name="Order_count" > <%=i%> </option>
							<%
								}
							%>
					</select>
					</td>
				</tr>
				<tr>
					<td><h2>TOTAL</h2></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;
						<p id="demo"></p>
					</td>
				</tr>
				<tr>
					<td><h2>POINT</h2></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;
						<p id="pointgo"></p>
					</td>
				</tr>
			</table>
			<br>
			<br>
			<br>
			<br>
			
			<div class="button">
				<form action="DeliveryAction.do" method="post" name="deliveryaction">
					<input type="hidden" value="${id}" name="id"> 
					<input type="hidden" value="<%=bean.getProduct_price()%>" name="price">
					<input type="hidden" value="<%=bean.getProduct_image()%>" name="image">
					<input type="hidden" name="date" value="${date}"> 
					<input type="hidden" value="<%=bean.getProduct_name()%>" name="name">
					<input type="hidden" id="count" name="count"> 
					<input type="hidden" value="배송준비중" name="result"> 
					<input type="hidden" id="price" name="hap"> 
					<input type="hidden" id="point" name="point"> 
					<input type="hidden" value="<%=bean.getProduct_code()%>" name="code"> 
					<input type="hidden" value="<%=address%>" name="address">
					<a href="javascript:deliveryaction()">
						<button class="butn button4">BUY NOW</button>
					</a>
				</form>
				 

				<form method="post" action="CartAddAction.co" name="basketform">
        			<input type="hidden" value="${id}" name="id" id="id">
          			<input type="hidden" value="<%=bean.getProduct_code()%>" name="code" id="code">
          			<input type="hidden" value="<%=bean.getProduct_image()%>" name="image" id="image">
          			<input type="hidden" value="<%=bean.getProduct_name() %>" name="name" id="name">
          			<input type="hidden" id="count1" name="count">
          			<input type="hidden" id="price" name="price" value="<%=bean.getProduct_price() %>">
          			<input type="hidden" id="delprice" name="delprice" value="2500">
          			<a href="javascript:goCart()">
						<button class="butn button5">ADD CART</button>
					</a>
				</form>
				
			</div>
		</div>
	
	<div><jsp:include page="/bottom1.jsp" flush="false"></jsp:include></div>
	<div><jsp:include page="/bottom.jsp" flush="false"></jsp:include></div>
</body>
</html>