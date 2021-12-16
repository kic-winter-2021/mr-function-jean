<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<!-- 
	작성자: 윤영훈
	
	수정: 정상준
	수정일: 2021-12-13
	탭 활성화 
-->
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/account.css" >
<style>.errmsg { color: red; display: block; margin-left: 30px; margin-top: 30px; }
</style>
</head>
<body>
	<main id="main-container">
		<div id="signin-tabs" class="twintabs">
			<button id="tab1" class="tab active">개인 로그인</button>
			<button id="tab2" class="tab">사업자 로그인</button>
		</div>
		<section id="signinform">
			<spring:hasBindErrors name="customer">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<span class="errmsg"><spring:message code="${ error.code }"/></span>
				</c:forEach>
			</spring:hasBindErrors>			
			<div id="content1" class="twinform-container">
				<form:form modelAttribute="customer" action="signin" name="psigninForm">
					<form:input type="text" path="id" placeholder="ID" class="inputbox"/>
					<form:input type="password" path="password" placeholder="비밀번호" class="inputbox"/>
					<form:input type="hidden" path="type" value="2"/>
					<%@ include file="hidden.jspf" %>
					<input type="submit" value="로그인" id="signin"/>
				</form:form>
			</div>
			<div id="content2" class="twinform-container hidden">
				<form:form modelAttribute="customer" action="signin" name="ssigninForm">
					<form:input type="text" path="id" placeholder="ID" class="inputbox"/>
					<form:input type="password" path="password" placeholder="비밀번호" class="inputbox"/>
					<form:input type="hidden" path="type" value="3"/>
					<%@ include file="hidden.jspf" %>
					<input type="submit" value="로그인" id="signin"/>
				</form:form>
			</div>
		</section>
		<div class="btn-container">
			<button class="a-btn" onclick="win_open('search?u=id')">아이디 찾기</button>
			<button class="a-btn" onclick="win_open('search?u=pw')">비밀번호 찾기</button>
			<a href ="selectsignup" class="a-btn">회원가입</a>
		</div>
		<div class="checkwrap">
			<input type="checkbox" id="saveid" value="y" onclick="chk()">
			<label for="saveid">아이디 저장</label>
		</div>
		<div class="kakao-signin"><img src="/img/kakaosignin.png"></div>
	</main>
	<footer>
		<div class="copyright-wrap">
			<span>© Mr.function.</span><a href="/main.jsp"><img class="footerlogo" src="/img/logo-1.png"></a>
		</div>
	</footer>	
</body>
<script>
	const tab1 = document.getElementById("tab1");
	const tab2 = document.getElementById("tab2");
	const content1 = document.getElementById("content1");
	const content2 = document.getElementById("content2");
	const select1 = () => {
		tab1.classList.add("active");
		content1.classList.remove("hidden");
		tab2.classList.remove("active");
		content2.classList.add("hidden");
	}
	const select2 = () => {
		tab2.classList.add("active");
		content2.classList.remove("hidden");
		tab1.classList.remove("active");
		content1.classList.add("hidden");
	}
	tab1.addEventListener('click', select1);
	tab2.addEventListener('click', select2);
	if('${type}' == 's' || '${param.t}' == 's') {
		select2();
		console.log("${type}")
	}
	function win_open(page) {
		var op = "width=700, height=450, left=50,top=150";
		open(page, "", op);
	}
</script>
</html>