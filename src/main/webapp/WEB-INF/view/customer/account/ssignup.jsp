<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자용 회원가입 페이지</title>
<link rel="stylesheet" href="/resources/css/signup.css" />
</head>
<body>
<div id="signup-container">
	<header class="logoheader"><img src="/resources/img/logo-1.png"></header>
	<!-- 회원가입 타이틀 부분 -->
	<form:form modelAttribute="customer" action="ssignup" method="post" name="signupForm" class="signupform">
		<!-- error binding -->
		<spring:hasBindErrors name="customer">
			<c:forEach var="error" items="${ errors.globalErrors }">
				<span class="errmsg"><spring:message code="${ error.code }"/></span>
			</c:forEach>
		</spring:hasBindErrors>
		<table class="form-table">
			<tr>
				<th>아이디</th>
				<td>
					<form:input type="text" path="id" maxlength="30" placeholder="아이디 입력" />
					<button id="dupl-check" class="a-btn" onclick="duplCheck();">중복확인</button><br>&nbsp;
					<span class="errmsg"><form:errors path="id" /></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><form:input type="password" path="password" maxlength="30" placeholder="비밀번호 입력"/><br>&nbsp;
					<span class="errmsg"><form:errors path="password" /></span>
				</td>
			</tr>
			<tr>
				<th>확인</th>
				<td><input type="password" name="pwcheck" maxlength="30" placeholder="비밀번호 확인"/><br>&nbsp;
					<span class="errmsg" id="pwcheck"></span></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><form:input type="text"	path="name" maxlength="20" placeholder="이름 입력"/><br>&nbsp;
					<span class="errmsg"><form:errors path="name" /></span>
				</td>
			</tr>
			<tr><th colspan="2">사업자 정보</th></tr>
			<tr>
				<th>사업자 번호</th>
				<td><form:input type="text" path="companyno" maxlength="20" placeholder="사업자 번호 입력"/>
					<button id="company-check" class="a-btn" onclick="companyCheck();">번호 확인</button><br>&nbsp;
					<span class="errmsg"><form:errors path="companyno" /></span>
				</td>
			</tr>
			<tr>
				<th>상호명</th>
				<td><form:input type="text" path="nickname" maxlength="20" placeholder="상호명 입력"/><br>&nbsp;
					<span class="errmsg"><form:errors path="nickname" /></span>
				</td>
			</tr>
			<tr>
				<th>사업 유형</th>
				<td><form:radiobuttons path="type" items="${ sellertypes }"/><br>&nbsp;
					<span class="errmsg"><form:errors path="type" /></span>
				</td>
			</tr>
			<tr>
				<th>매장 위치</th>
				<td><form:input type="text" path="location" maxlength="20" placeholder="매장 주소 입력"/><br>&nbsp;
					<span class="errmsg"><form:errors path="location" /></span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><form:input type="text" path="phoneno" maxlength="15" placeholder="-포함 입력"/><br>&nbsp;
					<span class="errmsg"><form:errors path="phoneno" /></span>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><form:input type="email" path="email" placeholder="이메일 형식 입력"/><br>&nbsp;
					<span class="errmsg"><form:errors path="email" /></span>
				</td>
			</tr>
			<tr><th colspan="2">부가 정보</th></tr>
			<tr>
				<th>생년월일</th>
				<td><form:input type="date" path="birthday"/><br>&nbsp;
					<span class="errmsg"><form:errors path="birthday" /></span>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<form:select path="gender">
						<form:option value="0" label="선택" />
						<form:option value="1" label="남자" />
						<form:option value="2" label="여자" />
					</form:select><br>&nbsp;
					<span class="errmsg"><form:errors path="gender" /></span>
				</td>
			</tr>
		</table>
      <div class="btn-container">
	      <input type="submit" value="가입하기" class="signup">
	      <input type="reset" value="취소" class="signup">
      </div>
	</form:form>
	</div>
	<footer>
		<div class="coper" style="text-align:center">© Mr.function.</div>
	</footer>
</body>
<script>
	const duplCheck = () => {
		let id = $("#id").val();
		$.ajax("idduplcheck", {
			type: "POST",
			data: id;
			success: data => {
				if (data)
			},
			error: e => {
				
			}
		})
	}
</script>
</html>