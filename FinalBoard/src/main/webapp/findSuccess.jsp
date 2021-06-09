<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>게시글 수정</title>
</head>
<body>
<jsp:include page="./hf/header.jsp"></jsp:include>
<div align="center" style="margin-top: 10%;margin-bottom: 10%;">
	<b>회원님의 비밀번호는"${find.password}"입니다.</b><br>
	<br>
	<a class="btn btn-default" href="index.jsp">메인화면으로</a>
	<a class="btn btn-default" href="login.jsp">로그인하기</a>
</div>
<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>