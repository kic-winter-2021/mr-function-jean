<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="/resources/css/box.css">
</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성일자 : 21.12.05 09:36pm -->
	<!-- 수정일자 : 21.12.11 Form:form양식 수정 -->	
	<!-- 게시글 타이틀 -->
	<div class="form_box">
		<h1>게시글을 등록해주세요</h1>

		<!-- 게시글 내용 -->
		<form:form modelAttribute="item" action="register" method="post" >
		<!--  itemid generator, 한글 입력시 인코딩 필요(UrlEncoder) -->
		상품아이디(나중 삭제) : <form:input class="box" type="text" path="itemid" /><br>
		<!--  판매자 변경하기 지금 admin, sessionScope -->
		판매자 : <form:input class="box" type="hidden" value="admin" path="sellerid" /><br>
		상품명 : <form:input class="box" type="text" placeholder="상품명을 입력해주세요" path="title" /><br>
		
		FIT :
		
			<form:select path="fit" id="fit">
				<form:option value="none" label="선택하세요" />
				<form:option value="와이드핏" label="와이드핏" />
				<form:option value="슬림핏" label="슬림핏" />
				<form:option value="레귤러" label="레귤러" />
				<form:option value="기타" label="기타" />
			</form:select>
			
		Color :
		
			<form:select path="color" id="color">
				<form:option value="none" label="선택하세요" />
				<form:option value="중청" label="중청" />
				<form:option value="연청" label="연청" />
				<form:option value="진청" label="진청" />
				<form:option value="흑청" label="흑청" />
				<form:option value="4" label="기타" />
			</form:select><br>
			
		가격 : <form:input class="box" type="number" placeholder="가격을 입력해주세요" name="price" path="price" /><br>
		브랜드 : <form:input class="box" type="text" placeholder="브랜드를 입력해주세요" path="brandname" /><br>
		브랜드코드 : <form:input class="box" type="number" placeholder="브랜드 코드를 입력해주세요" path="brandcode" value="1" /><br>
		내용 : <br>
		<form:textarea class="field" placeholder="내용을 입력해주세요" name="content" path="content" />
		<%-- <br> 판매자 휴대전화 : <form:input class="box" type="number"
			placeholder="전화번호를 입력해주세요" name="phoneno" path="phoneno" />
		<br> 판매자 이메일 : <form:input class="box" type="email" placeholder="이메일을 입력해주세요" name="email" path="email" /><br>
		
		첨부파일 : <form:input class="file" type="file" name="file" path="file" /><br>
		--%><br> 
		<!-- 문의글 하단 버튼 -->
		<input type="submit" class="write_button" value="등록" />
		<input type="reset" class="write_button" value="취소"  />
		
		</form:form><br>
		<a href="registl?id=admin" class="write_button">목록</a>
		<!-- ${sessionScope.signinSeller.id } 로그인 -->
	</div>
</body>
</html>