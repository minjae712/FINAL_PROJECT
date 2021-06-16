<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세</title>
</head>
<body>
<jsp:include page="./hf/header.jsp"></jsp:include>
<div class="bradcam_area " style="background-image: url('./resources/css/img/banner/bradcam.png');">
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
	<div align="center" style="margin-top: 10%;margin-bottom: 10%;">
		<hr>
		<div style="width: 70%">
			<table class="table table-bordered" >
				<tr>
					<td colspan="1">제목</td>
					<td colspan="5"><c:out value="${nvo.title}" /></td>
				</tr>
				<tr>
					<td>게시글번호</td>
					<td colspan="6"><c:out value="${nvo.no}" /></td>
				</tr>
				<tr>
					<td colspan="1">작성자</td>
					<td colspan="1"><c:out value="${nvo.writer}" /></td>
					<td colspan="1">등록일</td>
					<td colspan="1"><c:out value="${nvo.regDate}" /></td>
					<td colspan="1">조회수</td>
					<td colspan="1"><c:out value="${nvo.cnt}" /></td>
				</tr>
				<tr>
					<td colspan="6" height="400">${fn:replace(nvo.content, replaceChar, "<br/>")}
					</td>
				</tr>
				<tr>
				</tr>
			</table>
			<hr>
	</div>
		<hr>
		<c:if test="${user.isAdmin()}">
		<a class="btn btn-default" href="insertNotice.jsp">공지등록</a>&nbsp;&nbsp;&nbsp; 
		<a class="btn btn-default" href="deleteNotice.do?uni=${nvo.uni}">공지 삭제</a>&nbsp;&nbsp;&nbsp;
		</c:if>
		<c:choose>
		<c:when test="${back == 1}">
			<a class="btn btn-default" href="getNoticeList.do">글목록</a>
		</c:when>
		<c:when test="${back == 0}">
			<a class="btn btn-default" href="getBoardList.do">글목록</a>
		</c:when>
		</c:choose>
	</div>
<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>
