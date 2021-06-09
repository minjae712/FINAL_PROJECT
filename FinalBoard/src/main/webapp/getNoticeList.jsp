<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
</head>
<body>
<jsp:include page="./hf/header.jsp"></jsp:include>

<div class="bradcam_area " style="background-image: url('./resources/css/img/banner/bradcam_CE.png');">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="bradcam_text text-center">
                    <h3>공지사항</h3>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-2" style="margin-top: 10%;margin-left: 8%;width: 14%">
	<div class="blog_right_sidebar">
	<aside class="single_sidebar_widget post_category_widget" style="border: 2px dashed; border-color: #ed7d32;">
	    <h4 class="widget_title"><b>고객센터</b></h4>
	    <ul class="list cat-list">
	        <li>
	            <a href="getNoticeList.do" class="d-flex" style="color: #619fd7;">
	                	공지사항
	            </a>
	        </li>
	        <li>
	            <a href="#" class="d-flex" style="color: #619fd7;">
	                1:1 문의하기
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
</div>
	<div align="center" style="margin-top: 10%;">
		<div style="width: 55%">
			<div align="right">
				<c:if test="${user.isEmpty()}">
					<c:if test="${user.isAdmin()}">
						<a class="btn btn-danger" href="insertNotice.jsp">공지사항 등록</a>
					</c:if>
				</c:if>
			</div>
			<table class="table table-striped">
				<tr>
					<th width="50">번호</th>
					<th width="350">제목</th>
					<th width="100">작성자</th>
					<th width="100">등록일</th>
					<th width="50">조회수</th>
				</tr>
				<c:if test="${pages.hasNoArticles()}">
					<tr>
						<td colspan="5">등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${pages.boardList}" var="notice">
					<tr>
						<td>${notice.uni}</td>
						<td align="left"><a href="getNotice.do?uni=${notice.uni}&back=1">${notice.title}</a></td>
						<td>${notice.writer}</td>
						<td>${notice.regDate}</td>
						<td>${notice.cnt}</td>
					</tr>
				</c:forEach>
				<c:if test="${pages.hasArticles()}">
					<tr>
						<td colspan="5" class="text-center">
							<ul class="pagination">
								<c:if test="${pages.startPage > 5}">
									<li><a
										href="getNoticeList.do?currentPage=${pages.startPage - 5}&searchKeyword=${nvo.searchKeyword}">이전</a></li>
								</c:if>
								<c:forEach var="pNo" begin="${pages.startPage}"
									end="${pages.endPage}">
									<c:if test="${pNo == pages.currentPage}">
										<li class="active"><a
											href="getNoticeList.do?currentPage=${pNo}&searchKeyword=${nvo.searchKeyword}">${pNo}</a></li>
									</c:if>
									<c:if test="${pNo != pages.currentPage}">
										<li><a
											href="getNoticeList.do?currentPage=${pNo}&searchKeyword=${nvo.searchKeyword}">${pNo}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pages.endPage < pages.totalPages}">
									<li><a
										href="getNoticeList.do?currentPage=${pages.startPage + 5}&searchKeyword=${nvo.searchKeyword}">다음</a></li>
								</c:if>
							</ul>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
	<div style="margin-bottom: 10%; margin-left: 38%">
		<form class="form-inline" action="getNoticeList.do" method="post">
			<div class="form-group">
				<select class="form-control" name="searchCondition">
					<option value="TITLE" selected="selected">제목</option>
					<option value="CONTENT">내용</option>
				</select>
					<input class="form-control" name="searchKeyword" type="text" value="${nvo.searchKeyword}" />
					<input class="btn btn-default" type="submit" value="검색" />
			</div>
		</form>
	</div>
<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>