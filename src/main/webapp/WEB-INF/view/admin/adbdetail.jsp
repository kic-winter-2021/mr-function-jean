<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록광고 상세페이지</title>
<link rel="stylesheet" href="/resources/css/adbdetail.css">
<script>
	function del() {
		if(confirm("광고를 삭제하시겠습니까?")) {
			window.location.href = "delete?num=${param.num}"
		}
	}
</script>
</head>
<body>
	<!-- 작성자 : 박이삭 -->
	<!-- 작성날짜 : 21.12.15 -->
	<!-- 광고수정 타이틀 -->
	<div  class="form_box">	
		<h1>등록내용</h1>
		<!-- 본문 -->
		<div><div class="box"> 넘버 : ${ adBoard.num }</div></div>
		<div><div class="box"> 상품 : ${ adBoard.itemid }</div></div>
		<div><div class="field"> 내용 : ${ adBoard.content }</div></div>		
		
		<!-- 버튼 -->
		<c:url var="url" value="adbupdate">
		<c:param name="num" value="${adBoard.num}" /> </c:url>
		<a href="${url}" class="write_button">수정</a> 
		<input type="button" class="write_button" value="삭제" onclick="del()">
		<a href="adblist" class="write_button">목록</a>
	
	</div>
</body>
</html>
