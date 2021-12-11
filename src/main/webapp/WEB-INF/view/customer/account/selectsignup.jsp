<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택페이지</title>
<style>
#h {
	font-size: 50px;
	color: #0404B4;
	font: "맑은고딕";
	padding-top: 5%;
}

#personal {
	width: 250px;
	height: auto;
}

#company {
	width: 250px;
	height: auto;
}

.personalimg {
	text-align: center;
	margin-top: 300px;
	margin-left: 15%;
	position: absolute;
	top: 50%;
	height: 240px;
	margin-top: -200px;
	right: 53%;
}

.companyimg {
	text-align: center;
	margin-bottom: 600px;
	margin-right: 25%;
	position: absolute;
	top: 50%;
	height: 240px;
	margin-top: -200px;
	float: right;
	position: absolute;
	left: 53%;
}

#personalbtn {
	margin-top: 50px;
	text-align: center;
	width: 450px;
	height: 150px;
	box-shadow: 5px 5px 2.5px #01A9DB;
	font-size: 50px;
	background: #58D3F7;
	border: none;
	color: white;
	cursor: pointer;
}

#personalbtn:hover {
	background: #A9E2F3;
	box-shadow: none;
}

#companybtn {
	margin-top: 50px;
	text-align: center;
	width: 450px;
	height: 150px;
	box-shadow: 5px 5px 2.5px #0101DF;
	font-size: 50px;
	background: #5858FA;
	border: none;
	color: white;
	cursor: pointer;
}

#companybtn:hover {
	background: #A9A9F5;
	box-shadow: none;
}
</style>
</head>
<body>
	<header>
		<h1 id="h">
			<center>회원가입을 환영합니다.</center>
		</h1>
	</header>
	<div class="personalimg">
	<h3>자신만의 맞는 바지를 <br>찾아보세요!</h3>
	<a href="agree?type=p">
		<img src="/img/personal.png" id="personal"><br>
		<span id="personalbtn">개인회원</span>
	</a>
	</div>
	<div class="companyimg">
	<h3>상품을 등록하고<br>이윤을 남겨보세요!</h3>
		<a href ="agree?type=c">
			<img src="/img/company.png" id="company"><br>
			<span id="companybtn">사업자</span>
		</a>
	</div>
</body>
</html>