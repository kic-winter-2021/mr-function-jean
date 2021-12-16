<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!-- 
	작성자 : 박이삭 
	작성일자 : 21.12.15
	-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록상품 수정하기</title>
<link rel="stylesheet" href="/resources/css/adbdetail.css">
</head>
<body>
	
	<div  class="form_box">
	 <h1>등록내용 수정</h1>
		<!-- 본문 -->
		<form:form modelAttribute="adBoard" action="adbupdate" method="post">
		<div><div class="box">넘버 : ${adBoard.num}</div></div>
		<form:input type="hidden" value="${adBoard.num}" path="num" />
		<div><div class="box"> 상품 : ${adBoard.itemid}</div></div>
		<form:input type="hidden" value="${adBoard.itemid}" path="itemid" />	
		<div><div> <form:input type="text" class="field" value= "${ adBoard.content }" path="content"/></div></div>
		
		<!-- 버튼 -->
		<input class="write_button" type="submit" value="확인">
		<a href="adbdetail?num=${adBoard.num}" class="write_button">취소</a> 
		</form:form>
	
	</div>
</body>
</html>