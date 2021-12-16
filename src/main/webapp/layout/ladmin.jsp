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
			<h3>관리자</h3>
			<ul class="menulist">
				<li><a href="/admin/user">회원 관리<span class="rightarrow">〉</span></a></li>
				<li><a href="/admin/postlist">요청받은 프로모션<span class="rightarrow">〉</span></a></li>
				<li><a href="/admin/adblist">등록된 프로모션<span class="rightarrow">〉</span></a></li>
				<li><a href="/admin/stats">매출 통계표<span class="rightarrow">〉</span></a></li>
				<li><a href="/support/faq/list">고객센터<span class="rightarrow">〉</span></a></li>
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