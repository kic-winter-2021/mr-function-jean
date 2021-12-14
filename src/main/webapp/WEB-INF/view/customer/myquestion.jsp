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
			상품문의<span>문의수: ${ questioncount }</span>
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
			<c:if test="${ questioncount > 0 }">
				<c:forEach var="listquestion" items="${ listquestion }">
					<tr>
						<!-- <td>${ num }</td>
						<c:set var="num" value="${ num - 1 }" />  -->
						<td><a href="detail?num=${ listquestion.num }">${ listquestion.title }</a></td>
						<!-- <td>${ listquestion.writer }</td>
						<%--  <td>${ question.regdate }</td>--%>
						<td><fmt:formatDate value="${ listquestion.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /> -->
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
			<!-- end if (listcount > 0) // -->
			<!-- 게시물 없음 -->
			<c:if test="${ questioncount == 0 }">
				<tr>
					<td colspan="5">상품문의 글이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>		
	</table>
</body>
</html>