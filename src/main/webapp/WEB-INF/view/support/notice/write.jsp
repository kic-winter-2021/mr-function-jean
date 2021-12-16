<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성하기</title>
<link rel="stylesheet" href="/resources/css/box.css">
<style> .errmsg{ color: red; }</style>
</head>
<body>
	<!-- 좌측 부분 레이아웃 -->
	<div class="form_box">
		<form:form modelAttribute="board" action="write" name="noticeForm">
			<h3>공지사항</h3>
			<spring:hasBindErrors name="board">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<span class="errmsg"><spring:message code="${ error.code }"/></span>
				</c:forEach>
			</spring:hasBindErrors>
			<input type="hidden" name="customerid" value="${sessionScope.signinUser.id }">
			<input type="hidden" name="type" value="2"><!-- 공지사항 -->
			제목 <form:input class="box" type="text" path="title" placeholder="제목을 입력해주세요"/><br>
			카테고리
			<form:select class="box" path="category">
				<form:option value="none" label="선택해주세요"/>
				<form:option value="operation" label="사이트 운영" />
				<form:option value="policy" label="정책" />
				<form:option value="event" label="이벤트" />
			</form:select> <br>
			내용 <br>
			<form:textarea class="box" path="content" rows="15" placeholder="내용을 입력해주세요"/><br>
			<!-- 하단 버튼 -->
			<input class="write_button" type="submit" value="등록">
			<input class="write_button" type="reset" value="취소">
			<a href="list" class="write_button">목록</a>
		</form:form>
	</div>

</body>
</html>