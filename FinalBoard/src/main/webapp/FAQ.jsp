<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>고객센터</title>
<meta name="description" content="">
<!-- CSS here -->
<link rel="stylesheet" type="text/css" href="./resources/css/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/assets/css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script>document.getElementsByTagName("html")[0].className += " js";</script>
</head>
<body style="background-color: white;">
	<jsp:include page="./hf/header.jsp"></jsp:include>

	<div class="bradcam_area" style="background-image: url('./resources/css/img/banner/bradcam_CE.png');">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="bradcam_text text-center">
						<h3>무엇이든 물어보세요</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
<header class="cd-header flex flex-column flex-center" style="width: 50%;height: 10%;margin-left: 25%">
  <div class="text-component text-center">
    <h1>FAQ</h1>
  </div>
</header>
<div class="col-lg-3 cd-faq js-cd-faq container max-width-md margin-top-lg margin-bottom-lg">
	<div class="blog_right_sidebar" style="width: 14%;">
	<aside class="single_sidebar_widget post_category_widget" style="border: 2px dashed; border-color: #ed7d32;">
	    <h4 class="widget_title"><b>고객센터</b></h4>
	    <ul class="list cat-list">
	        <li>
	            <a href="getNoticeList.do" class="d-flex" style="color: #619fd7;">
	                	공지사항
	            </a>
	        </li>
	        <li>
	            <a href="contact.jsp" class="d-flex" style="color: #619fd7;">
	                회사위치
	            </a>
	        </li>
	        <li>
	            <a href="FAQ.jsp" class="d-flex" style="color: #619fd7;">
	                FAQ
	            </a>
	        </li>
	    </ul>
	</aside>
	</div>
	<div class="cd-faq__items" style="background-color: gray; margin-left: 2%">
		<ul id="FAQ1" class="cd-faq__group" style="width: 95%">
			<li class="cd-faq__title"><h2>자주 묻는 질문</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>아이디와 비밀번호가 기억 나지 않아요.</span></a>
				<div class="cd-faq__content">
          <div class="text-component" >
            <p>로그인을 클릭후 아이디 찾기를 누르시고, 회원가입 할 때 입력 하셨던 이메일을 입력하시면 아이디를 찾으실수 있습니다.</p> <br>
            <p>로그인을 클릭후 비밀번호 찾기를 누르시고, 회원가입 할 때 입력 하셨던 아이디와 이메일을 입력하시면 비밀번호를 찾으실수 있습니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>비밀번호 변경은 어떻게 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>[MY페이지 > 아이디 > 비밀번호 입력 > 나의 정보 > 비밀번호 수정] 에서 변경 가능합니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>고객센터에 전화 연결이 되지 않을 경우는 어떻게 해야 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>고객센터 상담 시간은 평일 오전 9시 ~ 오후 6시이며, 토요일/공휴일은 휴무입니다. 고객센터 상담 시간 이외 또는 상담량이 많아 전화 연결이 되지 않을 경우에는 1:1문의로 연락주시면 신속히 안내해 드리겠습니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>주문 취소 후 카드 취소나 계좌 환불은 언제 되나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>신용카드는 영업일 기준으로 1~7일 정도 소요되며, 가상계좌는 영업일 기준으로 1~5일 내에 환불 처리됩니다. 카드 취소나 환불이 늦어지는 경우 1:1로 연락 바랍니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="FAQ2" class="cd-faq__group" style="width: 95%">
			<li class="cd-faq__title"><h2>회원/정보</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>아이디와 비밀번호가 기억 나지 않아요.</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
           <p>로그인을 클릭후 아이디 찾기를 누르시고, 회원가입 할 때 입력 하셨던 이메일을 입력하시면 아이디를 찾으실수 있습니다.</p> <br>
            <p>로그인을 클릭후 비밀번호 찾기를 누르시고, 회원가입 할 때 입력 하셨던 아이디와 이메일을 입력하시면 비밀번호를 찾으실수 있습니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>비밀번호 변경은 어떻게 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
           <p>[MY페이지 > 아이디 > 비밀번호 입력 > 나의 정보 > 비밀번호 수정] 에서 변경 가능합니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>회원 탈퇴는 어떻게 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>[MY페이지 > 아이디 > 비밀번호 입력 > 나의 정보 > 회원탈퇴] 에서 탈퇴 가능합니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="FAQ3" class="cd-faq__group" style="width: 95%">
			<li class="cd-faq__title"><h2>주문/결제</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>주문한 상품을 변경할 수 있나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>결제를 완료한 후에는 주문 상품 변경이 불가능합니다. 다만, 주문의 진행상태가 "입금확인"이라면 주문을 취소하고 상품을 다시 구매하실 수 있습니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>주문내역은 어디에서 확인하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>주문내역은 [MY페이지 > 주문 · 배송]에서 확인 가능합니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>주문은 어떻게 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>구매하시려는 상품페이지에서 "바로구매" 하시거나, "장바구니 담기" 후 "구매하기"를 해주시면 됩니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>전화주문이 가능한가요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>멍이랑냥이랑은 인터넷 주문만 가능합니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="FAQ4" class="cd-faq__group" style="width: 95%">
			<li class="cd-faq__title"><h2>상품문의</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>상품에 대해서 물어보고 싶어요. 어디서 물어볼 수 있나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>상품에 대해서 더 정확히 알고 싶으시다면 1:1문의로 연락주시면 신속히 안내해 드리겠습니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>상품 유통기한 기준은 어떻게 되나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>멍이랑냥이랑은 생산일로부터 유통기한 6개월, 9개월, 12개월, 18개월, 24개월인 상품을 취급하고 있습니다. 그러나, 상품마다 유통기한 기준은 다르니, 우선적으로 상품 상세설명을 참고해주세요.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>품절된 상품을 구매하려면 어떻게 해야 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>품절 상품은 되도록 빠른 시일내에 재입고할 수 있도록 하고 있습니다. 입고 즉시 구입하고 싶으시다면 1:1문의로 연락주시면 신속히 안내해 드리겠습니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="FAQ5" class="cd-faq__group" style="width: 95%">
			<li class="cd-faq__title"><h2>취소/반품/교환</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>반품 처리에 소요되는 기간은 얼마나 되나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>반품 처리에 소요되는 기간은 단계별로 다음과 같습니다. <br>
				① 반품 상품이 고양이대통령 물류센터에 도착하는 기간 : 영업일 기준 3~5일<br>
				② 보내주신 상품을 확인하고 환불 접수해 드리는 기간 : 영업일 기준 1~2일<br>
				③ 환불 접수 후 실제 환불 되는 기간 : 신용카드는 영업일 기준 3~7일, 가상계좌는 영업일 기준 3~5일<br>
				다만, 택배사에서의 상품 수거가 지연되거나 휴일, 연휴 등으로 인해 상품이 물류센터에 늦게 도착되면 환불 처리도 지연될 수 있을을 양해 바랍니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>어떤 경우에 교환/반품이 불가능한가요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>교환/반품은 7일 이내에만 신청 가능합니다. <br>
			다만, 7일 이내에 신청하셔도 아래의 사유에 해당하면 교환/반품이 불가능합니다.  <br>
			① 상품 사용, 상품 훼손 등으로 상품을 재판매하기 어려운 경우<br>
			② 포장 개봉, 포장 훼손, 라벨 또는 태그 제거 등으로 상품 가치가 상실된 경우<br>
			③ 택배상자를 이용하지 않고, 상품에 직접 송장을 부착하여 반품한 경우<br>
			④ 주문제작 상품 (예: 각인 이름표 등)<br>
			⑤ 상품 특성상 교환, 반품이 불가능한 경우</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>구매한 상품과 다른 상품으로 교환이 가능한가요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>다른 상품으로의 교환은 불가능합니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>주문 취소는 어떻게 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>'입금대기, 입금완료' 상태인 경우 '[MY페이지 > 주문 취소]에서 취소 가능합니다. <br>
 			'발송준비중'  '발송처리완료' 상태인 경우 배송사로 인계되어 취소가 불가능하므로, 수령하신 후 반품해 주셔야 합니다.<br>
			또한, 반품 배송비는 고객님께서 부담하시게 됩니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="FAQ6" class="cd-faq__group" style="width: 95%">
			<li class="cd-faq__title"><h2>기타</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>고객센터에 전화 연결이 되지 않을 경우는 어떻게 해야 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>고객센터 상담 시간은 평일 오전 9시 ~ 오후 6시이며, 토요일/공휴일은 휴무입니다. 고객센터 상담 시간 이외 또는 상담량이 많아 전화 연결이 되지 않을 경우에는 1:1문의로 연락주시면 신속히 안내해 드리겠습니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>간식이나 사료 등 상품을 대량으로 구매하고 싶은데 가능한가요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>고객센터 또는 1:1문의로 연락을 주시면 신속히 안내해 드리겠습니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>마이펫 자랑하기 게시물에 등록하려면 반려동물이 있어야 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>마이펫 자랑하기 게시물은 일상을 공유하는 공간으로 마이펫이 있으면 좋겠지만, 없으셔도 등록은 가능합니다.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>멍이랑냥이랑 제휴하고 싶습니다.</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
          <p>고객센터 또는 1:1문의로 연락을 주시면 신속히 안내해 드리겠습니다. </p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->
	<br><br>
	</div> <!-- cd-faq__items -->
	<a href="#0" class="cd-faq__close-panel text-replace">Close</a>
  <div class="cd-faq__overlay" aria-hidden="true"></div>
	<ul class="cd-faq__categories">
		<li><a class="cd-faq__category cd-faq__category-selected truncate" href="#FAQ1">자주 묻는 질문</a></li>
		<li><a class="cd-faq__category truncate" href="#FAQ2">회원/정보</a></li>
		<li><a class="cd-faq__category truncate" href="#FAQ3">주문/결제</a></li>
		<li><a class="cd-faq__category truncate" href="#FAQ4">상품문의</a></li>
		<li><a class="cd-faq__category truncate" href="#FAQ5">취소/반품/교환</a></li>
		<li><a class="cd-faq__category truncate" href="#FAQ6">기타</a></li>
	</ul> <!-- cd-faq__categories -->
</div> <!-- cd-faq -->
<script src="./resources/css/assets/js/util.js"></script> <!-- util functions included in the CodyHouse framework -->
<script src="./resources/css/assets/js/main.js"></script> 

	<br>
	<br>
	<br>

	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>

</html>