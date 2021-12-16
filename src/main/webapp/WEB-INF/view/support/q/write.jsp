<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성</title>
<link rel="stylesheet" href="/resources/css/box.css">
<style> .errmsg{ color: red; }</style>
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!--  -->
	<!-- 문의글 타이틀 -->
	<div class="form_box">
		<h1>문의글을 작성해주세요</h1>
		<form:form modelAttribute="board" action="write" name="questionForm">
			<spring:hasBindErrors name="board">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<span class="errmsg"><spring:message code="${ error.code }"/></span>
				</c:forEach>
			</spring:hasBindErrors>
		<!-- 문의글 내용 -->
			<input type="hidden" name="customerid" value="${sessionScope.signinUser.id }"/>
			<input type="hidden" name="type" value="3"><!-- 문의하기 -->
			문의유형
			<form:select path="category">
				<form:option value="none" label="선택하세요"/>
				<form:option value="delivery" label="배송"/>
				<form:option value="exchange" label="교환"/>
				<form:option value="refund" label="환불" />
				<form:option value="etc" label="기타"/>
			</form:select><br>
			제목 : <form:input class="box" type="text" path="title" placeholder="제목을 입력해주세요"/><br>
			내용 : <br>
			<form:textarea class="field" path="content" placeholder="내용을 입력해주세요" rows="15"/>
			<!-- 문의글 하단 버튼 -->
			<input type="submit" class="write_button" value="작성"/>
			<input type="reset" class="write_button" value="취소" />
			<a href="redirect:list" id="write_button">목록</a>
		</form:form>
	</div>
</body>
</html>
