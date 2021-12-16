<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록상품 상세보기.</title>
<link rel="stylesheet" href="detail.css">
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성일자 : 21.12.06 -->
	<nav>
		<img src="j3.jpg">
	</nav>
	<!-- 등록내용을 오른쪽으로 옮기는 추가작업 필요 -->
	<section class="form">
		<center>
			<h3>등록내용</h3>
		</center>
		<!-- 본문 -->
		제목 : <input class="box" type="text" placeholder="제목이 나타나는 창입니다"><br>
		카테고리 : <select class="box">
			<option>**********</option>
			<option>**********</option>
			<option>**********</option>
			<option>**********</option>
			<option>**********</option>
		</select><br> 올린날짜 : <input class="box" type="date"
			placeholder="날짜가 나타나는 창입니다."><br> 판매자 전화번호 : <input
			class="box" type="tel" placeholder="전화번호가 나타나는창 입니다."><br>
		판매자 이메일 : <input class="box" type="email"
			placeholder="이메일이 나타나는 창입니다."><br>

		<!-- 버튼 -->
		<input type="submit" value="수정"> <input type="submit"
			value="삭제">
	</section>
</body>
=======
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
>>>>>>> refs/remotes/origin/detail
</html>