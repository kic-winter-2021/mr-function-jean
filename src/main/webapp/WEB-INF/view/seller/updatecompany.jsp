<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 정보 변경</title>
<link rel="stylesheet" href="/css/seller.css" />
</head>
<body>
	<div id="basicform-container">
		<%-- insel 로그인한 사업자 회원 --%>
		<c:set var="insel" value="${ sessionScope.signinSeller }" />
		<form:form modelAttribute="seller" action="upcompany" enctype="multipart/form-data" name="companyForm">
			<!-- hidden -->
			<form:hidden path="id" value="${ insel.id }"/>
			<form:hidden path="name" value="${ insel.name }"/>
			<form:hidden path="password" value="${ insel.password }"/>
			<form:hidden path="phoneno" value="${ insel.phoneno }" />
			<form:hidden path="email" value="${ insel.email }"/>
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
						<td><form:input type="text" path="nickname" value="${ insel.nickname }"/></td>
					</tr>
					<tr>
						<th>사업자 등록번호</th>
						<td><form:input type="text" path="companyno" value="${ insel.companyno }"/></td>
					</tr>
					<tr>
						<th>사업 유형</th>
						<td>
							<form:select id="sellertype" path="type" value="${ insel.type }">
								<form:option value="3" label="온라인" />
								<c:if test="${insel.type == '4' }"> <form:option value="4" label="오프라인" selected="selected" /> </c:if>
								<c:if test="${insel.type != '4' }"> <form:option value="4" label="오프라인"/> </c:if>
							</form:select>	
						<td>
					</tr>
					<tr>
						<th>매장 위치</th>
						<td><form:input id="location" type="text" path="location" value="${ insel.location }"/></td>
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