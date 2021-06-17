<%@ page import="com.springbook.biz.user.UserVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
if(session.getAttribute("user") != null) {
	UserVO us = (UserVO)session.getAttribute("user");
	String a = us.getAddress();
	int b = 0;
	int c = 0;
	String addr = "";
	String addr2 = "";
	if(a.contains(",")) {
		b = a.indexOf(",");
		c = a.length();
		if(!a.endsWith(",")){
			addr = a.substring(0, b);
			addr2 = a.substring(b+1, c);
		}else {
			addr = a.substring(0, b);
		}
	}else{
		b = a.length();
		addr = a.substring(0, b);
	}
	request.setAttribute("addr", addr);
	request.setAttribute("addr2", addr2);
}
%>
<!DOCTYPE>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
a {
cursor: pointer;
}

</style>
<script type="text/javascript">
	
	var IMP = window.IMP;
	IMP.init('imp53078889'); 
	var payRange = '${payRange}';

function fn_payment() {
	
	var sum = ${totalPrice};
	
	var user_email = '${user.email}';
	var user_post = '${user.post}';
	var bill_phone = '${user.phone}';
	var bill_name = '${user.name}';
	var bill_mem_code = '${user.mem_code}';
	var bill_pro_name = '${cartList[0].pro_name}';
	var bill_pro_count = '${fn:length(cartList)}';
	
	var bill_address = '${addr},${addr2}';
	var bill_req = $("#req").val();
	
	var payment = confirm("정말로 결제를 하시겠습니까 ?");
	
	if(payment) {
	
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : bill_pro_name + " 외 "+ (bill_pro_count - 1) +"건 결제",
		    amount : sum,
		    buyer_email : user_email,
		    buyer_name : bill_name,
		    buyer_tel : bill_phone,
		    buyer_addr : bill_address,
		    buyer_postcode : user_post,
		    m_redirect_url : 'orderSuccess.jsp'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    
		    if ( rsp.success ) {
	    	$.ajax({
	            type : "POST",
	            url : "insertOrderList.do",
	            data : {"payRange" : payRange,
	            		"mem_code" : bill_mem_code,
	            		"address" : bill_address,
	            		"phone" : bill_phone,
	            		"name" : bill_name,
	            		"req" : bill_req},
	            dataType : "text",
	            success : function(data){
	            	location.href = "orderSuccess.jsp"
	            },
	            error : function(request,status,error){
	                console.log("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            	alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	
	    	});
		    	
		    }
	
		    
		});
	
	}else{
		return;
	}
	
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="./js/create_User.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>주문 페이지</title>
</head>
<body>
<jsp:include page="./hf/header.jsp"></jsp:include>
<div class="bradcam_area " style="background-image: url('./resources/css/img/banner/bradcam_SH.png');">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="bradcam_text text-center">
                    <h3>PET SHOP</h3>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" style="margin-top: 10%;">
     <div class="row" >
         <div class="panel panel-default" style="border: 2px dashed; color: gray;">
         	<div class="panel-heading" style="background-color: gray;">
            	<h3 class="panel-title" align="center"><b style="color: white;">구매 제품 정보</b></h3>
          	</div>
			<div class="panel-body">
				<div class="col-md-6" style="width: 100%;">
				<table id="pro_table" class="table">
					<tr>
						<td width="100">이미지</td>
						<td width="200">제품이름</td>
						<td width="50">제품수량</td>
						<td width="100">개당 가격</td>
						<td width="100">총 합계</td>
					</tr>
					<c:forEach items="${cartList}" var="cart" varStatus="status">
					<tr>
						<td><img style="width: 70px;height: 70px;" src="./productimage/${cart.image}"></td>
						<td>${cart.pro_name}</td>
						<td>${cart.count}</td>
						<td>${cart.price} 원</td>
						<td id="sum${status.index}" >${cart.price * cart.count} 원</td>
					</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="container" style="margin-bottom: 10%;">
		<div class="row">
			<div class="panel panel-default"
				style="border: 2px dashed; color: #619fd7">
				<div class="panel-heading" style="background-color: #619fd7">
					<h1 class="panel-title" align="center">
						<b style="color: white;">결제하기</b>
					</h1>
				</div>
				<div class="panel panel-info">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-9">
								<table class="table table-user-information">
									<tbody>
										<tr align="center">
											<td colspan="2"><b>배송지 선택</b>&nbsp;&nbsp;
												<font size="1px;" color="gray"></font>
												&nbsp;&nbsp;&nbsp; 
												<span class="stars starrr replyStar" data-rating=""></span>
											</td>
										</tr>
										<tr>
											<td style="width: 45%;"><label>내 배송지 정보</label><br>
												<div class="form-group has-warning">
													<input type="text" class="form-control" id="zip" name="post" readonly="readonly" style="width: 100px" value="${user.post}" required>
													<input type="text" class="form-control" id="addr1" name="address" readonly="readonly" value="${addr}"required>
													<input type="text" class="form-control" id="addr2" name="address" value="${addr2}" >
													<button class="btn btn-default" type="button" onClick="execDaumPostcode();">
														<i class="fa fa-search"></i>주소검색
													</button>
												</div>
											</td>
											<td><label>주문자 정보</label>
												<div class="form-group has-warning">
													<label class="control-label">이름</label>
													<input type="text" class="form-control" name="name" value="${user.name}" style="width: 30%" readonly="readonly" required>
												</div>											
												<div class="form-group has-warning">
													<label class="control-label">전화번호</label>
													<input type="text" class="form-control" name="phone" value="${user.phone}" style="width: 30%" readonly="readonly" required><br>
													<label class="control-label">요청사항</label><br>
													<select id="req" class="form-control" style="width: 60%">
														<option>(선택사항)</option>
														<option>배송전, 연락바랍니다.</option>
														<option>부재시, 문자 또는 전화주세요.</option>
														<option>부재시 경비실에 맡겨주세요</option>
													</select>
												</div>											
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-md-3" align="center" style="border: 2px dashed;width: 20%;margin-top: 5%;">
								<h2><b>최종 결제금액</b></h2>
								<div id="result_pay" style="border-top: 1px solid;color: gray;">
									<h3><b> ${totalPrice} 원 </b></h3>
								</div>
								<div style="border-top: 1px solid;color: gray;">
									<div style="margin-bottom: 5%;"></div>
									<button class="btn btn-primary" style="width: 200px;height: 75px"><b style="font-size: 32px;color: white;" onclick="fn_payment()">결제하기</b></button>
									<div style="margin-bottom: 5%;"></div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>
