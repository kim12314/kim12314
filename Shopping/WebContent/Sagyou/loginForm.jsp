<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="css/style.css" />
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<style>
h1 {
	padding: 50px 0;
	font-weight: 400;
	text-align: center;
}

p {
	margin: 0 0 20px;
	line-height: 1.5;
}

.main {
	min-width: 320px;
	max-width: 850px;
	padding: 50px;
	margin: 0 auto;
	background: #ffffff;
	max-width: 850px;
}

section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

/*라디오버튼 숨김*/
#tab1, #tab2 {
	display: none;
}

label {
	display: inline-block;
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
}

label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
input:checked+label {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2 {
	display: block;
}

Button {
	background-color: transparent;
	border: 0px none;
}

.btnImage {
	background-color: transparent;
	vertical-align: middle;
	background: url("loginButton.png") no-repeat;
	border: 0px none;
	cursor: pointer;
	clear: none;
	float: none;
}
#naverIdLogin{
	text-align: center;
}
/* login_div{
	position:fixed;
} */
</style>
<link rel="stylesheet" href="css/style.css" />
<title>Login</title>
<script type="text/javascript">
	function findid(){
		window.open('Sagyou/find_id.jsp','아이디 찾기', 'top=300px, left=400px, width=400, height=250, location=no, status=no, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
	}
</script>
</head>
<body>
	<div id="container">
		<div id="login_div"><jsp:include page="/header.jsp"></jsp:include></div>
		<br> <br> <br> <br>
		<div class="main">
			<form name="loginform" action="MemberLoginAction.mo" method="post">
				<br>
				<center>
					<table width=400px;>
						<tr>
							<td colspan="2" align="center" style="font-size: 20pt;"><b>LOGIN</b>
							</td>
						</tr>
						<tr>
							<td align=center style="font-size: 12pt;">I D</td>
							<td><input type="text" name="id" id="id"
								style="width: 250px; height: 30px; font-size: 10pt;"></td>
							<td rowspan="2">
								<div>
									<button type="submit" value="LOGIN">
										<img class="btnImage" src="image/loginButton.png">
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<td align=center style="font-size: 12pt;">PASS</td>
							<td><input type="password" name="pw" id="pw"
								style="width: 250px; height: 30px; font-size: 10pt;"></td>
						</tr>

					</table>
					<table>
						<tr>
							<td>
								<div>
									<a href="javascript:findid()">아이디 찾기</a>
								</div>
							</td>
							<td>
								<div>
									<a href="main.jsp">비밀번호 찾기</a>
								</div>
							</td>
						</tr>
					</table>
				</center>
			</form>
		</div>
	</div>
	
	
	<div id="naverIdLogin">
		<%
   		String clientId = "817YOaY39wvn8CRMKIfT";//애플리케이션 클라이언트 아이디값";
    	String redirectURI = URLEncoder.encode("http://localhost:8090/Shopping/MemberNILoginAction.mo", "UTF-8");
    	SecureRandom random = new SecureRandom();
   	 	String state = new BigInteger(130, random).toString();
    	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    	apiURL += "&client_id=" + clientId;
    	apiURL += "&redirect_uri=" + redirectURI;
    	apiURL += "&state=" + state;
    	session.setAttribute("state", state);
 		%>
  		<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	</div>
</body>
</html>