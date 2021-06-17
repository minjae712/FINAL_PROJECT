<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
	var order_code;
	var user_code = '${user.mem_code}';
	
function fn_deleteOrder() {

	var del_Order = confirm("주문을 정말로 취소하시겠습니까?");
	
	if(order_code != 0 && order_code != null) {
		if(del_Order){
			location.href = "deleteOrder.do?sell_code=" + order_code + "&mem_code=" + user_code;
		}else{
			return;
		};
	}else {
		alert("취소할 주문을 선택해주세요");
		return;
	}
}

function fn_saveNum(num) {
	order_code = num;
}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
				        	<li><a href="getReservation.do?id=${user.id}">예약정보</a></li>
				        	<li class="active"><a href="getOrderList.do?mem_code=${user.mem_code}">주문정보<span class="sr-only">(current)</span></a></li>
						</ul>
				    </div>
				</div>
			</nav>
		</div>
	<div style="margin-top: 5%; margin-bottom: 5%;" align="center">
		<h1><b>&#60;내 주문정보&#62;</b></h1>
	</div>
	<div style="width: 50%; margin-left: 25%;margin-bottom: 10%;">
		<table class="table table-bordered">
			<tr>
				<th width="100">제품이름</th>
				<th width="30">주문일</th>
				<th width="60">배송지</th>
				<th width="50">주문자</th>
				<th width="50">요청사항</th>
				<th width="50">취소</th>
			</tr>
			<c:if test="${orderCount == 0}">
				<th colspan="6">주문 내역이 없습니다.</th>
			</c:if>
			<c:forEach items="${orderList}" var="order">
				<tr>
					<td>${order.pro_name}</td>
					<td>${order.sell_date}</td>
					<td>${order.address}</td>
					<td>${order.name}</td>
					<td>${order.req}</td>
					<td><input type="radio" id="del_reser${order.sell_code}" value="${order.sell_code}" onclick="fn_saveNum(${order.sell_code})"></td>
				</tr>
			</c:forEach>
		</table>
	<button class="btn btn-danger" type="button" onclick="fn_deleteOrder()">주문취소</button>
	</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>