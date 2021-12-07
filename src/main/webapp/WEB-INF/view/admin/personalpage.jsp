<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자/사업자 개인 정보 페이지</title>
<link rel="stylesheet" href="person.css">
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성날짜 : 21.12.06 -->

	<div class="wapper">
		<!-- 네비게이션 바 -->
		<nav>
			<ul>
				<br>
				<h3>사업자</h3>
				<br> _________ 님
				<br>
				<li><a href="">내 정보</a></li>
				<br>
				<li><a href="">내 상품보기</a></li>
				<br>
				<li><a href="">상품 등록</a></li>
				<br>
				<li><a href="">광고 문의</a></li>
				<br>
				<li><a href="">통계 보기</a></li>
				<br>
			</ul>
		</nav>

		<!-- 내 정보 -->
		<section>
			<h3>내 정보</h3>
			<p>개인정보</p>
			<article class="form">
				ID : <input class="box" type="text" placeholder="아이디가 나타나는 장소"><br>
				이름 : <input class="box" type="text" placeholder="이름이 나타나는 장소"><br>
				비밀번호 : <input class="box" type="password" placeholder="내용을 입력해주세요"><br>
				전화번호 : <input class="box" type="tel" placeholder="번호가 나타나는 장소"><br>

				<input type="submit" value="변경하기">
			</article>
		</section>
		<!-- 사업자 정보 -->
		<section>
			<p>사업자 정보</p>
			<article class="form">
				등록번호 : <input class="box" type="number" placeholder="등록번호가 나타나는 장소"><br>
				승인여부 : 승인됨 <br> <input type="submit" value="갱신하기">
			</article>
		</section>
	</div>
</body>
</html>