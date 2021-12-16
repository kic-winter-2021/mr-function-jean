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
	<div class="w3-content" style="max-width: 1600px">
		<!-- Header -->
		<%-- 메인 헤더: slide 쇼 구현? --%>
		<header class="w3-container w3-center w3-padding-48 w3-white">
			<a href="/main.jsp"><img src="/resources/img/logo-1.png" alt="" /></a>
			<h6> Welcome to <span class="w3-tag">Mr.Function</span>	</h6>
		</header>
		<!-- Subscribe Modal -->
		<div id="subscribe" class="w3-modal w3-animate-opacity">
			<div class="w3-modal-content" style="padding: 32px">
				<div class="w3-container w3-white">
					<i onclick="document.getElementById('subscribe').style.display='none'"
						class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
					<h2 class="w3-wide">SUBSCRIBE</h2>
					<p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
					<button type="button" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom"
						onclick="document.getElementById('subscribe').style.display='none'">Subscribe</button>
				</div>
			</div>
		</div>
		<%-- 메인 헤더// --%>
		<!-- Main -->
		<main class="content">
			<decorator:body /> <%-- body --%>
		</main>
		<!-- Footer -->
		<footer class="w3-container w3-grey" style="padding: 32px">
			<%@ include file="footer.jspf" %>
		</footer>
	</div>
</body>
</html>