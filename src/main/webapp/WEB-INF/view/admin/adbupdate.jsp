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
<link rel="stylesheet" href="resources/css/detail.css">
</head>
<body>
	
	<div  class="form_box">
	<table>
		<caption> 등록내용 수정 </caption>
		<!-- 본문 -->
		<form:form modelAttribute="adBoard" action="adbupdate" method="post">
		<tr><td class="box">넘버 : ${adBoard.num}</td></tr><br>
		<form:input type="hidden" value="${adBoard.num}" path="num" />
		<tr><td class="box"> 상품 : ${adBoard.itemid}</td></tr><br>	
		<form:input type="hidden" value="${adBoard.itemid}" path="itemid" />	
		<tr><td class="field"> 내용 : <form:input type="text" value= "${ adBoard.content }" path="content"/></td></tr><br>
		
		<!-- 버튼 -->
		<tr><td><input class="write_button" type="submit" value="확인">
		<a href="adbdetail?num=${adBoard.num}" class="write_button">취소</a></td></tr> 
		</form:form>
	</table>
	</div>
</body>
</html>