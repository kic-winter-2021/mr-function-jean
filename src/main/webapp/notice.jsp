<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항 작성 페이지</title>
<link rel="stylesheet" href="resources/css/box.css">
</head>
<body>
<!-- 좌측 부분 레이아웃 -->

<div class="form_box">
	<h3>공지사항</h3>
	제목 : <input class="box" type="text" placeholder="제목을 입력해주세요"><br>
	
	카테고리 : 
				<select class="box" name="category">
					<option selected>선택해주세요</option>
					<option>--------</option>
					<option>--------</option>
					<option>--------</option>
					<option>--------</option>
				</select>
			 <br>
	내용 <br>
	<textarea class="box" placeholder="내용을 입력해주세요"></textarea><br>
	
	<!-- 하단 버튼 -->
	<input class="write_button" type="submit" value="등록">
</div>

</body>
</html>