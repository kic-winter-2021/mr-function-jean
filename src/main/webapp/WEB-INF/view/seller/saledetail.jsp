<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록상품 상세보기.</title>
<link rel="stylesheet" href="../resources/css/detail.css">
<script>
function del() {
		
		if(confirm("게시글 삭제하시겠습니까?")) {
		window.location.href = "delete?itemid=${param.itemid}"
		}
		//확인 -> 삭제 취소-> 가만히
		
		}
</script>
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성일자 : 21.12.06 -->
	<!-- 수정일자 : 21.12.12 : 양식수정-->
	<!-- 수정일자 : 21.12.14 : 삭제추가-->

	<div  class="form_box">
	<table>
		<caption>
			등록내용
		</caption>
		<!-- 본문 -->
		<tr><td class="box"> 판매자 : ${ item.sellerid }</td></tr>
		<tr><td class="box"> 상품명 : ${ item.title }</td></tr>
		<tr><td class="box"> Fit : ${ item.fit }</td></tr>
		<tr><td class="box"> Color : ${ item.color }</td></tr>
		<tr><td class="box"> 가격 : ${ item.price }</td></tr>
		<tr><td class="box"> 브랜드 : ${ item.brandname }</td></tr>
		<tr><td class="box"> 브랜드코드 : ${ item.brandcode }</td></tr>
		<tr><td class="field"> 내용 :${ item.content }</td></tr>
		
		<!-- 버튼 -->
		<c:url var="url" value="detailupdate">
		<c:param name="itemid" value="${item.itemid}" /> </c:url>
		<tr><td><a href="${url}" class="write_button">수정</a> 
		<input type="button" class="write_button" value="삭제" onclick="del()"></td></tr>
		<tr><td><a href="registl?id=admin" class="write_button">목록</a></td></tr>
	</table>
	</div>
</body>
</html>