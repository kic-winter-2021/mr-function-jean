<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 작성자 : 박이삭
	 작성일자 : 2021-12-2	
	 -회원가입페이지에서 등록한것으로만 만들어놓음
	 -핸드폰인증은 일단뺌 사업자 없으면 안된다고 해서 보류
	 -이메일로 인증할거니 일단 이메일주소 란 추가함
	  (인증은 회원가입페이지에서 할거니 그건 뺌)
	 -자바스크립트로 유효성 검사 넣음
	 
	  
 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/editInfo.css" type="text/css">
<script src="../resources/js/editInfo.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
$(function() { $( "#Date" ).datepicker({ }); });
</script>
</head>
<body>
<form name="regForm" action="#" method="post" class="myPageForm">                                                                                               
      <h2>내정보수정</h2>
      <div class="textForm">
        <input name="mam_id" class="userid" placeholder="ID" readonly>
      </div>
      <div class="textForm">
        <input name="mam_passwd" type="password" class="pw" placeholder="PASSWORD">
      </div>       
      <div class="textForm">
        <input name="mam_name" type="text" class="name" placeholder="NAME">
      </div>
      <div class="textForm">
        <input name="mam_birthday" size=auto id=Date placeholder="BIRTHDAY">
      </div>
       <div class="textForm">
        <input name="mam_email" type="text" class="email" placeholder="EMAIL">
      </div>
      <div class="textForm">
        <input name="mam_phone" type="text" class="phone" placeholder="PHONE">
      </div>
      <div class="textForm">
        <input name="mam_zipcode" type="text" class="addr" placeholder="ADDR_SEARCH">
        <input type="button" value="주소검색">
      </div>
      <div class="textForm">
        <input name="mam_address" type="text" class="addr" placeholder="ADDRESS">
      </div>
      <input type="button" class="btn" value="수정완료" onClick="inputCheck()"/>
    </form>
     
</body>
</html>