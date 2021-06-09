<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		getBestBoard();
	});
</script>
<script src="./js/best_board_List.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>베스트 글</title>
</head>
<body>
<div class="table table-condensed" align="center"  style="font-size:12px;"  >
	<div >
		<h3>★베스트 글★</h3>
	</div>
	<table>
		<tr>
			<td align="center" width="50%">제목</td>
			<td align="right"  width="28%">작성자</td>
			<td >조회수</td>
		</tr>
	</table>

</div>
</body>
</html>