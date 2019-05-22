<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상품등록</title>
<style type="text/css">
body {
	background-color: #f1f1f1;
} 
</style>

</head>
<body>

	<div id="container">

		<div><jsp:include page="/header.jsp" flush="false"></jsp:include></div>
		<center>
		<div><jsp:include page="productAdd.jsp" flush="true"></jsp:include></div>
		</center>
		<div><jsp:include page="/bottom1.jsp" flush="false"></jsp:include></div>
		<div><jsp:include page="/bottom.jsp" flush="false"></jsp:include></div>

	</div>
</body>
</html>