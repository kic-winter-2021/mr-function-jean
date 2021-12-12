<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 페이지</title>
</head>
<body>
	<%-- insel 로그인한 사업자 회원 --%>
	<c:set var="insel" value="${ sessionScope.signinSeller }" />
	<!-- 판매자 좌측 탭 -->
	<div id="seller-tab-container">
		<h2>사업자</h2>
		<span id="seller-name">${ insel.id } 님</span>
		<ul id="seller-tab">
			<li><a href="/seller/myinfo" class="tab">내 정보</a></li>
			<li><a href="/seller/manageitem" class="tab">상품관리</a></li>
			<li><a href="/seller/promotion" class="tab">프로모션</a></li>
			<li><a href="/seller/stats" class="tab">통계</a></li>
		</ul>
	</div>
	<!-- 판매작 전용 페이지 -->
	
	
</body>
</html>