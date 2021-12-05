<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고문의글</title>
<link rel="stylesheet" href="resources/css/box.css">
</head>
<body>
	<!-- 작성자 : 오근영 -->

	<!-- 문의글 타이틀 -->
	<div class="form_box">
		<h1>광고문의글을 작성해주세요</h1>

		<!-- 문의글 내용 -->
		이름/상호명 : <input class="box" type="text" placeholder="이름/상호명을 입력해주세요"><br>
		연락처 : <input class="box" type="tel" placeholder="연락처를 입력해주세요"><br>
		이메일 : <input class="box" type="email" placeholder="이메일을 입력해주세요"><br>
		제목 : <input class="box" type="text" placeholder="제목을 입력해주세요"><br>
		내용 : <br>
		<textarea class="field" placeholder="내용을 입력해주세요"></textarea>
		<br> 첨부파일 : <input class="box" type="text"
			placeholder="피일을 선택하세요"> <input class="file" type="file"><br>
		<br>

		<!-- 문의글 하단 버튼 -->
		<input class="write_button" type="submit">
		</button>
		<button class="write_button">취소</button>
	</div>
</body>
</html>