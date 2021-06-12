<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
	var r_num;
	var r_id = '${user.id}';
	
function fn_deleteReser() {

	var del_Reser = confirm("예약을 정말로 취소하시겠습니까?");
	
	if(r_num != 0 && r_num != null) {
		if(del_Reser){
			location.href = "deleteReser.do?no=" + r_num + "&user_id=" + r_id;
		}else{
			return;
		};
	}else {
		alert("취소할 예약을 선택해주세요");
		return;
	}
}

function fn_saveNum(num) {
	r_num = num;
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
				        	<li><a href="getUser.do">회원정보 </a></li>
				        	<li class="active"><a href="getReservation.do?id=${user.id}">예약정보<span class="sr-only">(current)</span></a></li>
				        	<li><a href="getOrderList.do?mem_code=${user.mem_code}">주문정보</a></li>
						</ul>
				    </div>
				</div>
			</nav>
		</div>
	<div style="margin-top: 5%; margin-bottom: 5%;" align="center">
		<h1><b>&#60;내 예약정보&#62;</b></h1>
	</div>
	<div style="width: 50%; margin-left: 25%;margin-bottom: 10%;">
		<table class="table table-bordered">
			<tr>
				<th width="30">종류</th>
				<th width="30">예약자</th>
				<th width="60">예약일</th>
				<th width="100">예약병원</th>
				<th width="50">예약내용</th>
				<th width="10">취소</th>
			</tr>
			<c:if test="${resCount == 0}">
				<th colspan="6">예약 내역이 없습니다.</th>
			</c:if>
			<c:forEach items="${reservationList}" var="res">
				<tr>
					<td>${res.kind}</td>
					<td>${res.user_name}</td>
					<td>${res.reser_date}</td>
					<td>${res.title}</td>
					<td>${res.content}</td>
					<td><input type="radio" id="del_reser${res.no}" value="${res.no}" onclick="fn_saveNum(${res.no})"></td>
				</tr>
			</c:forEach>
		</table>
	<button class="btn btn-danger" type="button" onclick="fn_deleteReser()">예약취소</button>
	</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>