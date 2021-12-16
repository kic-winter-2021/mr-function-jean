<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp"%>
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
<title>회원 정보 수정</title>
<link rel="stylesheet" href="/resources/css/editInfo.css" type="text/css">
<script src="resources/js/editInfo.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
$(function() { $( "#Date" ).datepicker({ }); });

function history_back(){
		history.back();
}
</script>
</head>
<body>
	<form:form modelAttribute="customer" name="regForm" action="editinfo" method="post" class="myPageForm">                                                                                               
		<h2>내 정보 수정</h2>
		<div class="textForm">
			<input class="userid" name="id" type="text" value="${customer.id}" readonly />
		</div>
		<div class="textForm">
			<form:input path="password" type="password" class="pw" placeholder="PASSWORD" />
		</div>       
		<div class="textForm">
			<form:input path="name" type="text" placeholder="NAME" />
		</div>
		<div class="textForm">
			<form:input path="nickname" type="text" placeholder="NICKNAME" />
		</div>
		<div class="textForm">
			<form:input path="birthday" size="auto" id="Date" placeholder="BIRTHDAY" />
		</div>
		<div class="textForm">
			<form:select path="gender">
				<form:option value="0" label="선택" />
				<form:option value="1" label="남자" />
				<form:option value="2" label="여자" />
			</form:select>
		</div>
		<div class="textForm">
			<form:input path="email" type="text" class="email" placeholder="EMAIL" />
		</div>
		<div class="textForm">
			<form:input path="phoneno" name="phoneno" type="text" class="phone" placeholder="PHONENO"/>
		</div>
		<input type="submit" class="btn" value="수정완료" onClick="inputCheck()"/>
		<input type="button" class="btn" value="취소" onClick="history_back()"/>
	</form:form>
</body>
</html>