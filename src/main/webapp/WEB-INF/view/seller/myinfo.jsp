<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link rel="stylesheet" href="/css/seller.css" />
</head>
<body>
	<div id="info-container">
		<%-- insel 로그인한 사업자 회원 --%>
		<c:set var="insel" value="${ sessionScope.signinSeller }" />
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
						<td>${ insel.id }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>&nbsp;&nbsp;<a href="updatepassword" class="a-btn">비밀번호 변경하기</a></td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${ insel.name }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${ insel.phoneno }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${ insel.email }</td>
					</tr>
				</tbody>
				<tfoot>
					<%-- 사용자 정보를 변경하기 --%>
					<tr><td colspan="2"><a href="updatebasic" class="a-btn">기본정보 변경</a></td></tr>
				</tfoot>
			</table>
		</section>
		<section id="seller-info">
			<table class="infotable">
				<caption>사업자 정보</caption>
				<colgroup>
					<col class="infotable__key" />
					<col class="infotable__value" />
				</colgroup>
				<tbody>
					<tr>
						<th>상호명</th>
						<td>${ insel.nickname }</td>
					</tr>
					<tr>
						<th>사업자 등록번호</th>
						<td>${ insel.companyno}</td>
					</tr>
					<tr>
						<th>사업 유형</th>
						<td>
							<c:if test="${ sessionScope.signinSeller.type == 3 }">온라인사업자</c:if>
							<c:if test="${ sessionScope.signinSeller.type == 4 }">오프라인사업자</c:if>
						</td>
					</tr>
					<c:if test="${ insel.type == 4}">
						<tr>
							<th>매장 위치</th>
							<td>${ insel.location }</td>
						</tr>
					</c:if>
					<tr>
						<th>승인</th>
						<%-- 온라인/오프라인 + 승인여부 --%>
						<td></td>
					</tr>
					<tr>
						<th>사업자 정보</th>
						<td><button class="btn">사업자 등록증</button><button class="btn">주민등록증</button></td>
					</tr>
				</tbody>
				<tfoot>
					<%-- 사업자 정보를 변경하기 --%>
					<tr><td colspan="2"><a href="updatecompany" class="a-btn">사업자 정보 갱신</a></td></tr>
				</tfoot>
			</table>
		</section>
	</div>
</body>
</html>