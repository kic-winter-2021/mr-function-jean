<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 목록</title>
</head>
<body>
	<!-- 검색 폼 영역 -->
	<form name = "searchForm" action =" " method ="get">
	<p>
	<select name ="searchType">
		<option value ="All">전체검색</option>
		<option value ="cname">사업자명</option>
		<option value ="rank">등급</option>
	</select>
	<input type = "text" name="searchText" value=""/>
	<input type = "submit" value="검색"/>
	</form>
	<!-- 게시판 목록  -->
	<table border ="1" summary ="광고 목록">
		<caption>광고 목록</caption>
		<colgroup>
		<col class="col__num" />
			<col class="col__title" />
			<col class="col__writer" />
			<col class="col__regDate" />
			<col class="col__views" />
		</colgroup>
		<thead>
		<tr>
			<th>번호</th>
			<th>사업자명(아이디)</th>
			<th>홍보등급</th>
			<th>계약정보</th>
			<th></th>
		</tr>
	</table>
</body>
</html>