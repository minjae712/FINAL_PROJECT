<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var image = '${user.image}';

$(document).ready(function(){
	fn_image();
})

function fn_image() {
	if(image != null && image != "") {
		var fullPath = "customcss\\" + image;
		$("#pic").attr("src",fullPath);
	}
}

function fn_delete() {
	
	var del_Mem = confirm("회원 탈퇴 후, 회원정보 복구는 불가능합니다. 정말로 탈퇴하시겠습니까?");
	
	if(del_Mem){
		location.href="passwordConfirm_del.jsp";
	}else{
		return;
	};
	
}
</script>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>내 정보</title>
</head>
<body>
	<jsp:include page="./hf/header.jsp"></jsp:include>
		<div style="width: 50%; margin-left: 25%">
			<nav class="navbar navbar-inverse" style="margin-top: 5%;">
				<div class="container-fluid">
				    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				    	<ul class="nav navbar-nav">
				        	<li class="active"><a href="getUser.do">회원정보 <span class="sr-only">(current)</span></a></li>
				        	<li><a href="getReservation.do?id=${user.id}">예약정보</a></li>
				        	<li><a href="getOrderList.do?mem_code=${user.mem_code}">주문정보</a></li>
						</ul>
				    </div>
				</div>
			</nav>
		</div>
	<div style="margin-top: 5%; margin-bottom: 5%;" align="center">
		<h1><b>&#60;내 회원정보&#62;</b></h1>
	</div>
		<div align="center">
			<label>프로필 사진</label><br><br>
			<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="${request.getRealPath('')}customcss\defaultpic.png"><br>
		</div><br>
	<div style="margin-left: 39%;margin-bottom: 10%;">
		<span class="form-group has-warning">
			<label class="col-md-1 control-label">아이디</label>
			<span class="col-md-1">
				<input class="form-control" type="text" value="${user.id}" style="width: 160px;" readonly="readonly">
			</span>
		</span><br><br><br>
		<span class="form-group has-warning">		
			<label class="col-md-1 control-label">등급</label>
			<span class="col-md-1">
				<input class="form-control" type="text" value="${user.role}" style="width: 160px;" readonly="readonly">
			</span>
		</span><br><br><br>
		<span class="form-group has-warning">
			<label class="col-md-1 control-label">이메일</label>
			<span class="col-md-1">
				<input class="form-control" type="text" value="${user.email}" style="width: 160px;" readonly="readonly">
			</span>
		</span><br><br><br>
		<span class="form-group has-warning">	
			<label class="col-md-1 control-label">이름</label>
			<span class="col-md-1">
				<input class="form-control" type="text" value="${user.name}" style="width: 160px;" readonly="readonly">
			</span>
		</span><br><br><br>
		<span class="form-group has-warning">
			<label class="col-md-1 control-label">생일</label>
			<span class="col-md-1">
				<input class="form-control" type="text" value="${user.birth}" style="width: 160px;" readonly="readonly">
			</span>
		</span><br><br><br>
		<span class="form-group has-warning">	
			<label class="col-md-1 control-label">주소</label>
			<span class="col-md-1">
				<input class="form-control" type="text" value="${user.address}" style="width: 300px;" readonly="readonly">
			</span>
		</span><br><br><br>
	<a href="passwordConfirm_update.jsp"><button type="button" class="btn btn-primary">회원정보 수정</button></a>
	<a href="passwordConfirm_change.jsp"><button type="button" class="btn btn-primary" >비밀번호 변경</button></a>
	<button type="button" class="btn btn-danger" onclick="fn_delete()">회원탈퇴</button>
	</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>