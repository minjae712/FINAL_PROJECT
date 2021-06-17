<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>글 상세</title>
</head>
<body>

		<div align="left">
		댓글  <b class="count">0</b>개 
		<hr>
		베스트 댓글	<b class="glyphicon glyphicon-tower"></b>
		<br>
		<hr>
		<div class="bestComment"></div>
		<hr>
		<c:choose>
			<c:when test="${user != null}">
				<form class="insertForm" method="post">
					<input type="hidden" name="no" id="no" value="${board.no}"/>
					<input type="hidden" name="writer" id="writer" value="${user.name}"/>
					<div>
						<label for="content">댓글</label>
						<textarea rows="3" cols="100" name="content" id="content" class="form-control" style="resize: none;"></textarea>
					</div>
					<div align="right">
						<button class="btn btn-primary" onclick="insertComment()">등록</button>
						<button type="reset" class="btn btn-default">취소</button>
					</div>
				</form>
			</c:when>
			<c:when test="${user == null}">
				<h4>로그인이 필요합니다.</h4>
			</c:when>
		</c:choose>
		</div>
		<div align="left">
			<hr>
			<div id="commentList" class="commentList">
			</div>
		</div>
		
		
</body>
</html>
