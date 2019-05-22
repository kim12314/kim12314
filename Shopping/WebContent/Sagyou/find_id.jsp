<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

</head>
<body>
<form method="post" action="MemberFindIdAction.mo">
<table>
	<tr>
		<td>
			<h4>이름 : </h4>
		</td>
		<td>
			<input type="text" name = "name" id="id"/>
		</td>
	</tr>
	<tr>	
		<td>
			<h4>주민등록번호 : </h4>
		</td>
		<td>
			<input type="text" name = "jumin" id="jumin"/>
		</td>
	</tr>
</table>
<input type="submit" value="찾기"/>
</form>
</body>
</html>