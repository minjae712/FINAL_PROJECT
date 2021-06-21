<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>회원정보 수정</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/hf/header.jsp"></jsp:include>
<div align="center" style="margin-top: 10%;margin-bottom: 10%">
		<b>회원정보 수정이 완료되었습니다.</b><br>
		<br>
		<a class="btn btn-default" href="index.jsp">홈으로</a>
		<a class="btn btn-default" href="getUser.do?id=${user.id}">마이 페이지</a>
</div>
	<jsp:include page="${pageContext.request.contextPath}/hf/footer.jsp"></jsp:include>
</body>
</html>