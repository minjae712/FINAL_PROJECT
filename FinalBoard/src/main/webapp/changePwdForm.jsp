<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>암호 변경</title>
</head>
<body>
	<jsp:include page="./hf/header.jsp"></jsp:include>
	<div align="center" style="margin-bottom: 10%;margin-top: 5%;">
		<h1><a onclick="location.reload()" style="cursor: pointer;"><b>비밀번호 변경</b></a></h1>
		<form class="form-inline" action="changePassword.do" method="post">
			<div class="form-group has-warning" style="margin-top: 3%">
				<label class="control-label">아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input class="form-control" placeholder="ID" type="text" value="${user.id}" name="id" readonly="readonly">
			</div><br><br>
			<div class="form-group has-warning" >	
				<label class="control-label">새 비밀번호</label>
				<input type="password" name="Password" class="form-control" placeholder="새 비밀번호" /><br><br><br>
				<input type="submit" value="비밀번호 변경" class="btn btn-danger" />
				<input class="btn btn-default" type="button" onclick="history.back(-1);" value="취소">
			</div>
		</form>
	</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>