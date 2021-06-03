<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
</head>
<body>
<jsp:include page="./hf/header.jsp"></jsp:include>
    	<!-- slider_area_start -->
	<div class="slider_area">
		<div class="single_slider slider_bg_1 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-6">
						<div class="slider_text">
							<h3>
								멍이랑
								 <br> <span>냥이랑</span>
							</h3>
							<p>
								사랑스런 반려동물을 위한<br>
								우리들만의 특별한 서비스
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="dog_thumb d-none d-lg-block">
				<img src="./resources/css/img/banner/dog.png" alt="">
			</div>
		</div>
	</div>
    	<!-- 슬라이드  -->
	<div class="testmonial_area">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="textmonial_active owl-carousel">
						<div class="testmonial_wrap">
							<div class="single_testmonial d-flex align-items-center">
								<div class="test_thumb">
									<img src="./customcss/dog.png">
								</div>
								<div class="test_content">
									<h4>[나와 친구가 되어주세요]</h4>
									<span>말티즈(♂,17년생)</span>
									<p>
										털색 : 흰색<br>
										체중 : 5(Kg)<br>
										특징 : 순함, 조용함, 애교가 많음<br>
										게시일 : 2021.04.12<br>
										보호센터 : 한국동물구조관리협회<br>
										보호장소 : 서울시 금천구 다남동 35-8<br>
										전화 : 02-000-0000</p>
								</div>
							</div>
						</div>
						<div class="testmonial_wrap">
							<div class="single_testmonial d-flex align-items-center">
								<div class="test_thumb">
									<img src="./customcss/dog.png">
								</div>
								<div class="test_content">
									<h4>[나의 친구를 찾아주세요]</h4>
									<span>슈나우져(♀,15년생)</span>
									<p>
										털색 : 갈색<br>
										체중 : 7(Kg)<br>
										위치 : 옹진군 영흥면사무소<br>
										특징 : 노끈 목줄, 귀 진한갈색<br>
										게시일 : 2021.01.24<br>
										보호센터 : 인천수의사회유기동물<br>
										보호장소 : 인천광역시 계양구 다남동 35-8<br>
										전화 : 032-000-0000</p>
								</div>
							</div>
						</div>
						<div class="testmonial_wrap">
							<div class="single_testmonial d-flex align-items-center">
								<div class="test_thumb">
									<img src="./customcss/cat.png">
								</div>
								<div class="test_content">
									<h4>[멍냥이를 부탁해]</h4>
									<span>아기고양이를 병원에 데려다 주실분 찾아요!</span>
									<p>제가 급한 출장으로 인해, 고양이를 돌보지 못할 상황이 생겼습니다 .. ㅠ
										3일간만 고양이를 맡아주실 분을 찾고있습니다. 이름은 묘량이구요, 
										특별하게 신경써주셔야 하는 건, 예약병원에 한번 들러주시면 감사할것 같아요 !</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="service_area">
		<div class="container">
			<div class="row justify-content-center ">
				<div class="col-lg-7 col-md-10">
					<div class="section_title text-center mb-95">
						<h3>반려동물을 위한 케어서비스</h3>
						<p>우리 동네에 있는 동물병원 예약부터, 바쁜 나를 대신해 케어해 줄 펫시터 구하기,
							그리고 멍냥이들을 위한 특별한 선물까지!</p>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-4 col-md-6">
					<div class="single_service">
						<div>
							<div class="service_icon" align="center">
								<img src="./customcss/card1.png" >
							</div>
						</div>
						<div class="service_content text-center">
							<h3>동물병원 예약</h3>
							<p>우리 동네에 어떤 동물병원이 ? 나의 사는 동네를 입력하면
								내가 사는 집 주변의 동물병원을 예약할 수 있어요 !</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single_service active">
						<div>
							<div class="service_icon" align="center" >
								<img src="./customcss/card2.png">
							</div>
						</div>
						<div class="service_content text-center">
							<h3>펫시터 구하기</h3>
							<p>항상 우리들의 사랑스러운 멍냥이들을 24시간 케어해주기에는
							몸이 두개라도 모자랍니다 . 그런데, 쨘 ! 나만의 반려동물을 맡아줄 펫시터가 있다면 ?</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single_service">
						<div>
							<div class="service_icon" align="center">
								<img src="./customcss/card3.png">
							</div>
						</div>
						<div class="service_content text-center">
							<h3>펫샵 쇼핑</h3>
							<p>사이트를 이용하며 모은 포인트를 사용해 펩샵을 저렴하게 !
								어서와 ! 저렴한 펫샵은 처음이지 ?</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- service_area_end -->
	    
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>