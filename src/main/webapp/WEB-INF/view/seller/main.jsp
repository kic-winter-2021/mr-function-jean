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
	<!-- 판매자 좌측 탭 -->
	<div id="seller-tab-container">
		<h2>사업자</h2>
		<span id="seller-name">${seller.id} 님</span>
		<ul id="seller-tab">
			<li><a href="info" class="tab">내 정보</a></li>
			<li><a href="itemlist" class="tab">내 상품 보기</a></li>
			<li><a href="enroll" class="tab">상품 등록</a></li>
			<li><a href="adpost" class="tab">광고문의</a></li>
			<li><a href="stats" class="tab">통계보기</a></li>
		</ul>
	</div>
	<!-- 판매작 전용 페이지 -->
	
	
</body>
</html>