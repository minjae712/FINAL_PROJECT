<%@page import="com.springbook.biz.user.UserVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE>
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
<script type="text/javascript">

var b_num = ${board.no};
var modifying = 0;
var name = '${user.name}';

var user_code = '${user.mem_code}';

var fileName = '${board.fileName}';

function uploadfile() {
	if(fileName != null && fileName != "") {
		var fullPath = "uploadfile\\" + fileName;
		$("#getfile").attr("src",fullPath);
	}
}

$(document).ready(function(){
	
	uploadfile();
	getCommentCount();
	getCommentList(user_code);
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
<jsp:include page="./hf/header.jsp"></jsp:include>
<div class="bradcam_area " style="background-image: url('./resources/css/img/banner/bradcam_PET.png');">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="bradcam_text text-center">
                    <h3>펫시터 게시판</h3>
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
			    <div class="inputArea">
			 	 <label for="fileName">이미지</label>
				 <p>원본 이미지</p>
				 <img id="getfile" src="${request.getRealPath('')}" />
				 </div>
				
				<tr>
					<td colspan="6" height="400">${board.content}
					</td>
				</tr>
				<tr>
				</tr>
			</table>
					<div align="center">
 					<button class="btn btn-danger"><i id="B_good${board.no}" onclick="b_checkGoodOrBad(1,0,'${user.mem_code}')" class="glyphicon glyphicon-thumbs-up"></i></button>&nbsp;&nbsp;
 					<button class="btn btn-primary"><i id="B_bad${board.no}" onclick="b_checkGoodOrBad(0,1,'${user.mem_code}')" class="glyphicon glyphicon-thumbs-down"></i></button> 
					</div>
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
	</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>
