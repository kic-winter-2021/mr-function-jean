<%-- /WEB-INF/view/exception/signout.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<script>
	if(confirm("${exception.message}" + "\n로그아웃하시겠습니까?")) {
		sessionStorage.clear(); // 모든 데이터 삭제
	}
	if ("${exception.url}"!=null && "${exception.url}"!="") {
		location.href="${exception.url}";
	}
	history.go();
</script>