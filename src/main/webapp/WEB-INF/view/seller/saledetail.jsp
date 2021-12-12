<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록상품 상세보기.</title>
<link rel="stylesheet" href="detail.css">
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성일자 : 21.12.06 -->
	<nav>
		<img src="j3.jpg">
	</nav>
	<!-- 등록내용을 오른쪽으로 옮기는 추가작업 필요 -->
	<section class="form">
		<center>
			<h3>등록내용</h3>
		</center>
		<!-- 본문 -->
		제목 : <input class="box" type="text" placeholder="제목이 나타나는 창입니다"><br>
		카테고리 : <select class="box">
			<option>**********</option>
			<option>**********</option>
			<option>**********</option>
			<option>**********</option>
			<option>**********</option>
		</select><br> 올린날짜 : <input class="box" type="date"
			placeholder="날짜가 나타나는 창입니다."><br> 판매자 전화번호 : <input
			class="box" type="tel" placeholder="전화번호가 나타나는창 입니다."><br>
		판매자 이메일 : <input class="box" type="email"
			placeholder="이메일이 나타나는 창입니다."><br>

		<!-- 버튼 -->
		<input type="submit" value="수정"> <input type="submit"
			value="삭제">
	</section>
</body>
</html>