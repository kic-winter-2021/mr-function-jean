<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/resources/css/adboard.css" />
</head>
<body>
	<table class="tb_adblist">
		<h4 align="center">주문목록<span> 구매갯수: ${ listcount }</span></h4>		
		<thead>			
			<tr>
				<th>구매자</th>
				<th>상품</th>
				<th>갯수</th>
				<th>주문일자</th>
			</tr>
		</thead>
		<!-- Show Sale List -->
		<tbody>
			<c:if test="${ listcount > 0 }">
				<c:forEach var="sale" items="${ salelist }">
					<tr>
						<c:set var="num" value="${ num - 1 }" />
						<td><a href="detail?num=${ sale.saleid }">${ sale.saleid }</a></td>
						<td>${ sale.buyerid }</td>
						 <td>
							<c:forEach var="transaction" items="${sale.tranlist}">
								${transaction.quantity }개<br>
							</c:forEach>
						</td> 
						<%--  <td>${ notice.regdate }</td>--%>
						<td><fmt:formatDate value="${ sale.saledate }" pattern="yyyy-MM-dd HH:mm:ss" />
					</tr>
				</c:forEach>
			</c:if>
			<!-- end if (salecount > 0) // -->
			<!-- 게시물 없음 -->
			<c:if test="${ listcount == 0 }">
				<tr>
					<td colspan="5">구매한 상품이 없습니다.</td>
				</tr>
			</c:if>
			
	<!-- paging -->
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