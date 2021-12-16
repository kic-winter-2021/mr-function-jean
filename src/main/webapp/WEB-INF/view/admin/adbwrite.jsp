<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고등록페이지</title>
<link rel="stylesheet" href="/css/box.css">
</head>
<body>
	<!-- 작성자 : 박이삭 -->
	<!-- 작성날짜 : 21.12.15 -->
	<!-- 광고등록 타이틀 -->
	<div class="form_box">
		<h1>광고를 등록해주세요</h1>
		<form:form modelAttribute="adBoard" action="adbwrite" name="adbwriteform">
		넘버 : <form:input type="text" path="num" value="1" /><br>
		<!-- 광고등록 내용 -->		
		상품 : <form:input class="box" type="text" path="itemid" placeholder="상품을 입력해주세요" /><br>
		내용 : <br>
		<form:textarea class="field" path="content" placeholder="내용을 입력해주세요" rows="15" />
		<!-- 문의글 하단 버튼 -->
		<input type="submit" class="write_button" value="작성"/>
		<input type="reset" class="write_button" value="취소" />
		<a href="adblist" class="write_button">목록</a>
		</form:form>
	</div>
</body>
</html>
