<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 수정</title>
<link rel="stylesheet" href="/resources/css/box.css">
<style> .errmsg{ color: red; }</style>
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성일자 : 21.12.17 -->
	<!-- 문의글 타이틀 -->
	<div class="form_box">
		<h1>문의글을 수정해주세요</h1>
		<form:form modelAttribute="board" action="update" name="questionForm">
			<spring:hasBindErrors name="board">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<span class="errmsg"><spring:message code="${ error.code }"/></span>
				</c:forEach>
			</spring:hasBindErrors>
		<!-- 문의글 내용 -->
			<input type="hidden" name="customerid" value="${sessionScope.signinUser.id }"/>
			<input type="hidden" name="type" value="3"><!-- 문의하기 -->
			<input type="hidden" name="num" value="${board.num }">
			문의유형 : 
			<form:select path="category">
				<form:option value="${board.category }" label="${board.category }"/>
				<form:option value="배송" label="배송"/>
				<form:option value="교환" label="교환"/>
				<form:option value="환불" label="환불" />
				<form:option value="기타" label="기타"/>
			</form:select><br>
			제목 : <form:input class="box" type="text" path="title" value="${board.title }" name="title"/><br>
			내용 : <br>
			<form:textarea class="field" path="content" value="${board.content }" rows="15" name="content"/>
			<!-- 문의글 하단 버튼 -->
			<input type="submit" class="write_button" value="수정"/>
			<a href="detail?num=${board.num}" class="write_button">취소</a>
		</form:form>
	</div>
</body>
</html>
