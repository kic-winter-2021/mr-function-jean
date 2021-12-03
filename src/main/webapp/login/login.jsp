<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 구현</title>
<link href ="/resources/css/login.css" rel="stylesheet">
</head>
<body>
	<div class ="main-container">
	  <div class ="main-wrap">
	  	<header>
	  	</header>
	  	<section class ="login-input-section-wrap">
	  		<div class ="login-input-wrap">
	  			<input placeholder="ID" type="text"></input> 
	  		</div>
	  		<div class="login-input-wrap password-wrap">	
				<input placeholder="비밀번호" type="password"></input>
			</div>
			<div class="login-button-wrap">
				<button id="sign_in btn">로그인</button>
			</div>
			<div class="checkwrap">
				<input type="checkbox" id="save" value="y" onclick="chk()">
				<label for ="save"><span></span>아이디 저장 | </label>
			</div>
	  	</section>
	  <section class="Easy-sgin-in-wrap">
			<h2>간편 로그인</h2><br>
			<div class = "kakao-signin">
				<img src ="kakaosignin.png">
			</div>
			<ul class="sign-button-list">
				<li><button><i class="fas fa-qrcode"></i><span>Sign in with QR code</span></button></li>
			</ul>
			<p class="forget-msg">
			<button id="idsurch">아이디 찾기</button> | <button id ="pwsurch">비밀번호 찾기</button> | <button id="signup">회원가입</button>
			</p>
		</section>
		<footer>
			<div class="copyright-wrap">
			<span>	<img src="img/logo.png"> Copyright © NAVER Corp. All Rights Reserved.</span>
			</div>
		</footer>
		</div>
	</div>
</body>