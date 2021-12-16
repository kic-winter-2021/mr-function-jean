<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="/resources/css/box.css">
<style> .errmsg{ color: red; }</style>
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성날짜 : 21.12.11 -->
	<!-- 문의글 타이틀 -->
	<div class="form_box">
		<h1>문의글을 작성해주세요</h1>
		<form:form modelAttribute="board" action="write" name="faqForm">
			<spring:hasBindErrors name="board">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<span class="errmsg"><spring:message code="${ error.code }"/></span>
				</c:forEach>
			</spring:hasBindErrors>
		<input type="hidden" name="type" value="1">
		<input type="hidden" name="customerid" value="admin">
		<!-- 문의글 내용 -->
		문의유형
			<form:select path="category">
				<form:option value="none" label="선택"/>
				<form:option value="sale" label="상품문의"/>
				<form:option value="delivery" label="배송문의" />
				<form:option value="refund" label="환불문의" />
				<form:option value="exchange" label="교환문의"/>
				<form:option value="etc" label="기타" />
			</form:select><br>
		제목 : <form:input class="box" type="text" path="title" placeholder="제목을 입력해주세요"/><br>
		내용 : <br>
		<form:textarea class="field" path="content" placeholder="내용을 입력해주세요" rows="15"/>
		<!-- 문의글 하단 버튼 -->
		<input type="submit" class="write_button" value="작성"/>
		<input type="reset" class="write_button" value="취소" />
		<a href="list" class="write_button">목록</a>
		</form:form>
	</div>
</body>
</html>
