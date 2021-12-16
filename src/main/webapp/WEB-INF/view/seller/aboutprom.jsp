<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	작성자: 정상준
	작성일: 2012-12-12
	프로모션 상품을 보여주는 페이지
	
	4분할로 구성
	프로모션 신청으로 이동
 -->
<html>
<head>
<meta charset="UTF-8">
<title>프로모션 상품</title>
<link rel="stylesheet" href="/resources/css/seller.css" />
<style>

</style>
</head>
<body>
	<section id="product-container">
		<div id="prom1" class="product" onclick="location.href='applyprom?rank=1'">
			<h1>브론즈</h1>
			<ul>
				<li>기본 프로모션</li>
			</ul>
		</div>
		<div id="prom2" class="product" onclick="location.href='applyprom?rank=2'">
			<h1>실버</h1>
			<ul>
				<li>브론즈+</li>
				<li>더 높은 우선순위</li>
			</ul>
		</div>
		<div id="prom3" class="product" onclick="location.href='applyprom?rank=3'">
			<h1>골드</h1>
			<ul>
				<li>실버+</li>
				<li>...</li>
			</ul>
		</div>
		<div id="prom4"class="product" onclick="location.href='applyprom?rank=4'">
			<h1>플레티넘</h1>
			<ul>
				<li>골드+</li>
				<li>...</li>
			</ul>
		</div>
	</section>
	<div class="button-container">
		<a href="/seller/applyprom" class="a-btn">프로모션 신청하러 가기</a>
		<a href="/seller/main" class="a-btn">돌아가기</a>
	</div>
</body>
</html>