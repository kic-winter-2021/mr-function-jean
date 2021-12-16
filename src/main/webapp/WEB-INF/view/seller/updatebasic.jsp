<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<!-- 작성자: 정상준 -->
<html>
<head>
<meta charset="UTF-8">
<title>기본 정보 변경</title>
<link rel="stylesheet" href="/resources/css/seller.css" />
</head>
<body>
	<div id="basicform-container">
		<%-- insel 로그인한 사업자 회원 --%>
		<c:set var="signin" value="${ sessionScope.signinUser }" />
		<form:form modelAttribute="customer" action="upbasic" name="basicForm">
			<form:hidden path="id" value="${ signin.id }"/>
			<form:hidden path="password" value="${ signin.password }"/>
			<form:hidden path="type" value="${ signin.type }"/>
			<form:hidden path="nickname" value="${ signin.nickname }"/>
			<table class="infotable">
				<caption>기본 정보</caption>
				<colgroup>
					<col class="infotable__key" />
					<col class="infotable__value" />
				</colgroup>
				<!-- 에러 메시지 -->
				<thead><tr><td colspan="2">
					<spring:hasBindErrors name="seller">
						<span class="err">
							<c:forEach var="error" items="${errors.globalErrors}">
								<spring:message code="${error.code}" />
							</c:forEach>
						</span>
					</spring:hasBindErrors>
				</td></tr></thead>
				<!-- tbody: 개인정보 변경 -->
				<tbody>
					<tr>
						<th>ID</th>
						<td>${ signin.id }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>&nbsp;&nbsp;<a href="updatepassword" class="a-btn">비밀번호 변경하기</a></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><form:input path="name" type="text" value="${ signin.name }"/></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><form:input path="phoneno" type="text" value="${ signin.phoneno }"/></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><form:input path="email" type="text" value="${ signin.email}"/></td>
					</tr>
				</tbody>
				<tfoot>
					<%-- 사용자 정보를 변경하기 --%>
					<tr><td colspan="2">
						<input type="submit" value="확인" />&nbsp;
						<a href="myinfo" class="a-btn">취소</a>
					</td></tr>
				</tfoot>
			</table>
		</form:form>
	</div>
</body>
</html>