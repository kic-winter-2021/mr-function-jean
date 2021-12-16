<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로모션</title>
</head>
<body>
	<%-- adboard 조회하기 --%>
	<div class="promotion-container">
		<!-- 현재 적용 중인 프로모션: 프로모션 리스트 -->
		<!-- 프로모션 수 -->
		<section id="promotion-count">
			<ul id="cnt__ul">
				<li>
					<div class="cnt__box">
						적용 중인 프로모션
						<span>${ count.running }</span>
					</div>
				</li>
				<li>
					<div class="cnt__box">
						만료 예정 프로모션
						<span>${ count.tobeexpired }</span>
					</div>
				</li>
				<li>
					<div class="cnt__box">
						만료된 프로모션
						<span>${ count.expired }</span>
					</div>
				</li>
			</ul>
		</section>
		<!-- 프로모션 리스트-->	
		<section id="promotion-content">
			<table class="tb__promotion">
			<colgroup>
				<col class="col__num" /> <!-- 번호 -->
				<col class="col__rank" /> <!-- 프로모션 상품 -->
				<col class="col__item" />	<!-- 대상 이름 -->
				<col class="col__registration" /> <!-- 시작일 -->
				<col class="col__expiration" /> <!-- 만료일 -->
				<col class="col__button" /> <!-- 내용보기, 계약 정보 보기, 연장하기 -->
			</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>프로모션 종류&nbsp;<span id="about_promotion">?</span></th>
				<th>상태&nbsp;<span id="about_status">?</span></th>
			</tr>
		</thead>
		<!-- Show notice List -->
		<tbody>
			<c:if test="${ listcount > 0 }">
				<c:set var="num" value="1"/>
				<c:forEach var="promotion" items="${ promotionlist }">
					<tr>
						<td>${ num }</td>
						<c:set var="num" value="${ num + 1 }" />
						<td>
							<!--  프로모션 등급 -->
							<c:choose>
								<c:when test="${ promotion.adrank == 1}">브론즈</c:when>
								<c:when test="${ promotion.adrank == 2}">실버</c:when>
								<c:when test="${ promotion.adrank == 3}">골드</c:when>
								<c:when test="${ promotion.adrank == 4}">플레티넘</c:when>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${ promotion.status == 0}">신청</c:when>
								<c:when test="${ promotion.status == 1}">준비 중</c:when>
								<c:when test="${ promotion.status == 2}">대기 중</c:when>
								<c:when test="${ promotion.status == 3}">진행 중</c:when>
								<c:when test="${ promotion.status == 4}">만료</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- end if (listcount > 0) // -->
			<!-- 게시물 없음 -->
			<c:if test="${ listcount == 0 }">
				<tr>
					<td colspan="5">적용중인 프로모션이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<a href="aboutprom" style="float: right">프로모션 상품 보러가기</a>
	</section>
	</div>
</body>
</html>