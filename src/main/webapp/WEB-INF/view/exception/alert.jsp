<%-- /WEB-INF/view/exception/alert.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<script>
	if ("${exception.message}"!=null && "${exception.message}"!="") {
		alert("${exception.message}")
	}
	location.href="${exception.url}"
</script>