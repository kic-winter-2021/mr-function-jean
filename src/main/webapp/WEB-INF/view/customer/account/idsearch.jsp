<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href="/resources/css/agree.css" rel="stylesheet">
</head>
<body>
	<form:form modelAttribute="customer" action="idsearch" method="post">
		<header>
			<button class="Id">아이디</button>
			<button class="Password">비밀번호</button>
		</header>
		<table>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"> <font color="red"><form:errors
							path="email" /></font></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="아이디찾기"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>