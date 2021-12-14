<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기게시판</title>
</head>
<body>
	<table class="tb__notice">
		<caption>
			상품후기<span> 후기: ${ itemreviewcount }</span>
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
				<th>상품</th>
			
				<th>평점</th>
			</tr>
		</thead>
		<!-- Show Sale List -->
		<tbody>
			<c:if test="${ itemreviewcount > 0 }">
				<c:forEach var="itemreview" items="${ itemreviewlist }">
					<tr>
						<td>${ num }</td>
						<c:set var="num" value="${ num - 1 }" />
						<td><a href="detail?num=${ itemreview.itemid }">${ itemreview.itemid }</a></td>
						
						<!-- 평점 -->
						<td>${ itemreview.score }</td>						
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
			<c:if test="${ itemreviewcount == 0 }">
				<tr>
					<td colspan="5">리뷰가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>		
	</table>
</body>
</html>