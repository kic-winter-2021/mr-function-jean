<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기게시판</title>
<link rel="stylesheet" href="/resources/css/adboard.css" />
</head>
<body>
	<table class="tb_adblist">
		<h4 align="center">상품후기<span> 후기: ${ listcount }</span></h4>	
		<thead>			
			<tr>
				<th>상품</th>
				<th>평점</th>
			</tr>
		</thead>
		<!-- Show Sale List -->
		<tbody>
			<c:if test="${ listcount > 0 }">
				<c:forEach var="itemreview" items="${ itemreviewlist }">
					<tr>
						<c:set var="num" value="${ num - 1 }" />
						<td><a href="detail?num=${ itemreview.itemid }">${ itemreview.itemid }</a></td>
						
						<!-- 평점 -->
						<td>${ itemreview.score }</td>						
					</tr>
				</c:forEach>				
			</c:if>
			<!-- end if (salecount > 0) // -->
			<!-- 게시물 없음 -->
			<c:if test="${ listcount == 0 }">
				<tr>
					<td colspan="5">리뷰가 없습니다.</td>
				</tr>
			</c:if>
		
	<!-- Pagination -->
	<tr class="adblist_paging">
		<td colspan="5">
		<c:if test="${ listcount > 0 }">
			
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
				
			</td>
			</tr>
		</c:if>
	</div>
	</tbody>		
	</table>
</body>
</html>