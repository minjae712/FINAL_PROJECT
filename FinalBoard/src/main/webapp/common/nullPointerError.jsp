<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>게시글 수정</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/hf/header.jsp"></jsp:include>
<div align="center" style="margin-top: 10%; margin-bottom: 10%;">
<b>일치하는 데이터가 없습니다.</b><br>
<br>
<input class="btn btn-default" type="button" onclick="history.back(-1);" value="뒤로가기">
<a class="btn btn-default" href="index.jsp">메인화면으로</a>
</div>
	<jsp:include page="${pageContext.request.contextPath}/hf/footer.jsp"></jsp:include>
</body>
</html>