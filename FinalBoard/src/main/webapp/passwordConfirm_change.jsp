<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

var u_pass = '${user.password}';

$(document).ready(function(){

	$("#in_pass").on("click", function(){
		if($("#userPass").val() == "" || $("#userPass").val() == null){
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			return false;
		}else if($("#userPass").val() != u_pass) {
			alert("비밀번호가 맞지 않습니다.");
			$("#userPass").focus();
			return;
		}else {
			location.href="changePwdForm.jsp";
		}
	});
})
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>PW수정 확인</title>
</head>
<body>
	<jsp:include page="./hf/header.jsp"></jsp:include>
<div align="center" style="margin-top: 10%;margin-bottom: 10%;">
		<b>현재 비밀번호를 입력해주세요.</b><br>
		<br>
		<section id="container">
				<div class="form-group has-warning" style="margin-left: 42%;">
				  <label class="col-md-1 control-label">PW</label>
				  <input type="password" class="col-md-1 form-control" type="password" id="userPass" name="password" style="width: 150px">
				</div><br><br><br>	
				<button class="btn btn-danger" type="button" id="in_pass">입력</button>
				<a href="index.jsp"><button class="btn btn-default" type="button">취소</button></a>
		</section>
</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>