<%@page import="com.springbook.biz.user.UserVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
a {
cursor: pointer;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" language="javascript">

var b_num = ${board.no};
var modifying = 0;
var name = '${user.name}';

$(window).ready(function(){

	getCommentCount();
	getCommentList();
	getBestList();
	getB_Mood();
});

</script>
<script src="${pageContext.request.contextPath}/js/board_comment.js" type="text/javascript"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>글 상세</title>
</head>
<body>
	<center>
		<%@ include file="/menuBar.jsp" %>
		<h1><a onclick="location.reload()"><b>자유 게시판</b></a></h1>
		<hr>
		<div style="width: 70%">
			<table class="table table-bordered" >
				<tr>
					<td colspan="1">제목</td>
					<td colspan="5">${board.title}</td>
				</tr>
				<tr>
					<td>게시글번호</td>
					<td colspan="6">${board.no}</td>
				</tr>
				<tr>
					<td colspan="1">작성자</td>
					<td colspan="1">${board.writer}</td>
					<td colspan="1">등록일</td>
					<td colspan="1">${board.regDate}</td>
					<td colspan="1">조회수</td>
					<td colspan="1">${board.cnt}</td>
				</tr>
				<tr>
					<td colspan="6" height="400">${board.content}
					</td>
				</tr>
				<tr>
				</tr>
			</table>
					<center>
 					<a id="B_good${board.no}"class="glyphicon glyphicon-thumbs-up" onclick="b_checkGoodOrBad(1,0)" >추천 </a>&nbsp;&nbsp;
 					<a id="B_bad${board.no}" class="glyphicon glyphicon-thumbs-down" onclick="b_checkGoodOrBad(0,1)" >반대 </a> 
					</center>
			<hr>
			<%@ include file="/comment.jsp" %>
	</div>
		<hr>
		<u:isLogin>
		<a class="btn btn-default" href="updateBoard.jsp">글수정</a>&nbsp;&nbsp;&nbsp; 
		<a class="btn btn-default" href="insertBoard.jsp">글등록</a>&nbsp;&nbsp;&nbsp; 
		<a class="btn btn-default" href="deleteBoard.do?no=${board.no}">글삭제</a>&nbsp;&nbsp;&nbsp;
		</u:isLogin>
		<a class="btn btn-default" href="getBoardList.do">글목록</a>
	</center>
</body>
</html>
