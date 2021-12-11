<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 문의글</title>
<link rel="stylesheet" href="/css/box.css">
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성날짜 : 21.12.11 -->
	<!-- 문의글 타이틀 -->
	<div class="form_box">
		<h1>문의글을 작성해주세요</h1>
		<form:form modelAttribute="faq" action="w" name="faqForm">
		<!-- 문의글 내용 -->
		문의유형
			<select name="category">
				<option value="none" selected>선택</option>
				<option value="sale">상품문의</option>
				<option value="delivery">배송문의</option>
				<option value="refund">환불문의</option>
				<option value="exchange">교환문의</option>
				<option value="etc">기타</option>
			</select><br>
		제목 : <input class="box" type="text" name="title" placeholder="제목을 입력해주세요"><br>
		내용 : <br>
		<textarea class="field" name="content" placeholder="내용을 입력해주세요" rows="15"></textarea>
		<!-- 문의글 하단 버튼 -->
		<input type="submit" class="write_button" value="작성"/>
		<input type="reset" class="write_button" value="취소" />
		<a href="list" class="write_button">목록</a>
		</form:form>
	</div>
</body>
</html>
