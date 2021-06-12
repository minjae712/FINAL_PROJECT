<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>주문완료</title>
</head>
<body>
<jsp:include page="./hf/header.jsp"></jsp:include>
<div align="center" style="margin-top: 10%;margin-bottom: 10%;">
	<b>주문이 완료되었습니다.</b><br>
	<br>
	<a class="btn btn-default" href="index.jsp">메인화면으로</a>
	<a class="btn btn-default" href="getOrderList.do?mem_code=${user.mem_code}">주문내역 조회</a>
</div>
<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>