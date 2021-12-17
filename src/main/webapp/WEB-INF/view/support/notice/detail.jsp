<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정하기</title>
<link rel="stylesheet" href="/resources/css/box.css">
<script type="text/javascript">
function del() {
		if(confirm("게시글 삭제하시겠습니까?")) {
		window.location.href = "delete?num=${param.num}"
		}
		//확인 -> 삭제 취소-> 가만히
		
		}
</script>
<style> .errmsg{ color: red; }</style>
</head>
<body>
	<!-- 좌측 부분 레이아웃 -->
	<div class="form_box">
		<form:form modelAttribute="detail" action="detail" name="noticeForm">
			<h3>공지사항</h3>
			<spring:hasBindErrors name="board">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<span class="errmsg"><spring:message code="${ error.code }"/></span>
				</c:forEach>
			</spring:hasBindErrors>
			<input type="hidden" name="customerid" value="${sessionScope.signinUser.id }">
			<input type="hidden" name="type" value="2"><!-- 공지사항 -->
			제목 : ${board.title } <br>
			카테고리 : ${board.category } <br>
			내용 : ${board.content }<br>
			<!-- 하단 버튼 -->
			<a href="update?num=${board.num }" class="write_button">수정</a>
			<a href="list" class="write_button">취소</a>
			<a href="javascript:del()" class="write_button">삭제</a>
		</form:form>
	</div>

</body>
</html>