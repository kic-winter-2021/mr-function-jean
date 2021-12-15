<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
<link rel="stylesheet" href="/css/userlist.css">
<script type="text/javascript">
function allchkbox(allchk) {
	   $(".idchks").prop("checked",allchk.checked)
</script>

</head>
<body>
<div class="user">
	<table>
		<tr><td colspan="12">회원목록</td></tr>
		<tr><th>아이디<a href="user?sort=0" class="noline"></a></th><th>비밀번호</th><th>이름</th><th>닉네임</th><th>전화번호</th><th>이메일</th><th>성별</th><th>생년월일</th><th>사업자번호</th><th>카테고리</th><th>&nbsp;</th><td><input type="checkbox" name="idchks" class="idchks" value="${customer.id}"></td></tr>
		<c:forEach items="${userlist}" var="customer">
		<tr><td>${customer.id}</td><td>${customer.password}</td><td>${customer.name}</td><td>${customer.nickname}</td><td>${customer.phoneno}</td><td>${customer.email}</td>
		<td>${customer.gender}</td><td>${customer.birthday}</td><td>${customer.companyno}</td><td>${customer.type}</td><td><a href="userupdate?id=${customer.id}">수정</a> <a href="">강제탈퇴</a> <a href="">회원정보</a></td>
		<td><input type="checkbox" name="idchks" class="idchks" value="${customer.id}"></td></tr>
		</c:forEach>
		<!-- 채팅기능? -->
	</table>
</div>
</body>
</html>