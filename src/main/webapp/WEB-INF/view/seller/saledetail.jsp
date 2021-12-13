<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록상품 상세보기.</title>
<link rel="stylesheet" href="../resources/css/detail.css">
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성일자 : 21.12.06 -->
	<!-- 수정일자 : 21.12.12 : 양식수정-->
	<!-- <nav>
		<img src="j3.jpg">
	</nav> -->
	<!-- 등록내용을 오른쪽으로 옮기는 추가작업 필요 -->
	<div  class="form_box">
	<table>
		<center>
			<h3>등록내용</h3>
		</center>
		<!-- 본문 -->
		<tr><td class="box"> 판매자 : ${ item.sellerid }</td></tr><br>
		<tr><td class="box"> 상품명 : ${ item.title }</td></tr><br> 
		<tr><td class="box"> Fit : ${ item.fit }</td></tr><br>
		<tr><td class="box"> Color : ${ item.color }</td></tr><br>
		<tr><td class="box"> 가격 : ${ item.price }</td></tr><br>
		<tr><td class="box"> 브랜드 : ${ item.brandname }</td></tr><br>
		<tr><td class="box"> 브랜드코드 : ${ item.brandcode }</td></tr><br>
		<tr><td class="field"> 내용 :${ item.content }</td></tr><br>
		<!-- 올린날짜 : <input class="box" type="date"
			placeholder="날짜가 나타나는 창입니다."><br> 
		판매자 전화번호 : <input
			class="box" type="tel" placeholder="전화번호가 나타나는창 입니다."><br>
		판매자 이메일 : <input class="box" type="email"
			placeholder="이메일이 나타나는 창입니다."><br>
		 -->
		<!-- 버튼 -->
		<tr><td><a href="detailupdate?itemid=${item.itemid}" class="write_button">수정</a></td></tr> 
		<input class="write_button" type="submit" value="삭제"></td></tr>
		<tr><td><a href="registl?id=admin" class="write_button"/>목록</a></td></tr>
	</table>
	</div>
</body>
</html>