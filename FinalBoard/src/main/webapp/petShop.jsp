<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>펫샵</title>
</head>
<body>
	<jsp:include page="./hf/header.jsp"></jsp:include>
<div align="center" style="margin-top: 10%;margin-bottom: 10%">
	<div class="service_area">
		<div class="container">
			<div class="row justify-content-center ">
				<div class="col-lg-7 col-md-10">
					<div class="section_title text-center mb-95">
						<h3>펫샵</h3>
						<p>우리 멍냥이들을 위한 펫샵 !</p>
					</div>
				</div>
			</div>
			<c:forEach items="${pro_list}" var="product">
			<div class="row justify-content-center">
				<div class="col-lg-4 col-md-6">
					<div class="single_service">
						<div>
							<div class="service_icon" align="center">
								<a><img src="" ></a>
							</div>
						</div>
						<div class="service_content text-center">
							<h3></h3>
							<p></p>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>


</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>