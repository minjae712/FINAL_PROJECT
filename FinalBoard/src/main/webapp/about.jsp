<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE>
<html class="no-js" lang="zxx">

<head>
<style>
.title {
	color:#FF4000;
	font-size:19px;
	font-weight:bold;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Animal</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<jsp:include page="./hf/header.jsp"></jsp:include>

    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcam_text text-center">
                        <h3>사이트 소개</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- bradcam_area_end -->

    <!-- pet_care_area_start  -->
    <div class="pet_care_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-5 col-md-6">
                    <div class="pet_thumb">
                        <img src="./resources/css/img/about/pet_care.png" alt="">
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-1 col-md-6">
                    <div class="pet_info">
                        <div class="section_title">
                            <h3>멍냥 컴퍼니  <br></h3>
                            <p><span class="title">반려동물을 사랑하는 누구나 함께할 수 있는 공간을 제공합니다 </span><br><br>
                            	사랑스러운 나의 반려동물을 자랑해보세요 <br> 반려동물을 위한 돌봄서비스! 믿을 수 있는 펫 시터 구하기! <br>
                                                        멍냥이들의 소중한 건강관리를 위해 동물병원 예약 서비스 제공! <br>빠르고 편하게 애완용품 온라인 쇼핑까지 한 번에!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- pet_care_area_end  -->

   

	<div class="service_area">
		<div class="container">
			<div class="row justify-content-center ">
				<div class="col-lg-7 col-md-10">
					<div class="section_title text-center mb-95">
						<h3>반려동물을 위한 케어 서비스</h3>
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
							<p>우리 동네에 믿을 수 있는 동물병원을 검색해보고 예약하세요!</p>
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