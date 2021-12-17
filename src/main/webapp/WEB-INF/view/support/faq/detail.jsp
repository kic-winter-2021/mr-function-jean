<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 상세보기</title>
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
	<!-- 작성자 : 오근영 -->
	<!-- 작성날짜 : 21.12.17 -->
	<!-- 문의글 타이틀 -->
	<div class="form_box">
		<h1>문의글 상세보기</h1>
		<form:form modelAttribute="detail" action="detail" name="faqdetail" method="post">
			<!--  유효성 검사 -->
			<spring:hasBindErrors name="board">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<span class="errmsg"><spring:message code="${ error.code }"/></span>
				</c:forEach>
			</spring:hasBindErrors>
		<!--  히든값 처리 -->
		<input type="hidden" name="type" value="1">
		<input type="hidden" name="customerid" value="admin">
		<!-- 문의글 내용 -->
		문의유형 : ${board.category }<br>
		제목 : ${board.title }<br>
		내용 : ${board.content}<br>
		<!-- 문의글 하단 버튼 -->
		<a href="update?num=${board.num }" class="write_button">수정</a>
		<a href="list" class="write_button">취소</a>
		<a href="javascript:del()" class="write_button">삭제</a>
		</form:form>
	</div>
</body>
</html>
