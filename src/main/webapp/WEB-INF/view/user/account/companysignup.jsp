<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자용 회원가입 페이지</title>
<link href="/resources/css/companysignup.css" rel="stylesheet">
</head>
<body>
<div id="wrap" class ="wrapper">
<header class ="logoheader">
	<center><img src="../../resources/img/logo-1.png"></center>
</header>
	<!-- 회원가입 타이틀 부분 -->
	<form name ="login" action="index.html" method="post" class="id">
	<div id ="container">
		<div class="row_gorup">
		
	<div class ="idInput">
	<!-- 아이디입력 -->
	<h3 class="list">사업자등록 번호</h3>
	<span class="box_comnum"><input type ="text" id ="companynum" class="int check"
	maxlength="20"></span>
	<input type ="button" name ="companyNum" value="사업자번호 조회" id="companyNum" class="id_check">
	</div>
	 <div class="nameInput">
                  <h3 class="list">이름</h3>
                  <span class="box_name"><input type="text" id="name" class="int_check"
                     maxlength="20"></span>
               </div>
	 <div class="userInput">
                  <h3 class="list">회사 주소</h3>
                  <div id="address" class="int_id">
                  <span class = "addresssuch">
                  <input type="text" id="sample4_postcode" class="postnum" placeholder="우편번호" readonly>
                  <input type="button" id="addressButton" class="postnumsurch" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly><br>
                  </span>
                  <input type="text" id="sample4_roadAddress" class="road" placeholder="도로명주소" readonly><br>
                  <span id="guide" style="color:#999;display:none"></span>
                  <input type="text" id="sample4_detailAddress" class="detailaddr" placeholder="상세주소" >
                  </div>
               </div>
		<div class ="row_group">
	 <!-- 상호 입력 -->
               <div class="companynameInput">
                  <h3 class="list">상호</h3>
                  <span class="box_companyname"><input type="text" id="companyname" class="int check"
                     maxlength="20"></span>
               </div>
  			</div>
  			
	<div class ="idInput">
	<!-- 아이디입력 -->
	<h3 class="list">아이디</h3>
	<span class="box_id"><input type ="text" id ="id" placeholder="아이디 입력" class="int check"
	maxlength="20"></span>
	</div>
	
	<input type ="button" name ="userIdcheck" value="중복확인" class="id_check">
	
	<!-- 비밀번호 입력 -->
	<div class="pwInput">
	<h3 class="list">비밀번호</h3>
	<span class="box_pw"><input type ="password" id ="pw" class="check"
	maxlength="20"></span><br>
	</div>
	
	<!-- 비밀번호 재확인 -->
		<div class="pwInputCheck">
	<h3 class="list">비밀번호 재확인</h3>
	<span class="box_pwcheck"><input type ="password" id ="pwCheck" class="int check"
	maxlength="20"></span><br>
		</div>
	</div>

      </div>
      <div class="click_signup">
      <input type="submit" value="가입하기" class="signup">
      </div>
	</form>
</div>
<footer>
	<div class="coper"><center>© Mr.function.</center></div>
</footer>
</body>
</html>