<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<!-- 작성자: 정상준 -->
<html>
<head>
<meta charset="UTF-8">
<title>사업자 정보 변경</title>
<link rel="stylesheet" href="/resources/css/seller.css" />
</head>
<body>
	<div id="basicform-container">
		<c:set var="signin" value="${ sessionScope.signinUser }" />
		<form:form modelAttribute="customer" action="upcompany" enctype="multipart/form-data" name="companyForm">
			<!-- hidden -->
			<form:hidden path="id" value="${ signin.id }"/>
			<form:hidden path="name" value="${ signin.name }"/>
			<form:hidden path="password" value="${ signin.password }"/>
			<form:hidden path="phoneno" value="${ signin.phoneno }" />
			<form:hidden path="email" value="${ signin.email }"/>
			<!--  -->
			<table class="infotable">
				<caption>사업자 정보</caption>
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
				<tbody>
					<tr>
						<th>상호명</th>
						<td><form:input type="text" path="nickname" value="${ signin.nickname }"/></td>
					</tr>
					<tr>
						<th>사업자 등록번호</th>
						<td><form:input type="text" path="companyno" value="${ signin.companyno }"/></td>
					</tr>
					<tr>
						<th>사업 유형</th>
						<td>
							<form:select id="sellertype" path="type" value="${ signin.type }">
								<form:option value="3" label="온라인" />
								<c:if test="${signin.type == '4' }"> <form:option value="4" label="오프라인" selected="selected" /> </c:if>
								<c:if test="${signin.type != '4' }"> <form:option value="4" label="오프라인"/> </c:if>
							</form:select>	
						<td>
					</tr>
					<tr>
						<th>매장 위치</th>
						<td><form:input id="location" type="text" path="location" value="${ signin.location }"/></td>
					</tr>
					<tr>
						<th>사업자 등록 정보</th>
						<td><button type="button" id="toggle-seller" class="togglebtn">보기/닫기</button></td>
					</tr>
					<tr>
						<td colspan="2">
							<%-- 파일 출력 --%>
							<div id="id-container" class="hidden">
							</div>
						</td>
					</tr>
					<tr>
						<th>주민등록 정보</th>
						<td><button type="button" id="toggle-id" class="togglebtn">보기/닫기</button></td>
					</tr>
					<tr>
						<td colspan="2">
							<%-- 파일 출력 --%>
							<div id="id-container" class="hidden">
							</div>
						</td>
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