<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="/css/login.css" rel="stylesheet">
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
							<button class ="personalbtn">개인</button>
							<button class ="companybtn">사업자</button>
						<div class="personal_input">
							<form:form modelAttribute="customer" action="psignin" name="psigninForm">
								<div class="login-input-wrap">
									<input placeholder="ID" type="text" name="id"/>
								</div>
								<div class="login-input-wrap password-wrap">
									<input placeholder="비밀번호" type="password" name="password"/>
								</div>
								<div class="login-button-wrap">
									<button id="sign_in btn">로그인</button>
								</div>
							</form:form>
							<div class="forget">
								<button class="idbtn">아이디찾기</button>
								<button class="pwbtn">비밀번호찾기</button>
								<a href ="selectSignup.jsp" class="signupbtn">회원가입</a>
							</div>
							<div class="checkwrap">
								<input type="checkbox" id="save" value="y" onclick="chk()">
								<label for="save"><span></span>아이디 저장</label>
								<center><h3><br>간편 로그인</h3></center>
								<br>
								<div class="kakao-signin">
									<center><img src="/img/kakaosignin.png"></center>
								</div>
							</div>
						</div><p>
						<div class="company_input">
							<form:form modelAttribute="seller" action="ssignin" name="ssigninForm">
								<div class="login-input-wrap">
									<input placeholder="ID" type="text" name="id" />
								</div>
								<div class="login-input-wrap password-wrap">
									<input placeholder="비밀번호" type="password" name="password" />
								</div>
								<div class="login-button-wrap">
									<button id="sign_in btn">로그인</button>
								</div>
							</form:form>
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
			<span><img class="footerlogo" src="/img/logo-1.png"> © Mr.function.</span>
		</div>
	</footer>
</body>