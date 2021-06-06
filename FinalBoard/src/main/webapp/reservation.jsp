<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE>
<html class="no-js" lang="zxx">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Animal</title>
<style type="text/css">
div.map_lo {
	margin-top: 10%;
	margin-bottom: 10%;

}
</style>
<meta name="description" content="">
<link rel="stylesheet" href="./resources/css/css/bootstrap.min.css">
</head>
<body>
 	<jsp:include page="./hf/header.jsp"></jsp:include>

    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcam_text text-center">
                        <h3>동물병원 예약하기</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
   <h1 align="center" style="margin-top: 5%"><b> 우리동네 주변 동물병원 </b></h1>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="${String.charAt(user.address)} 동물병원" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
<link href="./css/MapCss.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4de84cc7d9ccabcc85cfdcf6832e4a65&libraries=services"></script>
<script src="./js/KakaoMap.js" type="text/javascript"></script>
</html>