<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지.</title>
<style>
	.menulist { display:flex; flex-direction: column; }
	.menulist li { list-style: none; padding-left: 0; width: 200px; height: 30px; margin-bottom: 4px; }
	.menulist a { all:unset; cursor: pointer; display: block; width: inherit; padding: 3px; background-color: #eee; border-radius: 4px;}
	.menulist a:hover { background-color: #f3f3f3; border-bottom: 1px solid #ddd; box-shodow: 1px 1px 1px #eee;}	
</style>
</head>
<body>
	<ul class="menulist">
		<li><a href="user">회원 관리</a></li>
		<li><a href="postlist">요청받은 프로모션</a></li>
		<li><a href="adblist">등록된 프로모션</a></li>
		<li><a href="stats">매출 통계표</a></li>
		<li><a href="/support/faq/list">고객센터</a></li>
	</ul>
</body>
</html>