<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
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
h1, h2, h3, h4, h5, h6 {
	font-family: "Oswald"
}

body {
	font-family: "Open Sans"
}
</style>
<decorator:head />
</head>
<body class="w3-light-grey">

	<!-- Navbar -->
	<div class="w3-top">
	  <div class="w3-bar w3-theme w3-top w3-left-align w3-large w3-black w3-hide-small">
	    <a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
	    <a href="/" class="w3-bar-item w3-button w3-theme-l1">Home</a>
	    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">About</a>
	    <a href="/support/faq/list" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Support</a>
	    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white"><i class="fa fa-search"></i></a>
	    <c:if test="${sessionScope.signinUser.type == 1 }">
	    	<a href="/admin/main" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right w3-hover-white">ADMIN</a>
	    </c:if>
	    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right w3-hover-white"><i class="fa fa-shopping-cart"></i></a>
	    <a href="javascript:userpage();" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right w3-hover-white"><i class="fa fa-user"></i></a>
	    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right w3-hover-white"><i class="fa fa-bell"></i></a>
	    <c:if test="${sessionScope.signinUser != null}">
	    	<a href="/customer/logout" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right w3-hover-white">로그아웃</a>
	    </c:if>
	    <c:if test="${sessionScope.signinUser == null}">
	    	<a href="/customer/account/signin" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right w3-hover-white">로그인</a>
	    </c:if>
	  </div>
	</div>

	<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
	<div class="w3-content" style="max-width: 1600px">

		<!-- Header -->
		<%-- slide 쇼 구현? --%>
		<header class="w3-container w3-center w3-padding-48 w3-white">
			<a href="/main.jsp"><img src="/img/logo-1.png" alt="" /></a>
			<h6> Welcome to <span class="w3-tag">Mr.Function</span>	</h6>
		</header>
		<main class="content">
			<decorator:body />
		</main>
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

		<!-- Footer -->
		<footer class="w3-container w3-grey" style="padding: 32px">
			<a href="#" class="w3-button w3-black w3-padding-large w3-margin-bottom w3-right">
				<i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
			<p>
			
			</p>
		</footer>
	</div>
</body>
<script>
	const userpage = () => {
		var user = '${sessionScope.signinUser}';
		if (user == null || user == '') location.href = "/customer/account/signin"
		else {
			var type = '${sessionScope.signinUser.type}';
			if (type == 1 ) location.href = "/admin/main";
			else if (type==2) location.href = "/customer/mypage";
			else location = "/seller/main";
		}
	}
</script>
</html>