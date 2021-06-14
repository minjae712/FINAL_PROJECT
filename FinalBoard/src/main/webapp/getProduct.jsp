<%@page import="com.springbook.biz.user.UserVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
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
	
	var pro_num = 1;
	
	var pro_code = '${product.pro_code}';
	var pro_name = '${product.name}';
	var pro_image = '${product.image}';
	var pro_price = ${product.price};
	var mem_code = '${user.mem_code}';
	

	function fn_up(){
		pro_num = $("#Pro_num").val();
		if(pro_num < 100){
			$("#Pro_num").attr("value", (parseInt(pro_num) + 1));
		}else {
			return;
		}
	};
	
	function fn_down(){
		pro_num = $("#Pro_num").val();
		if(pro_num > 1){
			$("#Pro_num").attr("value",(parseInt(pro_num) - 1));
		}else {
			return;
		}
	};
	
	function fn_buy() {
		pro_num = $("#Pro_num").val();
		var buy_pro = confirm("해당 상품을 바로 구매하시겠습니까?");
		
		if(buy_pro){
			location.href = "getOrder.do?pro_code=" + pro_code + "&name=" + pro_name + "&price=" + pro_price + "&count=" + pro_num + "&image=" + pro_image;
		}else{
			return;
		}
	};
	
	function fn_cart() {
		pro_num = $("#Pro_num").val();
		var cart_pro = confirm("해당 상품을 장바구니에 담으시겠습니까?");
		
		var formData = new FormData();
		formData.append("pro_code",pro_code);
		formData.append("pro_name",pro_name);
		formData.append("mem_code",mem_code);
		formData.append("count",pro_num);
		formData.append("price",pro_price);
		formData.append("image",pro_image);
		
		if(cart_pro){
			
			$.ajax({
		        type : "POST",
		        dataType : "text",
		        url : "insertCart.do",
		        data : formData,
	            contentType : false,
	            processData : false,
		        success : function(data){
		        	var cart_con = confirm("상품이 장바구니에 담겼습니다. 확인하시겠습니까?");
		        	
		        	if(cart_con){
		        		location.href = "myCartPage.do?mem_code=" + mem_code;
		        	}else {
		        		return;
		        	}
		        	
		        },
		        error : function(request,status,error){
		        	console.log("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        	alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
			});	

		}else{
			return;
		}

	};

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>주문 상세</title>
</head>
<body>
<jsp:include page="./hf/header.jsp"></jsp:include>
<div class="bradcam_area " style="background-image: url('./resources/css/img/banner/bradcam_SH.png');">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="bradcam_text text-center">
                    <h3>펫샵</h3>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" style="margin-top: 10%;">
     <div class="row" >
         <div class="panel panel-default" style="border: 2px dashed; color: #ed7d32">
          <div class="panel-heading" style="background-color: #ed7d32;">
             <h3 class="panel-title" align="center"><b style="color: white;">제품 상세</b></h3>
           </div>
           <div class="panel-body">
             <div class="row">
               <div class="col-md-6" align="center">
               	<img style="border: 5px dashed; color: #619fd7; margin-top: 10%;" id="image" src="./productimage/${product.image}" class="img-rounded img-responsive">
                </div>
               <div class="col-md-6">
               <br><br><br>
                 <table class="table">
                   <tbody>
                   <tr>
                       <td><b style="color: #619fd7;">제품명</b></td>
                       <td>${product.name}</td>
                     </tr>
                     <tr>
                       <td><b style="color: #619fd7;">판매가</b></td>
                       <td id="price">${product.price}원</td>
                     </tr>
                     <tr>
                       <td><b style="color: #619fd7;">평점</b></td>
                       <td>
                       	<%-- <c:if test=""> --%>없음<%-- </c:if> --%>
                       	<%-- <c:if test=""> --%>00점&nbsp;&nbsp;<%-- </c:if> --%>
                       </td>
                     </tr>
                     <tr>
                       <td><b style="color: #619fd7;">제품 등록일</b></td>
                       <td>${product.reg_date}</td>
                     </tr>
                     <tr>
                       <td style="vertical-align: middle;"><b style="color: #619fd7;">수량</b></td>
                       <td>
						<div class="input-group number-spinner" style="width: 120px;">
							<span class="input-group-btn data-dwn">
								<button class="btn btn-default" data-dir="dwn" id="down" onclick="fn_down()"><span class="glyphicon glyphicon-minus"></span></button>
							</span>
							<input id="Pro_num" type="text" class="form-control text-center" value="1" min="1" max="100" readonly="readonly">
							<span class="input-group-btn data-up">
								<button class="btn btn-default" data-dir="up" id="up" onclick="fn_up()" ><span class="glyphicon glyphicon-plus"></span></button>
							</span>
						</div>
					</td>
                     </tr>
                   </tbody>
                 </table>
                 <br><br>
                 <div align="center">
                  <button id ="cartBtn" type="button" class="btn btn-default" style="width: 200px;height: 50px" onclick="fn_cart();"><i class="glyphicon glyphicon-shopping-cart"><b> 장바구니</b></i></button>
               	  <button id ="buyBtn" type="button" class="btn btn-primary" style="width: 200px;height: 50px" onclick="fn_buy()"><b style="color: white;">바로구매</b></button>
                 </div>
               </div>
             </div>
           </div>
		</div>
	</div>
</div>
<div class="container">
     <div class="row" >
         <div class="panel panel-default" style="border: 2px dashed; color: gray;">
          <div class="panel-heading" style="background-color: gray;">
             <h3 class="panel-title" align="center"><b style="color: white;">제품 상세이미지</b></h3>
           </div>
			<div class="panel-body" align="center">
				<img src="./productimage/${product.image_detail}">
			</div>
		</div>
	</div>
</div>
<div class="container" style="margin-bottom: 10%;">
		<div class="row">
			<div class="panel panel-default" style="border: 2px dashed; color: #619fd7">
					<div class="panel-heading" style="background-color: #619fd7">
						<h1 class="panel-title" align="center"><b style="color: white;">상품평</b></h1>
					</div>
				<c:forEach items="" var="dsReplyList">
					<div class="panel panel-info">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3" align="center">
								<img alt="image_not_found" id="userImage" src="./customcss/defaultpic.png" height="180px" width="150px" class="img-circle">
							</div>
							<div class="col-md-9">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td><b>유저아이디</b>&nbsp;&nbsp;<font size="1px;" color="gray"></font>&nbsp;&nbsp;&nbsp;
											<span class="stars starrr replyStar" data-rating=""></span>
											</td>
										</tr>
										<tr>
											<td>유저리뷰내용</td>
										</tr>
                 				   </tbody>
                  			  </table>
               			  </div>
             		 </div>
           		 </div>
				</div>
				</c:forEach>
			<div class="panel-footer">
				<form id="createReply" accept-charset="UTF-8" action="$" method="post">
				    <input id="ratings-hidden" name="markRating" type="hidden">
				    <textarea class="form-control animated" cols="50" id="userReply" name="userReply" placeholder="상품평을 입력해 주세요." rows="5"></textarea>
				    <input type="hidden" id="productCode" name="productCode" value="">
				    <input type="hidden" id="markYn" name="markYn" value="">
				    <div align="right">
				    	<button class="btn btn-default" onclick="return fn_save()"><b>글 등록</b></button>
					</div>
				</form>
			</div>
          </div>
        </div>
</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>
