<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<script type="text/javascript">

$(document).ready(function(){

	$("#submit").on("click", function(){
		if($("#userPass").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			return false;
		}	
	});
})
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원탈퇴 확인</title>
</head>
<body>
	<jsp:include page="./hf/header.jsp"></jsp:include>
<div align="center" style="margin-top: 10%;margin-bottom: 10%;">
		<b>현재 비밀번호를 입력해주세요.</b><br>
		<br>
		<section id="container">
			<form action="userDelete.do" method="post">
				<div class="form-group has-warning" style="margin-left: 40%;">
				  <label class="col-md-1 control-label">아이디</label>
				  <input type="text" class="col-md-1 form-control" id="userId" name="id" value="${user.id}" readonly="readonly" style="width: 150px">
				</div><br><br>
				<div class="form-group has-warning" style="margin-left: 40%;">
				  <label class="col-md-1 control-label" >이름</label>
				  <input type="text" class="col-md-1 form-control" id="userName" name="name" value="${user.name}" readonly="readonly" style="width: 150px">
				</div><br><br><br>
				<div class="form-group has-warning" style="margin-left: 40%;">
				  <label class="col-md-1 control-label">PW</label>
				  <input type="text" class="col-md-1 form-control" type="password" id="userPass" name="password" style="width: 150px">
				</div><br><br>	
				<button class="btn btn-danger" type="submit" id="submit">회원탈퇴</button>
				<a href="index.jsp"><button class="btn btn-default" type="button">취소</button></a>
			</form>
			<div><br><br>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</section>
</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>