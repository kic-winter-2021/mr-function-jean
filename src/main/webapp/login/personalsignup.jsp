<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인용 회원가입 페이지</title>
<link href="/resources/css/personalsignup.css" rel="stylesheet">
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
	<h3 class="list">아이디</h3>
	<span class="box_id"><input type ="text" id ="id" placeholder="아이디 입력" class="int_check"
	maxlength="20"></span>
	</div>
	<input type ="button" name ="userIdcheck" value="중복확인" class="id_check">
	
	<!-- 비밀번호 입력 -->
	<div class="pwInput">
	<h3 class="list">비밀번호</h3>
	<span class="box_pw"><input type ="password" id ="pw" class="int_check"
	maxlength="20"></span><br>
	</div>
	
	<!-- 비밀번호 재확인 -->
		<div class="pwInputCheck">
	<h3 class="list">비밀번호 재확인</h3>
	<span class="box_pwcheck"><input type ="password" id ="pwCheck" class="int_check"
	maxlength="20"></span><br>
		</div>
	</div>
	
	<div class ="row_group">
	 <!-- 성명 입력 -->
               <div class="nameInput">
                  <h3 class="list">이름</h3>
                  <span class="box_name"><input type="text" id="name" class="int_check"
                     maxlength="20"></span>
               </div>
   	 <!-- 생년월일 입력 -->
	<div class="birthInput"><h3 class="list">생년월일</h3>
	<span class ="box_birth">
	<input type ="text" id ="year" class="int_check" placeholder="년(4자)">
	    <select id ="s_month" name="month">
        <option value="">-- 선택 --</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
      </select> 월
       <select id="s_day" name="day">
        <option value="">-- 선택 --</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
        <option value="24">24</option>
        <option value="25">25</option>
        <option value="26">26</option>
        <option value="27">27</option>
        <option value="28">28</option>
        <option value="29">29</option>
        <option value="30">30</option>
        <option value="31">31</option>
      </select> 일<br><br>
      		  </span>
      	</div>
      </div>
     </div> 
      <div class="genderInput">
      <h3 class="list">성별</h3>
		<span class="box_gender"> <select name="gender" id="gender">
      	<option value="">-- 선택 --</option>
        <option value="남자">남자</option>
        <option value="여자">여자</option>
      </select><br><br>
      </span>
      </div>
      
      <div class ="emailInput">
        <h3 class="list">이메일 인증</h3> 
      <input type="text" name="user_email" class = "box_email">
      <input type="button" class="box_emailpull" name="certification" value="인증번호 받기"><br><br>
      <input type="text" name="certification" placeholder="인증번호를 입력하세요" class="emailnum">
      <input type="button" name="certification" value="확인" class="check"><br><br>
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