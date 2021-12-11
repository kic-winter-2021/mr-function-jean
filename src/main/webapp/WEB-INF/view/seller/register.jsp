<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록 페이지</title>
<link rel="stylesheet" href="resources/css/box.css">
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성일자 : 21.12.05 09:36pm -->
	<!-- 수정일자 : 21.12.11 Form:form양식 수정 -->	
	<!-- 게시글 타이틀 -->
	<div class="form_box">
		<h1>게시글을 등록해주세요</h1>

		<!-- 게시글 내용 -->
		<form:form modelAttribute="regist" action="register" method="post" >
		작성자 : <form:input class="box" type="text" placeholder="닉네임을 입력해주세요" name="id" path="id" /><br>
		카테고리 :
		
			<form:select path="type" id="category">
				<form:option value="none" label="선택하세요" />
				<form:option value="0" label="와이드핏" />
				<form:option value="1" label="슬림핏" />
				<form:option value="2" label="레귤러" />
				<form:option value="3" label="데님" />
				<form:option value="4" label="기타" />
			</form:select>
		
		가격 : <form:input class="box" type="number" placeholder="가격을 입력해주세요" name="price" path="price" /><br>
		제목 : <form:input class="box" type="text" placeholder="제목을 입력해주세요" name="title" path="title" /><br>
		내용 : <br>
		<form:textarea class="field" placeholder="내용을 입력해주세요" name="content" path="content" />
		<br> 판매자 휴대전화 : <form:input class="box" type="number"
			placeholder="전화번호를 입력해주세요" name="phoneno" path="phoneno" />
		<br> 판매자 이메일 : <form:input class="box" type="email" placeholder="이메일을 입력해주세요" name="email" path="email" /><br>
		첨부파일 : <form:input class="file" type="file" name="file" path="file" /><br>
		<br>
		</form:form>
		<!-- 문의글 하단 버튼 -->
		<button class="write_button">등록</button>
		<button class="write_button">취소</button>
	</div>
</body>
</html>
