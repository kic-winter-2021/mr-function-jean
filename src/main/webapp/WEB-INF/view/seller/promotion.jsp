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
				<th>프로모션 종류</th>
				<th>시작일</th>
				<th>만료일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<!-- Show notice List -->
		<tbody>
			<c:if test="${ listcount > 0 }">
				<c:forEach var="promotion" items="${ promotionlist }">
					<tr>
						<td>${ num }</td>
						<c:set var="num" value="${ num - 1 }" />
						<td>
							<!--  프로모션 등급 -->
							<c:choose>
								<c:when test="${ promotion.rank == '1'}">브론즈</c:when>
								<c:when test="${ promotion.rank == '2'}">실버</c:when>
								<c:when test="${ promotion.rank == '3'}">골드</c:when>
								<c:when test="${ promotion.rank == '4'}">플레티넘</c:when>
							</c:choose>
						</td>
						<%--  <td>${ notice.regdate }</td>--%>
						<td><fmt:formatDate value="${ promotion.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${ promotion.expDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${ promotion.views }</td>
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
		<!-- 글쓰기 -->
		<tr>
			<td colspan="5" align="right"><a href="aboutprom">프로모션 상품 보러가기</a></td>
		</tr>
	</table>
		<!-- Pagination -->
		<div class="w3-center w3-padding-32">
			<c:if test="${ listcount > 0 }">
				<div class="w3-bar">
					<!-- 이전 -->
					<c:if test="${ pageNum > 1 }">
						<a class="w3-button w3-hover-black" href="javascript:listpage(${ pageNum - 1 })">〈</a>
					</c:if>
					<c:forEach var="a" begin="${ startpage }" end="${ endpage }">
						<!-- 현재 페이지 -->
						<c:if test="${ a == pageNum }"><a class="w3-button w3-black" href="#">${ a }</a></c:if>
						<!-- 다른 페이지 -->
						<c:if test="${ a != pageNum }"><a class="w3-button w3-hover-black" href="javascript:listpage(${ a })">${ a }</a></c:if>
					</c:forEach>
					<!-- 다음 -->
					<c:if test="${ pageNum < maxpage }"><a class="w3-button w3-hover-black" href="javascript:listpage(${ pageNum +1 })">〉</a></c:if>
				</div>
			</c:if>
		</div>
		</section>
		<!-- 프로모션 문의... -->
	</div>
</body>
</html>