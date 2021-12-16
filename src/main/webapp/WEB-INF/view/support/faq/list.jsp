<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<link rel="stylesheet" href="/resources/css/qlist.css">
</head>
<body>
	<table class="tb__faq">
		<caption>FAQ</caption>
		<colgroup>
			<col class="col__num"/>
			<col class="col__title" />
			<col class="col__writer" />
			<col class="col__views" />
		</colgroup>
		<thead>
			<!-- 검색창 -->
			<tr>
				<td colspan="5">
					<div style="display: inline;">
						<form action="list" method="post" name="searchform">
							<input type="hidden" name="pageNum" value="1" />
							<select	name="searchtype" id="" style="width: 100px;">
								<option value="">검색유형</option>
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
			</tr>
			<!-- 범례 -->
			<tr><th>번호</th><th>제목</th>
		</thead>
		<!-- Show notice List -->
		<tbody>
			<c:if test="${ listcount > 0 }">
				<c:set var="no" value="1"/>
				<c:forEach var="faq" items="${ faqlist }">
					<tr>
						<td>${ no }</td><c:set var="no" value="${ no + 1 }"/>
						<td><a href="detail?num=${ faq.num }">${ faq.title }</a></td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- end if (listcount > 0) // -->
			<!-- 게시물 없음 -->
			<c:if test="${ listcount == 0 }">
				<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
			</c:if>
		</tbody>
		<!-- 글쓰기 -->
		<tr>
			<td colspan="5" align="right"><a href="write">[글쓰기]</a></td>
		</tr>
	</table>
</body>
</html>