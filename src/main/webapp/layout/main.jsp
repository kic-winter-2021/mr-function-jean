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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

	<!-- Navigation bar with social media icons -->
	<div class="w3-bar w3-black w3-hide-small">
		<a href="#" class="w3-bar-item w3-button"><i
			class="fa fa-facebook-official"></i></a> <a href="#"
			class="w3-bar-item w3-button"><i class="fa fa-instagram"></i></a> <a
			href="#" class="w3-bar-item w3-button"><i class="fa fa-snapchat"></i></a>
		<a href="#" class="w3-bar-item w3-button"><i class="fa fa-flickr"></i></a>
		<a href="#" class="w3-bar-item w3-button"><i class="fa fa-twitter"></i></a>
		<a href="#" class="w3-bar-item w3-button"><i
			class="fa fa-linkedin"></i></a> <a href="#"
			class="w3-bar-item w3-button w3-right"><i class="fa fa-search"></i></a>
	</div>

	<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
	<div class="w3-content" style="max-width: 1600px">

		<!-- Header -->
		<header class="w3-container w3-center w3-padding-48 w3-white">
			<h1 class="w3-xxxlarge">
				<img src="/img/logo-1.png" alt="" />
			</h1>
			<h6>
				Welcome to the blog of <span class="w3-tag">Mr.Function</span>
			</h6>
		</header>

		<main>
			<decorator:body />
		</main>

		<!-- Subscribe Modal -->
		<div id="subscribe" class="w3-modal w3-animate-opacity">
			<div class="w3-modal-content" style="padding: 32px">
				<div class="w3-container w3-white">
					<i
						onclick="document.getElementById('subscribe').style.display='none'"
						class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
					<h2 class="w3-wide">SUBSCRIBE</h2>
					<p>Join my mailing list to receive updates on the latest blog
						posts and other things.</p>
					<p>
						<input class="w3-input w3-border" type="text"
							placeholder="Enter e-mail">
					</p>
					<button type="button"
						class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom"
						onclick="document.getElementById('subscribe').style.display='none'">Subscribe</button>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<footer class="w3-container w3-dark-grey" style="padding: 32px">
			<a href="#"
				class="w3-button w3-black w3-padding-large w3-margin-bottom"><i
				class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
			<p>
				Powered by <a href="https://www.w3schools.com/w3css/default.asp"
					target="_blank">w3.css</a>
			</p>
		</footer>
	</div>
</body>
</html>