<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/css/agree.css" >
<style>
	.errmsg { color: red; }
</style>
</head>
<body>
	<header>
		아이디 비밀번호
	</header>
	<form:form modelAttribute="customer" action="idsearch" method="post">
		<spring:hasBindErrors name="customer">
			<span class="err">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<spring:message code="${ error.code }" />
				</c:forEach>
			</span>
		</spring:hasBindErrors>
		<table>
			<tr>
				<th>이메일</th>
				<td><form:input type="text" path="email" />
					<span class="errmsg"><form:errors path="email" /></span>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="아이디찾기"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>