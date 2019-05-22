 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
img {
	image-rendering: auto;
	
	
}

table {
/* 
 border="1" rules="rows"
vertical-align=" top"
border-style: hidden; 
   border: 1px solid ; 
vertical-align: top; 

border-bottom:1px solid #000000;

 border: 1px solid #000000 ; 
 
 */
 border-top: 1px solid #adadad;
 border-collapse : collapse;
}
th, td{
border-bottom: 1px solid #adadad;
padding: 4px;
}


table, tr, td {
	
	vertical-align: top;
	text-align: center;
	font-size: 20pt;
/* 		background: #efefef;
 */		
}

th { 
	    
	font-weight: bold;
	vertical-align: top;
/*  	background: #efefef;
 */
 
  }


a {
	font-size: 20pt;
	color: #000000;
}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css" />

</head>
<body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	function backlist(){
		location.href = "ProductList.po";
	}
	function addaction(){
		productaddform.submit();
	}
</script>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today"/>

<form method="post" action="ProductAddAction.po" name = "productaddform"><%-- 
<input type="text" name = "image" id = "image" value="<%=request.getParameter("image")%>" readonly/>

 --%>
<br><br><br><br><br><br><br><br><br>
<table >
		<tr>
			<th colspan="2">상품등록</th>
		

		<tr>
			<th>상품분류</th>
	 <td><input type="text" name="category" id="category" style="width:100%; border: 0; font-size: 18pt;" ></td>
 		</tr>

		<tr>
			<th>상품이름</th>
	<td ><input type="text" name="name" id="name" style="width:100%; border: 0; font-size: 18pt;" ></td>
			</tr>

		<tr>
			<th>원가</th>
<td><input type="text" name="cost" id="cost" style="width:100%; border: 0; font-size: 18pt;" ></td>
		</tr>


		

		<tr>
			<th>판매가</th>
		<td><input type="text" id="price" name="price" style="width:100%; border: 0; font-size: 18pt;" ></td>	
		</tr>

		<tr>

			<th>수량</th>
		 <td ><input type="text" id="count" name="count" style="width:100%; border: 0; font-size: 18pt;"></td>
 
 
 
 		</tr>

<tr>

			<th>상품등록일</th>
		<td >
         <input type="text" name="date" id="date" value="${today}" style="width:100%; border: 0; font-size: 20pt;" readonly />
      </td>
      		</tr>


		<tr>
			<th>&emsp;상품상세 설명&emsp;</th>
      <td><textarea rows="8" cols="30" name="detail" id="detail"  style="width:100%; border: 0; font-size: 18pt;"></textarea></td>
		
		</tr>

		<tr>
			<th colspan="2"><a href="imageAdd.po">이미지 등록하기</a>
			<br> <input type="text" name = "image" id = "image" value="<%=request.getParameter("image")%>"  style="width:100%; border: 0;" readonly/> <br>
			</th>
	</tr>
	
	<tr><th colspan="2">
		<%-- 	<td>
      <div ><jsp:include page="imageAdd.jsp" flush="true"></jsp:include></div>
      </td>	 --%>
      
    	<img src="<%=request.getParameter("image")%>"style=" width: 300px; overflow: hidden;"> </th>
      </tr>



	</table>

<br><br><br><br>
<center>
<!-- <input type="submit" value="" style="font-size: 20pt;" >&emsp;&emsp; -->

</center>

</form>
<a href ="javascript:addaction()">완료</a>&emsp;&emsp;
<a href ="javascript:backlist()">목록</a>
</body>
</html> 