<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>새글등록</title>
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
	<div align="center" style="margin-top: 10%;margin-bottom: 10%">
		<h1><a onclick="location.reload()" style="cursor: pointer;"><b>글 등록</b></a></h1>
		<hr>
		<form class="form-inline" action="insertBoard.do" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="exampleInputName2">제목</label>
				<input type="text" name="title" class="form-control" placeholder="제목을 입력해주세요" style="width:500px" />
				<input type="hidden" name="writer" value="${user.name}">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="exampleInputName2">내용</label>
				<textarea name="content" class="form-control" placeholder="내용을 입력해주세요" style="width:500px;height: 300px"></textarea>
			</div>
			<br><br>
				<div class="inputArea">
				<label for="fileName">이미지파일</label>				
				<input type="file" id="fileName" name="uploadFile"/></td>
				</div>
			<br>
					<input class="btn btn-default" type="submit" value=" 새글 등록 " />
					<a href="getBoardList.do"><input class="btn btn-default" type="button" value="취소"></a>
		</form>
		<hr>
	</div>
	<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>