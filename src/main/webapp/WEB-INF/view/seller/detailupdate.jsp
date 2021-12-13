<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록상품 수정하기</title>
<link rel="stylesheet" href="../resources/css/detail.css">
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성일자 : 21.12.13 -->
	<!-- 수정일자 : -->
	<div  class="form_box">
	<table>
		<caption> 등록내용 수정 </caption>
		<!-- 본문 -->
		<form:form modelAttribute="item" action="post">
		<tr><td class="box">판매자 : ${ item.sellerid }</td></tr><br>
		<tr><td class="box"> 상품명 : <form:input type="text" value = "${ item.title }" path="title" /></td></tr><br> 
		<tr><td class="box"> Fit : 
			<form:select path="fit" id="fit">
				<form:option value="${ item.fit }" label="${ item.fit }" />
				<form:option value="와이드핏" label="와이드핏" />
				<form:option value="슬림핏" label="슬림핏" />
				<form:option value="레귤러" label="레귤러" />
				<form:option value="기타" label="기타" />
			</form:select></td></tr><br>
		<tr><td class="box"> Color : 
			<form:select path="color" id="color">
				<form:option value="${item.color}" label="${item.color}" />
				<form:option value="중청" label="중청" />
				<form:option value="연청" label="연청" />
				<form:option value="진청" label="진청" />
				<form:option value="흑청" label="흑청" />
				<form:option value="4" label="기타" />
			</form:select></td></tr><br>
		<tr><td class="box"> 가격 : <form:input type="number" value= "${ item.price }" path="price"/></td></tr><br>
		<tr><td class="box"> 브랜드 : <form:input type="text" value= "${ item.brandname }" path="brandname"/></td></tr><br>
		<tr><td class="box"> 브랜드코드 :<form:input type="number" value= "${ item.brandcode }" path="brandcode" /></td></tr><br>
		<tr><td class="field"> 내용 <form:input type="text" value= "${ item.content }" path="content"/></td></tr><br>
		
		<!-- 버튼 -->
		<tr><td><input class="write_button" type="submit" value="확인">
		<a href="saledetail?itemid=admin" class="write_button">취소</a></td></tr> 
		</form:form>
	</table>
	</div>
</body>
</html>