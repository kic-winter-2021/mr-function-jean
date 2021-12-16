<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의글모음</title>
</head>
<body>
	<table class="tb__notice">
		<caption>
			상품문의<span>문의수: ${ listcount }</span>
		</caption>
		<colgroup>
			<col class="col__num" />
			<col class="col__title" />
			<col class="col__writer" />
			<col class="col__regDate" />
			<col class="col__views" />
		</colgroup>
		<thead>
			<!-- <tr>
				<td colspan="5">
					<div style="display: inline;">
						<form action="list" method="post" name="searchform">
							<input type="hidden" name="pageNum" value="4" />
							<select	name="searchtype" id="" style="width: 100px;">
								<option value="">선택하세요</option>
								<option value="subject">제목</option>
								<option value="name">작성자</option>
								<option value="content">내용</option>
							</select>
							<script>
								document.searchform.searchtype.value='${param.searchtype}'
							</script>
							<input type="text" name="searchcontent" value="${ param.searchcontent }" style="width: 250px;" />
							<input type="submit" value="검색" />
							<input type="button" value="전체 게시물보기" onclick="location.href='list'" />
						</form>
					</div>
				</td>
			</tr> -->
			<tr>
				<!-- <th>번호</th> -->
				<th>상품이름</th>
				<!-- <th>글쓴이</th>
				<th>날짜</th> -->
			</tr>
		</thead>
		<!-- Show question List -->
		<tbody>
			<c:if test="${ listcount > 0 }">
				<c:forEach var="iq" items="${ iqlist }">
					<tr>
						<!-- <td>${ num }</td>
						<c:set var="num" value="${ num - 1 }" />  -->
						<td><a href="detail?num=${ iq.num }">${ iq.title }</a></td>
						<!-- <td>${ iq.writer }</td>
						<%--  <td>${ question.regdate }</td>--%>
						<td><fmt:formatDate value="${ iq.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /> -->
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
		</tbody>		
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
				<%-- <c:if test="${ pageNum >= maxpage }">≫</c:if>--%>
				<%-- 
					<a class="w3-button w3-black" href="#">1</a>
					<a class="w3-button w3-hover-black" href="#">2</a>
				--%>
			</div>
		</c:if>
	</div>
</body>
</html>