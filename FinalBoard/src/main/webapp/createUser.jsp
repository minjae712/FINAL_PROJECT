<%@page import="java.sql.Date"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="./js/create_User.js" type="text/javascript"></script>
<title>회원가입</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.btn-space {
    margin-right: 5px;
}
</style>
    </head>

<body>
<jsp:include page="./hf/header.jsp"></jsp:include>
	<article class="container">
	<div class="page-header">
		<center>
			<h1>
				<a onclick="location.reload()" style="cursor: pointer;"><b>회원가입</b></a>
			</h1>
		</center>
	</div>

	<form action="createUser.do" method="post" enctype="multipart/form-data">
		<div class="col-sm-6 col-md-offset-3">
			
			<div class="form-group">
				<label for="profile">프로필 사진</label><br>
				<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="${request.getRealPath('')}customcss\defaultpic.png"><br><br>
				<input  style="width: 300px" type="file" name="file" onchange="setThumbnail(event)" />
			</div>
			
			<div class="form-group">
				<label for="inputName">이름</label>
				<input type="text" class="form-control" name="name" placeholder="이름을 입력해 주세요" required>
			</div>

			<div class="form-group">
				<label for="inputName">아이디</label>
				<input type="text" class="form-control" name="id" placeholder="아이디를 입력해 주세요" required>
			</div>

			<div class="form-group">
				<label for="inputPassword">비밀번호</label>
				<input type="password" class="form-control" name="password" placeholder="비밀번호를 입력해주세요" required>
			</div>

			<div class="form-group">
				<label for="InputEmail">이메일 주소</label>
				<input type="email" class="form-control" name="email" placeholder="이메일 주소를 입력해주세요" required>
			</div>

			<div class="form-group">
				<label for="inputBirth">생년월일</label>
				<input type="date" class="form-control" name="birth" placeholder=" ex) 19990101" required>
			</div>

			<div class="form-group">
				<label>가입 등급</label>
				<div class="form-control">
					<label class="radio-inline">
					<input type="radio" name="role" value="User" checked> User
					</label>
				</div>
			</div>

			<div class="form-group">
				<label>주소</label>
				<input type="text" class="form-control" id="zip" name="post" placeholder="우편번호" readonly="readonly" style="width: 100px" required>
				<input type="text" class="form-control" id="addr1" name="address" placeholder="주소" readonly="readonly" required>
				<input type="text" class="form-control" id="addr2" name="address" placeholder="상세주소">
				<button class="btn btn-default" type="button" onClick="execDaumPostcode();">
					<i class="fa fa-search"></i>주소검색
				</button>
			</div>

			<div class="form-group text-center">
				<button type="submit" id="join-submit" class="btn btn-primary btn-space">
					회원가입<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="button" class="btn btn-danger" onClick="location.href='index.jsp'" >
					취소<i class="fa fa-check spaceLeft"></i>
				</button>
			</div>
			</div>
	</form>
	</article>
	<hr>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
	</body>
</html>