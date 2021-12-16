<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/account.css" >
<style>	.errmsg { color: red; } </style>
</head>
<body>
	<main id="main-container">
		<div id="search-tabs" class="twintabs">
			<button id="tab1" class="tab active">아이디 찾기</button>
			<button id="tab2" class="tab">비밀번호 찾기</button>
		</div>
		<section class="twinform-container">
			<div class="" id="error-continer">
				<spring:hasBindErrors name="customer">
					<span class="err">
						<c:forEach var="error" items="${ errors.globalErrors }">
							<spring:message code="${ error.code }" />
						</c:forEach>
					</span>
				</spring:hasBindErrors>
			</div>
			<div id="content1">
				<form:form modelAttribute="customer" action="idsearch" method="post" name="idsearchForm">
					<table>
						<tr>
							<th>이메일</th>
							<td><form:input type="text" path="email" class="inputbox"/>
								<span class="errmsg"><form:errors path="email" /></span>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><form:input type="text" path="phoneno" class="inputbox"/>
								<span class="errmsg"><form:errors path="phoneno" /></span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="아이디찾기"></td>
						</tr>
					</table>
				</form:form>
			</div>
			<div id="content2" class="hidden">
				<form:form modelAttribute="customer" action="pwsearch" method="post" name="pwsearchForm">
					
					<table>
						<tr>
							<th>아이디</th>
							<td><form:input type="text" path="id" class="inputbox"/>
								<span class="errmsg"><form:errors path="id" /></span>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><form:input type="text" path="email" class="inputbox"/>
								<span class="errmsg"><form:errors path="email" /></span>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><form:input type="text" path="phoneno" class="inputbox"/>
								<span class="errmsg"><form:errors path="phoneno" /></span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="비밀번호찾기"></td>
						</tr>
					</table>
				</form:form>
			</div>
		</section>
	</main>
</body>
<script>
	const tab1 = document.getElementById("tab1");
	const tab2 = document.getElementById("tab2");
	const content1 = document.getElementById("content1");
	const content2 = document.getElementById("content2");
	const select1 = () => {
		tab1.classList.add("active");
		content1.classList.remove("hidden");
		tab2.classList.remove("active");
		content2.classList.add("hidden");
	}
	const select2 = () => {
		tab2.classList.add("active");
		content2.classList.remove("hidden");
		tab1.classList.remove("active");
		content1.classList.add("hidden");
	}
	tab1.addEventListener('click', select1);
	tab2.addEventListener('click', select2);
	if ('${url}'=='pw' || '${param.u}' == 'pw') select2();
</script>
</html>