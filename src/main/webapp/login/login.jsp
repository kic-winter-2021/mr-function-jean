<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 구현</title>
<link href="/resources/css/login.css" rel="stylesheet">
<script><src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	$(".company_input").hide();
	$(".personalbtn").addClass("active");

	$(".companybtn").click(function() {
		$(this).addClass("active");
		$(".personalbtn").removeClass("active");
		$(".company_input").show();
		$(".personal_input").hide();
	})

	$(".personalbtn").click(function() {
		$(this).addClass("active");
		$(".companybtn").removeClass("active");
		$(".personal_input").show();
		$(".company_input").hide();
	})
</script>
</head>
<body>
	<div class="main-container">
		<div class="main-wrap">
			<section class="login-input-section-wrap">
				<div class="container">
					<div class="tabs">		
							<button class="personalbtn">개인</button>
							<button class="companybtn">사업자</button>
						<div class="personal_input">
							<div class="login-input-wrap">
								<input placeholder="ID" type="text"></input>
							</div>
							<div class="login-input-wrap password-wrap">
								<input placeholder="비밀번호" type="password"></input>
							</div>
							<div class="login-button-wrap">
								<button id="sign_in btn">로그인</button>
							</div>
							<div class="forget">
								<button class="idbtn">아이디찾기</button>
								<button class="pwbtn">비밀번호찾기</button>
								<a href ="selectSignup.jsp">
								<button class="signupbtn">회원가입</button></a>
							</div>
							<div class="checkwrap">
								<input type="checkbox" id="save" value="y" onclick="chk()">
								<label for="save"><span></span>아이디 저장</label>
								<center><h3><br>간편 로그인</h3></center>
								<br>
								<div class="kakao-signin">
									<center><img src="../../resources/img/kakaosignin.png"></center>
								</div>
							</div>
						</div><p>
						<div class="company_input">
							<div class="login-input-wrap">
								<input placeholder="ID" type="text"></input>
							</div>
							<div class="login-input-wrap password-wrap">
								<input placeholder="비밀번호" type="password"></input>
							</div>
							<div class="login-button-wrap">
								<button id="sign_in btn">로그인</button>
							</div>
							<div class="forget">
								<button class="idbtn">아이디찾기</button>
								<button class="pwbtn">비밀번호찾기</button>
								<a href ="selectSignup.jsp">
								<button class="signupbtn">회원가입</button></a>
							</div>
							<div class="checkwrap">
								<input type="checkbox" id="save" value="y" onclick="chk()">
								<label for="save"><span></span>아이디 저장</label>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<footer>
		<div class="copyright-wrap">
			<span><center><img class="footerlogo"
				src="../../resources/img/logo-1.png"> © Mr.function.</center>
			</span>
		</div>
	</footer>
</body>