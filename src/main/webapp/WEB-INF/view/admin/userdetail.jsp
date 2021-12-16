<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link rel="stylesheet" href="../resources/css/detail.css">
</head>
<body>
<!-- 작성자 : 오근영 -->
<!-- 작성일자 : 21.12.15 -->
<div class="form_box">
	<table>
		<caption>회원정보</caption>
		<!-- 본문 -->
		<form:form modelAttribute="detail" action="userdetail" method="post">
		<tr><td class="box"> 아이디 : ${customer.id}</td></tr>
		<tr><td class="box"> 비밀번호 : ${customer.password}</td></tr>
		<tr><td class="box"> 이름 : ${customer.name}</td></tr>
		<tr><td class="box"> 닉네임 : ${customer.nickname}</td></tr>
		<tr><td class="box"> 전화번호 : ${customer.phoneno}</td></tr>
		<tr><td class="box"> 이메일 : ${customer.email}</td></tr>
		<tr><td class="box"> 성별 : ${customer.gender}</td></tr>
		<tr><td class="box"> 생년월일 : ${customer.birthday}</td></tr>
		<tr><td class="box"> 사업자번호 : ${customer.companyno}</td></tr>
		<tr><td class="box"> 카테고리 : ${customer.type}</td></tr>
		
		<!-- 버튼 -->
		<tr><td><a href="user" class="write_button">목록</a></td></tr>
		</form:form>
	</table>
	</div>
</body>
</html>