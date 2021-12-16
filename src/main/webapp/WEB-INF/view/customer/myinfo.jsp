<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link rel="stylesheet" href="/resources/css/seller.css" />
</head>
<body>
	<div id="info-container">
		<%-- insel 로그인한 사업자 회원 --%>
		<c:set var="signin" value="${ sessionScope.signinUser }" />
		<section id="member-info">
			<table class="infotable">
				<caption>기본 정보</caption>
				<colgroup>
					<col class="infotable__key" />
					<col class="infotable__value" />
				</colgroup>
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
						<td>${ signin.name }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${ signin.phoneno }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${ signin.email }</td>
					</tr>
				</tbody>
				<tfoot>
					<%-- 사용자 정보를 변경하기 --%>
					<tr><td colspan="2"><a href="updatebasic" class="a-btn">기본정보 변경</a></td></tr>
				</tfoot>
			</table>
		</section>
	</div>
</body>
</html>