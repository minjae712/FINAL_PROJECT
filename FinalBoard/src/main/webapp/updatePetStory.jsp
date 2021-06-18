<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<div align="center" style="margin-top: 10%;margin-bottom: 10%">
		<hr>
		<form class="form-inline" action="updatePetStory.do" method="post">
			<input type="hidden" name="no" value="${PetStory.no}">
				<b> 게시글 번호 : ${PetStory.no} </b>
				<br>
			<div class="form-group">
					<label for="exampleInputName2">제목 </label>
					<input type="text" name="title" value="${PetStory.title}" class="form-control" style="width: 500px">
			</div>
			<br>
			<br>
			<div class="form-group">
					<label for="exampleInputName2">내용</label>
					<textarea name="content" rows="5" cols="30" class="form-control"
						style="width: 500px; height: 300px">${PetStory.content}</textarea>
			</div>
			<br>
			<br>
			<input class="btn btn-default" type="submit" value="글 수정">
			<a href="getPetStoryList.do"><input class="btn btn-default" type="button" value="취소"></a>
		</form>
	</div>
	<hr>
<jsp:include page="./hf/footer.jsp"></jsp:include>
</body>
</html>
