<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<link rel="stylesheet" href="/resources/css/qlist.css">
</head>
<body>
	<section class="board-container">
		<div class="board-header">
			<h2>자주 묻는 질문  FAQ</h2>
			<c:if test="${sessionScope.signinUser.type == 1}"><a href="write" class="btn-write">글쓰기</a></c:if>
		</div>
		<article>
			<c:forEach var="faq" items="${ faqlist }">
				<details>
					<summary><span class="faq_category">[${faq.category}]</span>&nbsp;${ faq.title }</summary>
					<p>${faq.content}</p>
				</details>
			</c:forEach>
		</article>
	</section>
</body>
</html>