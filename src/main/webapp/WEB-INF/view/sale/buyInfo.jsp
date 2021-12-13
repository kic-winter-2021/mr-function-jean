<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<table class="tb__notice">
		<caption>
			주문목록<span> 구매갯수: ${ salecount }</span>
		</caption>
		<colgroup>
			<col class="col__num" />
			<col class="col__title" />
			<col class="col__writer" />
			<col class="col__regDate" />
			<col class="col__views" />
		</colgroup>
		<thead>			
			<tr>
				<th>번호</th>
				<th>구매자</th>
				<th>상품</th>
				<th>갯수</th>
				<th>주문일자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<!-- Show Sale List -->
		<tbody>
			<c:if test="${ salecount > 0 }">
				<c:forEach var="notice" items="${ salelist }">
					<tr>
						<td>${ num }</td>
						<c:set var="num" value="${ num - 1 }" />
						<td><a href="detail?num=${ sale.num }">${ sale.buyerid }</a></td>
						<td>${transaction.quantity}</td><td>${ sale.saleid }</td>
						<%--  <td>${ notice.regdate }</td>--%>
						<td><fmt:formatDate value="${ sale.regDate }" pattern="yyyy-MM-dd HH:mm:ss" />
						<td>${ sale.views }</td>
					</tr>
				</c:forEach>
				<!--  paging -->
				<tr class="paging">
					<td colspan="5"><c:if test="${ pageNum > 1 }">
							<!--  <a href="list?pageNum=${ pageNum - 1 }">[이전]</a> -->
							<a href="javascript:listpage(${ pageNum - 1 })">[이전]</a>
						</c:if> <c:if test="${pageNum <= 1 }">[이전]</c:if> <c:forEach var="a"
							begin="${ startpage }" end="${ endpage }">
							<c:if test="${ a == pageNum }">[${ a }]</c:if>
							<c:if test="${ a != pageNum }">
								<!--  <a href="list?pageNum=${ a }">${ a }</a> -->
								<a href="javascript:listpage(${ a })">${ a }</a>
							</c:if>
						</c:forEach> <c:if test="${ pageNum < maxpage }">
							<!--  <a href="list?pageNum=${ pageNum +1 }">[다음]</a> -->
							<a href="javascript:listpage(${ pageNum +1 })">[다음]</a>
						</c:if> <c:if test="${ pageNum >= maxpage }">[다음]</c:if></td>
				</tr>
			</c:if>
			<!-- end if (salecount > 0) // -->
			<!-- 게시물 없음 -->
			<c:if test="${ salecount == 0 }">
				<tr>
					<td colspan="5">구매한 상품이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>		
	</table>
</body>
</html>