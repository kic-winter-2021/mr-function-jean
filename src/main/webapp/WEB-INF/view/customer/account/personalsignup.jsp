<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인용 회원가입 페이지</title>
<link href="../../css/personalsignup.css" rel="stylesheet">
</head>
<body>
<div id="wrap" class ="wrapper">
<header class ="logoheader">
	<center><img src="/resources/img/logo-1.png"></center>
</header>
	<!-- 회원가입 타이틀 부분 -->
	<form:form modelAttribute="customer" action="psignup" method="post">
	<input type="hidden" name="type" value="2" />
	<div id ="container">
		<div class="row_group">
			<div class ="idInput">
	<!-- 아이디입력 -->
	<h3 class="list">아이디</h3>
	<span class="box_id"><form:input type ="text" path="id" id ="id" placeholder="아이디 입력" class="int_check"
	maxlength="20" /></span>
	</div>
	<input type ="button" name ="userIdcheck" value="중복확인" class="id_check">
	
	<!-- 비밀번호 입력 -->
	<div class="pwInput">
	<h3 class="list">비밀번호</h3>
	<span class="box_pw"><form:input type ="password" path="password" id ="pw" class="int_check"
	maxlength="20" /></span><br>
	</div>
	
	<!-- 비밀번호 재확인 -->
		<div class="pwInputCheck">
	<h3 class="list">비밀번호 재확인</h3>
	<span class="box_pwcheck"><input type ="password" path="pwCheck" id ="pwCheck" class="int_check"
	maxlength="20"></span><br>
		</div>
	</div>
	
	<div class ="row_group">
	 <!-- 성명 입력 -->
               <div class="nameInput">
                  <h3 class="list">이름</h3>
                  <span class="box_name"><form:input type="text" path="name" id="name" class="int_check"
                     maxlength="20" /></span>
               </div>
      <!-- 닉네임 입력 -->
               <div class="nameInput">
                  <h3 class="list">닉네임</h3>
                  <span class="box_name"><form:input type="text" path="nickname" id="nickname" class="int_check"
                     maxlength="20" /></span>
               </div>
   	 <!-- 생년월일 입력 -->
	<div class="birthInput">
	<h3 class="list">생년월일</h3>
	<form:input type="date" path="birthday" />
      	</div>
      	<!-- 전화번호 입력 -->
               <div class="nameInput">
                  <h3 class="list">전화번호</h3>
                  <span class="box_name"><form:input type="tel" path="phoneno" id="name" class="int_check"
                     maxlength="20" /></span>
               </div>
      </div>
     </div> 
      <div class="genderInput">
      <h3 class="list">성별</h3>
		<span class="box_gender"> <form:select path="gender" id="gender">
      	<form:option value="0" label="선택" />
        <form:option value="1" label="남자" />
        <form:option value="2" label="여자" />
      </form:select><br><br>
      </span>
      </div>
      
      <div class ="emailInput">
        <h3 class="list">이메일 인증</h3> 
      <form:input type="text" path="email" class = "box_email" />
     <!--  <input type="button" class="box_emailpull" name="certification" value="인증번호 받기"><br><br>
      <input type="text" name="certification" placeholder="인증번호를 입력하세요" class="emailnum">
      <input type="button" name="certification" value="확인" class="check"><br><br>
      </div>-->
      <div class="click_signup">
      <input type="submit" value="가입하기" class="signup">
      <input type="submit" value="취소" class="signup">
       </div>
	</form:form>
</div>
<footer>
	<div class="coper" style="text-align:center"><center>© Mr.function.</center></div>
</footer>
</body>
</html>