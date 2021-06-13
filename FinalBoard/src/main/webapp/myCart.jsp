<%@page import="com.springbook.biz.user.UserVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<style type="text/css">
a {
cursor: pointer;
}

</style>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	var mem_code = '${user.mem_code}';
	var totalCheck_count;
	
	
	$(document).ready(function(){
		fn_totalCheck();
	})
	
	function fn_deleteCart(c_code,m_code){
		
		var cart_con = confirm("선택한 상품을 장바구니에서 삭제하시겠습니까?");
		
		if(cart_con){
		    location.href = "deleteCart.do?cart_code=" + c_code + "&mem_code=" + m_code;
		}else{
			return;
		}
	}
	
	function fn_totalCheck(){
		$.ajax({
	        type : "POST",
	        dataType : "text",
	        url : "totalCheck.do",
	        data : {"mem_code" : mem_code},
	        success : function(data){
	        	totalCheck_count = data;
	        },
	        error : function(request,status,error){
	        	console.log("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});	
	}
	
	function fn_up(idx,price,code){
		pro_num = $("#Pro_num"+idx).val();
		if(pro_num < 100){
			var sum_N = (parseInt(pro_num) + 1);
			$("#Pro_num"+idx).attr("value", sum_N);
			$("#sum"+idx).html((sum_N * price)+" 원");
			var up_data = {
					"cart_code" : code,
					"count" : sum_N
			};
			$.ajax({
		        type : "POST",
		        dataType : "text",
		        url : "updateCart.do",
		        data : up_data,
		        success : function(data){
		        	
		        },
		        error : function(request,status,error){
		        	console.log("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
			});	
			
		}else {
			return;
		}
	};
	
	function fn_down(idx,price,code){
		pro_num = $("#Pro_num"+idx).val();
		if(pro_num > 1){
			var sum_N = (parseInt(pro_num) - 1);
			$("#Pro_num"+idx).attr("value",sum_N);
			$("#sum"+idx).html((sum_N * price)+" 원");
			var up_data = {
					"cart_code" : code,
					"count" : sum_N
			};
			$.ajax({
		        type : "POST",
		        dataType : "text",
		        url : "updateCart.do",
		        data : up_data,
		        success : function(data){
		        	
		        },
		        error : function(request,status,error){
		        	console.log("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
			});	
		}else {
			return;
		}
	};
	
	function fn_selectBuy() {
		var cart_con = confirm("선택한 상품들을 모두 구매하시겠습니까?");
		
		if(cart_con){
			
			if(totalCheck_count != 0){
				location.href = "getOrderSelected.do?mem_code=" + mem_code;
			}else {
				alert("구매할 상품을 선택해주세요");
				return;
			}
		}else{
			return;
		}
	};
	
	function fn_buyAll() {
		var cart_con = confirm("장바구니에 담긴 전체 상품을 구매하시겠습니까?");
		
		if(cart_con){
			location.href = "getOrderAll.do?mem_code=" + mem_code;
		}else{
			return;
		}
	};

	function fn_saveProduct(code,idx) {
		
		var ch_num = $("#select_"+idx).val();
		var ch_data = {
				"cart_code" : code,
				"pro_check" : ch_num
		}
		$.ajax({
	        type : "POST",
	        dataType : "text",
	        url : "checkProduct.do",
	        data : ch_data,
	        success : function(data){
				if($("#select_"+idx).val() == 1){
	        		$("#select_"+idx).attr("value",0);
	        		totalCheck_count -= 1;
				}else if($("#select_"+idx).val() == 0){
					$("#select_"+idx).attr("value",1);
					totalCheck_count += 1;
				}
				fn_totalCheck();
	        },
	        error : function(request,status,error){
	        	console.log("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});	
		
	};	
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>장바구니</title>
</head>
<body>
<jsp:include page="./hf/header.jsp"></jsp:include>
<div style="margin-top: 5%; margin-bottom: 5%;" align="center">
	<h1><b>&#60;내 장바구니&#62;</b></h1>
</div>
<div class="container" style="margin-top: 10%;margin-bottom: 10%;">
     <div class="row" >
         <div class="panel panel-default" style="border: 2px dashed; color: gray;">
         	<div class="panel-heading" style="background-color: gray;">
            	<h3 class="panel-title" align="center"><b style="color: white;">장바구니 품목 정보</b></h3>
          	</div>
			<div class="panel-body">
				<div class="col-md-6" style="width: 100%;">
				<table class="table">
					<tr>
						<td width="50">이미지</td>
						<td width="150">제품이름</td>
						<td width="50">제품수량</td>
						<td width="100">개당 가격</td>
						<td width="100">총 합계</td>
						<td width="50">선택</td>
						<td width="50">삭제</td>
					</tr>
					<c:if test="${cartCount == 0}">
						<tr><td colspan="7"><div align="center"><b>장바구니에 담은 목록이 없습니다.</b></div></td></tr>
					</c:if>
					<c:forEach items="${cartList}" var="cart" varStatus="status">
					<tr>
						<td><img style="width: 70px;height: 70px;" src="./productimage/${cart.image}"></td>
						<td>${cart.pro_name}</td>
						<td>
							<div class="input-group number-spinner" style="width: 120px;">
								<span class="input-group-btn data-dwn">
									<button class="btn btn-default" data-dir="dwn" id="down${status.index}" onclick="fn_down(${status.index},${cart.price},${cart.cart_code})"><span class="glyphicon glyphicon-minus"></span></button>
								</span>
								<input id="Pro_num${status.index}" type="text" class="form-control text-center" value="${cart.count}" min="1" max="100" readonly="readonly">
								<span class="input-group-btn data-up">
									<button class="btn btn-default" data-dir="up" id="up${status.index}" onclick="fn_up(${status.index},${cart.price},${cart.cart_code})" ><span class="glyphicon glyphicon-plus"></span></button>
								</span>
							</div>						
						</td>
						<td>${cart.price} 원</td>
						<td id="sum${status.index}"> ${cart.price * cart.count}원 </td>
						<td>
							<c:if test="${cart.pro_check == 1}">
								<input type="checkbox" id="select_${status.index}" value="0" onclick="fn_saveProduct(${cart.cart_code},${status.index})" checked="checked">
							</c:if>
							<c:if test="${cart.pro_check == 0}">
								<input type="checkbox" id="select_${status.index}" value="1" onclick="fn_saveProduct(${cart.cart_code},${status.index})" >
							</c:if>
						</td>
						<td><button class="btn btn-danger" type="button" onclick="fn_deleteCart(${cart.cart_code},'${user.mem_code}')"><i class="glyphicon glyphicon-remove" style="color: white;"></i></button></td>
					</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</div>
<div align="right">
		<button class="btn btn-default" onclick="fn_selectBuy()"><b>선택 품목 구매하기</b></button>
		<button class="btn btn-danger" onclick="fn_buyAll()"><b style="color: white;">전체 품목 구매하기</b></button>
</div>
</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>
