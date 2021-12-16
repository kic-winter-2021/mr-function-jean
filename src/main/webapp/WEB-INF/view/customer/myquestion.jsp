<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의글모음</title>
<link rel="stylesheet" href="/resources/css/adboard.css" />
</head>
<body>
	<table class="tb_adblist">
		<h4 align="center">상품문의<span> 문의수: ${ listcount }</span></h4>
		<thead>
			<tr>				
				<th>상품이름</th>				
			</tr>
		</thead>
		<!-- Show question List -->
		<tbody>
			<c:if test="${ listcount > 0 }">
				<c:forEach var="iq" items="${ iqlist }">
					<tr>
						<c:set var="num" value="${ num - 1 }" />
						<td><a href="detail?num=${ iq.num }">${ iq.title }</a></td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- end if (listcount > 0) // -->
			<!-- 게시물 없음 -->
			<c:if test="${ listcount == 0 }">
				<tr>
					<td colspan="5">상품문의 글이 없습니다.</td>
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
			
		</c:if>
	</td>
	</tr>
	</tbody>		
	</table>
</body>
</html>