<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ수정</title>
<link rel="stylesheet" href="/resources/css/box.css">
<style> .errmsg{ color: red; }</style>
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성날짜 : 21.12.17 -->
	<!-- 문의글 타이틀 -->
	<div class="form_box">
		<h1>문의글을 수정해주세요</h1>
		<form:form modelAttribute="board" action="update" name="faqUpdate">
			<spring:hasBindErrors name="board">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<span class="errmsg"><spring:message code="${ error.code }"/></span>
				</c:forEach>
			</spring:hasBindErrors>
		<input type="hidden" name="type" value="1">
		<input type="hidden" name="customerid" value="admin">
		<input type="hidden" name="num" value="${board.num }">
		<!-- 문의글 내용 -->
		문의유형 : 
			<form:select path="category" name="category" id="category">
				<form:option  value="${board.category}" label="${board.category}"/>
				<form:option value="sale" label="상품문의"/>
				<form:option value="delivery" label="배송문의" />
				<form:option value="refund" label="환불문의" />
				<form:option value="exchange" label="교환문의"/>
				<form:option value="etc" label="기타" />
			</form:select><br>
		제목 : <form:input class="box" type="text" path="title" value="${board.title }" id="text"/><br>
		내용 : <br>
		<form:textarea class="field" path="content" value="${board.content }" rows="15" id="text"/>
		<!-- 문의글 하단 버튼 -->
		<input type="submit" class="write_button" value="수정"/>
		<a href="saildetail" class="write_button">취소</a>
		</form:form>
	</div>
</body>
</html>
