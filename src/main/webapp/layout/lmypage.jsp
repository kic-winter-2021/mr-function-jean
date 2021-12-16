<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<title><decorator:title /></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/layout/fun-grid.css" />
<style>
	h1, h2, h3, h4, h5, h6 { font-family: "Oswald" }
	body { font-family: "Open Sans" }
</style>
<decorator:head />
</head>
<body class="w3-light-grey">
	<!-- Navbar -->
	<div class="w3-top">
		<%@ include file="topbar.jspf" %>
	</div>
	<!-- content -->
	<div class="w3-content fun-grid" style="max-width: 1600px">
		<!-- Header -->
		<header class="w3-container w3-center w3-padding-48 w3-white">
			<a href="/main.jsp"><img src="/resources/img/logo-1.png" alt="" /></a>
			<h6> Welcome to <span class="w3-tag">Mr.Function</span>	</h6>
		</header>
		
		<%-- 메뉴바 --%>
		<div class="menubar">
			<h3>마이페이지</h3>
			<span id="seller-name">${signin.nickname} ( ${ signin.id } ) 님</span>
			<ul class="mypagemenu upmenu">
				<li onclick="location.href='buyinfo?id=${signin.id}'">
					<img src="/resources/img/mustache.png"> <div>주문목록
					<span class="circle"></span><span class="rightarrow">〉</span></div></li>
				<li onclick="location.href='myreview?id=${signin.id}'">
					<img src="/resources/img/mustache.png"> <div>상품후기
					<span class="circle"></span><span class="rightarrow">〉</span></div></li>
				<li onclick="location.href='myquestion?id=${signin.id}'">
					<img src="/resources/img/mustache.png"> <div>상품문의
					<span class="circle"></span><span class="rightarrow">〉</span></div></li>
				<li><img src="/resources/img/mustache.png"><div>최근 본 상품
					<span class="circle"></span><span class="rightarrow">〉</span></div></li>
				<li><img src="/resources/img/mustache.png"><div>찜한 상품
					<span class="circle"></span><span class="rightarrow">〉</span></div></li>
			</ul>
			<ul class="mypagemenu downmenu">
				<li onclick="location.href='coupon'">
					<img src="/resources/img/mustache.png"><div>쿠폰함
					<span class="circle"></span><span class="rightarrow">〉</span></div></li>
				<li onclick="location.href='editinfo?id=${signin.id}'">
					<img src="/resources/img/mustache.png"><div>내 정보 관리/수정
					<span class="rightarrow">〉</span></div></li>
				<li onclick="location.href='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EB%B0%B0%EC%86%A1%EC%A1%B0%ED%9A%8C'">
					<img src="/resources/img/mustache.png"> <div>택배사 배송조회
					<span class="rightarrow">〉</span></div>
				</li>
			</ul>
		</div>
		<!-- Main -->
		<main class="content">
			<decorator:body /> <%-- body --%>
		</main>
		<%-- 우측 광고 바 --%>
		<div class="sidebar">
			
		</div>
		<!-- Footer -->
		<footer class="w3-container w3-grey" style="padding: 32px">
			<%@ include file="footer.jspf" %>
		</footer>
	</div>
</body>

</html>