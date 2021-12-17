<%-- /WEB-INF/view/exception/signout.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<script>
	if ("${exception.message}"!=null && "${exception.message}"!="") {
		alert("${exception.message}\n올바른 접근을 위해 로그아웃합니다.")
	}
	else alert("올바른 접근을 위해 로그아웃합니다.");
	// sessionStorage.clear(); // 모든 데이터 삭제
	location.href="${exception.url}";
</script>