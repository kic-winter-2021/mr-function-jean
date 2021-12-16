<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!--
	작성자: 정상준
	작성일: 2021-12-12
	
	프로모션 접수 페이지
-->
<meta name="author" content="Sangjun">
<meta charset="UTF-8">
<title>프로모션 접수</title>
<link rel="stylesheet" href="/resources/css/box.css">
<style>
	.errmsg { color: red; }
	.apply-form span { display: inline-block; padding: 10px;}
</style>
</head>
<body>
	<div id="promform-container">
		<form:form modelAttribute="adPost" action="applyprom" name="applyForm" class="apply-form">
			<spring:hasBindErrors name="adPost">
			<c:forEach items="${errors.globalErrors}" var="error">
					<span class="errmsg"><spring:message code="${error.code}" /></span>
				</c:forEach>
			</spring:hasBindErrors>
			<!-- hidden id -->
			<form:hidden path="sellerid" value="${sessionScope.signinUser.id }"/>
			<form:input type="hidden" path="status" value="0" />
			<!-- promotion radio button -->
			<h5>프로모션 선택</h5>
			<form:radiobuttons id="rank" path="rank" items="${RANK}" value="${adrank}" />
			<span class="errmsg"><form:errors path="rank" /></span>
			<h5>상품 선택</h5><%-- 판매자 아이디로 등록된 상품을 조회하여 보여주기(ajax) --%>
			<form:input type="text" path="itemid" />	
			<form:textarea path="contract" class="field" placeholder="내용을 입력해주세요" rows="15" />
			
			<!-- 문의글 하단 버튼 -->
			<input type="submit" class="write_button" value="등록" />
			<a href="/seller/main" class="write_button">판매자 페이지로 돌아가기</a>
		</form:form>
	</div>
</body>
</html>