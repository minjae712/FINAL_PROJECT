<%@page contentType="text/html; charset=UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>마이펫시터</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="./resorces/css/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="./resources/css/css/bootstrap.min.css">
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
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<jsp:include page="./hf/header.jsp"></jsp:include>
	
    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcam_text text-center">
                        <h3>마이펫시터</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- bradcam_area_end -->


    <!--================ 게시판 =================-->
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="./resources/css/img/blog/single_blog_1.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>냥탁게시판 제목</h2>
                                </a>
                                <p>글내용</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa fa-user"></i> 방문자수</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 조회수</a></li>
                                </ul>
                            </div>
                        </article>

                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="./resources/css/img/blog/single_blog_2.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.jsp">
                                    <h2>멍탁게시판 제목</h2>
                                </a>
                                <p> 글내용2</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa fa-user"></i> 방문자수</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 조회수</a></li>
                                </ul>
                            </div>
                        </article>

						<!-- 페이징처리 -->				                                        
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='Search Keyword'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Search Keyword'">
                                        <div class="input-group-append">
                                            <button class="btn" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">Search</button>
                            </form>
                        </aside><br><br>
						
                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">마이펫시터</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>냥탁게시판</p>
                                        <p>(37)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>멍탁게시판</p>
                                        <p>(10)</p>
                                    </a>
                                </li>
                                
                            </ul>
                        </aside><br><br>
                        
                        <!-- 베스트 게시글 -->	
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">베스트 게시글</h3>
                            <div class="media post_item">
                                <img src="./resources/css/img/post/post_1.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>베스트 게시글1</h3>
                                    </a>
                                    <p>January 12, 2019</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="./resources/css/img/post/post_2.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>베스트 게시글2</h3>
                                    </a>
                                    <p>02 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="./resources/css/img/post/post_3.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>베스트 게시글3</h3>
                                    </a>
                                    <p>03 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="./resources/css/img/post/post_4.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>베스트 게시글4</h3>
                                    </a>
                                    <p>01 Hours ago</p>
                                </div>
                            </div>
                        </aside>            

    </section>
    <!--================Blog Area =================-->

	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>