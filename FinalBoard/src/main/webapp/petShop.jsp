<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>PET SHOP</title>
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
<div>
	<div class="service_area">
		<div class="container">
			<div class="row justify-content-center" style="margin-left: 30%;">
				<div class="col-lg-7 col-md-10">
					<div class="section_title text-center mb-95">
						<h3>멍냥이들을 위한<br>필수품</h3>
						<p>오늘도 보람차게 하루를 보낸 멍냥이들을 위한 물품을 준비해보는건 어떨까요?</p>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
			<c:forEach items="${pro_list}" var="product">
				<div >
					<div class="single_service">
						<div>
							<div class="service_icon" align="center">
								<a href="getProduct.do?pro_code=${product.pro_code}&mem_code=${user.mem_code}"><img src="./productimage/${product.image}" ></a>
							</div>
						</div>
						<div class="service_content text-center">
							<a href="getProduct.do?pro_code=${product.pro_code}"><h3>${product.name}</h3></a>
							<p><b style="color: red;">상품가격 :</b><b> ${product.price}</b></p>
							<p>${product.content}</p>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>