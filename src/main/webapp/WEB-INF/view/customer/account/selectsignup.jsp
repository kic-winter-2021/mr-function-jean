<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택페이지</title>
<style>
.container {
	width: 800px;
	margin: 0 auto;
	background-color: white;
	display: grid;
	grid-template-rows: 100px 480px 100px;
	grid-template-columns: repeat(2, 1fr);
	grid-template-areas:
		"header header"
		"left right"
		"footer footer";
	text-align: center;
}
header { grid-area: header; }
footer { grid-area: footer; margin-top: 30px; }
main { display: flex; }
#pwrap { grid-area: left; }
#swrap { grid-area: right; }
.select {
	width: 80%;
	padding: 30px;
	margin: 10px;
	background-color: #eee;
	border-radius: 10px;
	text-align: center;
	cursor: pointer;
}
.select:hover { background-color: #f3f3f3; box-shadow: 5px 5px 28px -5px rgba(0,0,0,0.79); }
.signupimg { width: inherit; }
.select div { font-size: 30px; top: 10px; }
</style>
</head>
<body>
	<div class="container">
		<header><h2>가입 유형 선택</h2></header>
			<div id="pwrap" class="select" onclick="location.href='agree?t=p'">
				<h3>자신만의 맞는 바지를 <br>찾아보세요!</h3>
				<img src="/resources/img/personal.png" class="signupimg">
				<div>일반</div>
			</div>
			<div id="swrap" class="select" onclick="location.href='agree?t=s'">
				<h3>상품을 등록하고<br>이윤을 남겨보세요!</h3>
				<img src="/resources/img/company.png" class="signupimg">
				<div>사업자</div>
			</div>
		<footer>Mr.Function</footer>
	</div>
</body>
</html>