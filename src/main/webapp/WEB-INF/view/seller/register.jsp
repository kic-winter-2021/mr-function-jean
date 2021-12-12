<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록 페이지</title>
<link rel="stylesheet" href="resources/css/box.css">
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성일자 : 21.12.05 09:36pm -->
	<!-- 게시글 타이틀 -->
	<div class="form_box">
		<h1>게시글을 등록해주세요</h1>

		<!-- 게시글 내용 -->
		작성자 : <input class="box" type="text" placeholder="닉네임을 입력해주세요"><br>
		카테고리 :
		<form>
			<select name="category">
				<option value="none" selected>선택하세요</option>
				<option value="delivery">????</option>
				<option value="exchange">????</option>
				<option value="refund">????</option>
				<option value="delivery">????</option>
				<option value="delivery">????</option>
			</select>
		</form>
		가격 : <input class="box" type="number" placeholder="가격을 입력해주세요"><br>
		제목 : <input class="box" type="text" placeholder="제목을 입력해주세요"><br>
		내용 : <br>
		<textarea class="field" placeholder="내용을 입력해주세요"></textarea>
		<br> 판매자 휴대전화 : <input class="box" type="number"
			placeholder="전화번호를 입력해주세요"><br> 판매자 이메일 : <input
			class="box" type="email" placeholder="이메일을 입력해주세요"><br>
		첨부파일 : <input class="file" type="file"><br>
		<br>

		<!-- 문의글 하단 버튼 -->
		<button class="write_button">등록</button>
		<button class="write_button">취소</button>
	</div>
</body>
</html>
