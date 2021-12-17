<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정하기</title>
<link rel="stylesheet" href="/resources/css/box.css">
<style> .errmsg{ color: red; }</style>
</head>
<body>
	<!-- 좌측 부분 레이아웃 -->
	<div class="form_box">
		<form:form modelAttribute="board" action="update" name="updateForm">
			<h3>공지사항</h3>
			<spring:hasBindErrors name="board">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<span class="errmsg"><spring:message code="${ error.code }"/></span>
				</c:forEach>
			</spring:hasBindErrors>
			<input type="hidden" name="customerid" value="${sessionScope.signinUser.id }">
			<input type="hidden" name="type" value="2"><!-- 공지사항 -->
			<input type="hidden" name="num" value="${board.num }">
			제목 : <form:input class="box" type="text" path="title" value="${board.title }" name="title"/><br>
			카테고리 : 
			<form:select class="box" path="category">
				<form:option value="${board.category }" label="${board.category }"/>
				<form:option value="사이트 운영" label="사이트 운영" />
				<form:option value="정책" label="정책" />
				<form:option value="이벤트" label="이벤트" />
			</form:select> <br>
			내용 <br>
			<form:textarea class="box" path="content" rows="15" value="${board.content}" name="content"/><br>
			<!-- 하단 버튼 -->
			<input type="submit" class="write_button" value="수정"/>
			<a href="detail?num=${board.num}" class="write_button">취소</a>
		</form:form>
	</div>

</body>
</html>