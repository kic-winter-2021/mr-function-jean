<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="../resources/css/detail.css">
</head>
<body>
<!-- 작성자 : 오근영 -->
<!-- 작성일자 : 21.12.15 -->
<div class="form_box">
	<table>
		<caption>회원정보수정</caption>
		<!-- 본문 -->
		<form:form modelAttribute="customer" action="userupdate" method="post">
		<tr><td class="box"> 아이디 : ${customer.id}</td></tr>
		<input type="hidden" value="${ customer.id}" />
		<tr><td class="box"> 비밀번호 : ${customer.password}</td></tr>
		<input type="hidden" value="${ customer.password}" />
		<tr><td class="box"> 이름 : <form:input type="text" value="${customer.name}" path="name" /></td></tr>
		<tr><td class="box"> 닉네임 : <form:input type="text" value="${customer.nickname}" path="nickname" /></td></tr>
		<tr><td class="box"> 전화번호 : <form:input type="tel" value="${customer.phoneno}" path="phoneno" /></td></tr>
		<tr><td class="box"> 이메일 : <form:input type="email" value="${customer.email}" path="email" /></td></tr>
		<tr><td class="box"> 성별 : <form:input type="number" value="${customer.gender}" path="gender" /></td></tr>
		<tr><td class="box"> 생년월일 : ${customer.birthday}</td></tr>
		<tr><td class="box"> 사업자번호 : <form:input type="number" value="${customer.companyno}" path="companyno" /></td></tr>
		<tr><td class="box"> 카테고리 : ${customer.type}</td></tr>
		<input type="hidden" value="${ customer.type}" />
		
		<!-- 버튼 -->
		<tr><td><input type="submit" class="write_button" value="수정" /> 
		<a href="user" class="write_button">목록</a></td></tr>
		</form:form>
	</table>
	</div>
</body>
</html>