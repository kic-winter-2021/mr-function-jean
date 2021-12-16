<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}찾기</title>
<link rel="stylesheet" href="/css/account.css" />
<script>
function hidestr(s, n) {
	if (n<0) return s.slice(0, n) + '*'.repeat(-n);
	else if (n>0) return '*'.repeat(n) + s.slice(n);
	else return s;
}
function sendclose() {
	opener.document.psigninForm.id.value='${result}';
	opener.document.ssigninForm.id.value='${result}';
	self.close();
}
</script>
</head>
<body>
	<section id="found">
		<table>
			<tr>
				<th>${ title }찾기</th>
				<!--  <td><script>document.write(hidestr("${ result }", 3));</script></td> -->
				<td>${ result }</td>	
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${ title=='아이디' }">
						<input class="a-btn" type="button" value="아이디전송" onclick="sendclose()"/>
						<input class="a-btn" type="button" value="비밀번호찾기" onclick="location.replace('/customer/account/search?u=pw')"/>
					</c:if>
					<c:if test="${ title!='아이디' }">
						<input class="a-btn" type="button" value="닫기" onclick="self.close()" />
					</c:if>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>