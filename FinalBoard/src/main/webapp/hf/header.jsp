<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE>
<html>
<head>
	<!-- JS here -->
	<script src="./resources/css/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="./resources/css/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./resources/css/js/popper.min.js"></script>
	<script src="./resources/css/js/bootstrap.min.js"></script>
	<script src="./resources/css/js/owl.carousel.min.js"></script>
	<script src="./resources/css/js/isotope.pkgd.min.js"></script>
	<script src="./resources/css/js/ajax-form.js"></script>
	<script src="./resources/css/js/waypoints.min.js"></script>
	<script src="./resources/css/js/jquery.counterup.min.js"></script>
	<script src="./resources/css/js/imagesloaded.pkgd.min.js"></script>
	<script src="./resources/css/js/scrollIt.js"></script>
	<script src="./resources/css/js/jquery.scrollUp.min.js"></script>
	<script src="./resources/css/js/wow.min.js"></script>
	<script src="./resources/css/js/nice-select.min.js"></script>
	<script src="./resources/css/js/jquery.slicknav.min.js"></script>
	<script src="./resources/css/js/jquery.magnific-popup.min.js"></script>
	<script src="./resources/css/js/plugins.js"></script>
	<script src="./resources/css/js/gijgo.min.js"></script>
	
	<!--contact js-->
	<script src="./resources/css/js/contact.js"></script>
	<script src="./resources/css/js/jquery.ajaxchimp.min.js"></script>
	<script src="./resources/css/js/jquery.form.js"></script>
	<script src="./resources/css/js/jquery.validate.min.js"></script>
	<script src="./resources/css/js/mail-script.js"></script>
	<script src="./resources/css/js/main.js"></script>
	    
    <!-- CSS here -->
	<link rel="stylesheet" href="./resources/css/css/owl.carousel.min.css">
	<link rel="stylesheet" href="./resources/css/css/magnific-popup.css">
	<link rel="stylesheet" href="./resources/css/css/font-awesome.min.css">
	<link rel="stylesheet" href="./resources/css/css/themify-icons.css">
	<link rel="stylesheet" href="./resources/css/css/nice-select.css">
	<link rel="stylesheet" href="./resources/css/css/flaticon.css">
	<link rel="stylesheet" href="./resources/css/css/gijgo.css">
	<link rel="stylesheet" href="./resources/css/css/animate.css">
	<link rel="stylesheet" href="./resources/css/css/slicknav.css">
	<link rel="stylesheet" href="./resources/css/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
<style>
a {
	cursor: pointer;
}
div.line-orange{
	background-color: #ed7d32;
	height: 15;
}
div.line-blue{
	background-color: #619fd7;
	 height: 15;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>
</head>
<body>
    <header>
        <div class="header-area" >
            <div class="header-top_area" >
                <div class="container" >
                    <div class="row" >
                        <div class="col-lg-6 col-md-8" >
                            <div class="short_contact_list">
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-4 " >
                            <div class="social_media_links" >
                            	<u:isLogin>
                            		<b style="color: white;">${user.name}님, 환영합니다!</b>
                            		<a href="myCartPage.do?mem_code=${user.mem_code}"><button style="width: 10%;height: 5%"><i class="glyphicon glyphicon-shopping-cart"></i></button></a>
                            		<a href="getUser.do"><img src="./customcss/MyPage.png"></a>
									<a href="${pageContext.request.contextPath}/logout.do"><img src="./customcss/Logout_button.png"></a>
								</u:isLogin>
                                <u:notLogin>
								<a href="${pageContext.request.contextPath}/login.jsp"><img src="./customcss/Login_button.png"></a>
                            	<a href="${pageContext.request.contextPath}/createUser.jsp"><img src="./customcss/sign_up.png"></a>
                            	</u:notLogin>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="sticky-header" class="main-header-area">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-3">
                            <div class="logo">
                                <a href="index.jsp">
                                    <img src="./customcss/main_icon.png" style="min-width: 280px;min-height: 138px;">
                                </a>
                            </div>
                        </div>
                      <div class="col-xl-9 col-lg-9">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation" >
                                       <li><a href="index.jsp">홈</a></li>
										<li><a href="about.jsp">사이트 소개</a></li>
										<li><a href="#">게시판 <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                 <li><a href="getBoardList.do">마이펫 자랑하기</a></li>
                                                </ul> </li>
											<li><a href="#">서비스 <i class="ti-angle-down"></i></a>
											<ul class="submenu">
										        <li><a href="reservationPage.do">동물병원 예약</a></li>
										        <li><a href="getBoardList.do">펫 시터 게시판</a></li>
                                                <li><a href="petShopPage.do">펫 쇼핑</a></li>
										        </ul></li>
										<li><a href="#">고객센터 <i class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="getNoticeList.do">공지사항</a></li>
												<li><a href="contact.jsp">회사위치</a></li>
												<li><a href="FAQ.jsp">FAQ</a></li>
											</ul></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
	    <div class="line-orange"></div>
        <div class="line-blue"></div>
</body>
</html>