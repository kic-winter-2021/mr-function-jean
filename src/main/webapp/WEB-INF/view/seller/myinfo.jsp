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
		<section id="member-info">
			<table class="infotable">
				<caption>사용자 정보</caption>
				<colgroup>
					<col class="infotable__key" />
					<col class="infotable__value" />
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
						<td>아이디${ sessionScope.seller.id }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>이름${ sessionScope.seller.name }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>비밀번호<button class="btn">비밀번호 변경하기</button></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${sessionScope.seller.email }</td>
					</tr>
				</tbody>
				<tfoot>
					<%-- 사용자 정보를 변경하기 --%>
					<tr><td colspan="2"><a href="update" class="abtn">개인정보 변경</a></td></tr>
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
						<th>사업자 등록번호</th>
						<td>${ sessionScope.seller.id}</td>
					</tr>
					<tr>
						<th>유형</th>
						<td></td>
					</tr>
					<tr>
						<th>승인</th>
						<%-- 온라인/오프라인 + 승인여부 --%>
						<td></td>
					</tr>
					<tr>
						<th>사업자 정보</th>
						<td><button id="">사업자 등록증</button><button class="btn">주민등록증</button></td>
					</tr>
				</tbody>
				<tfoot>
					<%-- 사업자 정보를 변경하기 --%>
					<tr><td colspan="2"><a href="updateSeller" class="abtn">사업자 정보 갱신</a></td></tr>
				</tfoot>
			</table>
		</section>
	</div>
</body>
</html>