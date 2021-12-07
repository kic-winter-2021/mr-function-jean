<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href="/resources/css/agree.css" rel="stylesheet">
</head>
<body>
<header>
	<button class ="Id">아이디</button>
	<button class ="Password">비밀번호</button>
</header>
<section class="serchForm">
	<center><font color="red">아이디가 생각나지 않으세요?</font></center><br>
	<center>회원정보에 등록하신 이메일 주소로 아이디를 발송해드립니다.<br>
	아래 입력하신 이메일 주소는 회원정보에 등록된 이메일 주소와 반드시 같아야 합니다.</center>
</section>
<div>
<input placeholder="저장된 이메일 입력" type="text" id="emailinput"></input>
</div>
<div>
<input type="button"value="확인" id="check">
</div>
</body>
</html>