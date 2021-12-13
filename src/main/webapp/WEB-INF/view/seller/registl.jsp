<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록상품리스트.</title>
<!-- 작성자 : 오근영 -->
<!-- 작성일자 : 21.12.06 -->
<!-- 수정일자 : 21.12.12 : 1차 폼 양식 변경 -->
<!-- 수정일자 : 21.12.13 : 2차 폼 양식 변경  -->
<!-- CSS파일 -->
<%--  <link rel="stylesheet" href="regist.css">
</head>
<body>
	<!-- 1행 이미지 -->
	<div class="grid-image">
		<img src="j2.jpg"> <img src="j3.jpg"> <img src="j4.jpg">
	</div>
	<!-- 2행 이미지 -->
	<div class="grid-image">
		<img src="j3.jpg"> <img src="j6.jpg"> <img src="j4.jpg">
	</div>
	<!-- 등록 버튼 -->
	<button class="add">작성하기</button>

	<!-- 추후 페이징 기능 추가 예정 -->
--%>
<table class="tb__notice">
		<caption>
			등록상품<span>리스트 : ${ listcount }</span>
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
				<td colspan="5">
					<div style="display: inline;">
						<form action="list" method="post" name="searchform">
							<input type="hidden" name="pageNum" value="1" />
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
							<input type="button" value="전체 게시물보기" onclick="location.href='registl'" />
						</form>
					</div>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<!-- Show register List -->
		<tbody>
			<c:if test="${ listcount > 0 }">
				<c:forEach var="item" items="${ registl }">
					<tr>
						<td>${ num }</td>
						<c:set var="num" value="${ num - 1 }" />
						<td><a href="saledetail?itemid=${ item.itemid }">${ item.title }</a></td>
						<td>${ item.sellerid }</td>
						<%--  <td>${ item.regdate }</td>--%>
						<td><fmt:formatDate value="${ item.regDate }" pattern="yyyy-MM-dd HH:mm:ss" />
						<td>${ item.views }</td>
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
			<c:if test="${ listcount == 0 }">
				<tr>
					<td colspan="5">등록된 게시물이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
		<!-- 글쓰기 -->
		<tr>
			<td colspan="5" align="right"><a href="register">[글쓰기]</a></td>
		</tr>
	</table>
</body>
</html>
 