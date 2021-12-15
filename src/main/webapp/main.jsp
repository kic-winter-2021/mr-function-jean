<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<!--
	작성자: 정상준
	작성일: 2021-12-03
	수정일: 2021-12-05 <정상준>
-->
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mr.Function - 청바지 쇼핑몰</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/template.css">
</head>
<body>
	<header class="w3-display-container w3-wide" id="home">
		<img class="w3-image" src="../resources/w3images/jeans.jpg"
			alt="Fashion Blog" width="1600" height="1060">
		<div class="w3-display-left w3-padding-large">
			<h1 class="w3-text-white">Jean Shop</h1>
			<h1 class="w3-jumbo w3-text-white w3-hide-small">
				<b>Mr.Function</b>
			</h1>
			<h6>
				<button
					class="w3-button w3-white w3-padding-large w3-large w3-opacity w3-hover-opacity-off"
					onclick="document.getElementById('subscribe').style.display='block'">SUBSCRIBE</button>
			</h6>
		</div>
	</header>
	<div id="main__container">
		<div class="main__items" id="item1">
			<ul class="ul_vertical">
				<li><i class="fas fa-chevron-left"></i></li>
				<li>
					<ul class="ul_vertical">
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
					</ul>
				</li>
				<li><i class="fas fa-chevron-right"></i></li>
			</ul>
		</div>
		<div class="main__items" id="item1">
			<ul class="ul_vertical">
				<li><i class="fas fa-chevron-left"></i></li>
				<li>
					<ul class="ul_vertical">
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
						<li><div class="item_wrapper">
								<img src="/resources/img/unnamed.jpg" alt="">
							</div></li>
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
					</ul>
				</li>
				<li><i class="fas fa-chevron-right"></i></li>
			</ul>
		</div>
		<div class="main__items" id="item1">
			<ul class="ul_vertical">
				<li><i class="fas fa-chevron-left"></i></li>
				<li>
					<ul class="ul_vertical">
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
						<li><div class="item_wrapper">
								<img src="img/unnamed.jpg" alt="">
							</div></li>
					</ul>
				</li>
				<li><i class="fas fa-chevron-right"></i></li>
			</ul>
		</div>
	</div>
</body>
</html>