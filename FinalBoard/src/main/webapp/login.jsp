<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.net.URLEncoder" %>
<%@page import="java.security.SecureRandom" %>
<%@page import="java.math.BigInteger" %>
<%
    String clientId = "YKYpuOJLQ2PUQWr6wdPJ";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:9994/naverLogin.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
	margin-top: 10%;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- jQuery 라이브러리 참조 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<!-- plugin 참조 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="./js/login_find.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
</head>
<body>
	<center>
	<div style="width: 70%">
		<h1><a onclick="location.reload()" style="cursor: pointer;"><b>로그인</b></a></h1>
		<hr>
		<form class="form-inline" id="loginForm" name="loginForm" action="login.do" method="post">
			<div class="form-group" align="center">
					<label for="exampleInputName2">아이디</label>
					<input class="form-control" placeholder="ID" type="text" id="id" name="id" />
			</div>
			<div class="form-group" align="center">
					<label for="exampleInputName2">비밀번호</label>
					<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호"/>
					<input type="submit" id="btnLogin" value="로그인" class="btn btn-default"/>
					<a class="btn btn-default" href="index.jsp">취소</a>
			</div>
			<div>
            	<label for="autoSave">아이디/비밀번호 저장</label>
            	<input type="checkbox" name="autoSave" id="autoSave">
        	</div>	
		</form>
		<a href="<%=apiURL%>"><img height="50" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
		
		<hr>
					<a href="find_id.jsp"><b>아이디 찾기</b></a>&nbsp;|&nbsp;<a href="findPassword.jsp"><b>비밀번호 찾기</b></a>
	</div>
	</center>
</body>
</html>