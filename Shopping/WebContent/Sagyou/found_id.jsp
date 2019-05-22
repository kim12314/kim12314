<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
	function foundid(){
		window.open(this,'아이디 찾기', 'width=400, height=250, location=no, status=no, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
	}
</script>
</head>
<body onload="foundid()">
<h3>당신의 아이디</h3><hr>
"${id}" &nspb;입니다.
</body>
</html>