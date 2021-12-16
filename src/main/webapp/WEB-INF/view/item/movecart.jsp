<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 작성자 : 박이삭
	 작성일자 : 2021-12-4
	 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장바구니로 이동</title>
<style>
.movecart {
	width: 440px; height: 220px; margin: 0 auto; padding: 15px; text-align: center;
	background-color: #f4f4f4;
}
.innerbox { background: #fff; padding: 20px; height: 180px; display: flex; flex-direction: column; justify-content: center; }
.innerbox span { margin: 20px; }
.btn-container {
	display: flex;
	justify-content: space-around;
	padding: 15px;
}

.btn-container a { all:unset; display: inline-block; padding: 4px; background-color: #2ECCFA; width: 120px; height: 24px; color: white; 
	border-radius: 4px; vertical-align: middle;
}
.btn-container a:hover {  background :#81DAF5;}
</style>
</head>
<body>
	<div class="movecart">
		<div class="innerbox">
			<h4>장바구니 담기</h4>
			<span>장바구니에 상품이 정상적으로 담겼습니다.</span>
			<div class="btn-container">
				<a href="/sale/cart">장바구니 이동</a>
				<a href="javascript:self.close();">쇼핑	계속하기</a>
			</div>
		</div>
	</div>
</body>

</html>