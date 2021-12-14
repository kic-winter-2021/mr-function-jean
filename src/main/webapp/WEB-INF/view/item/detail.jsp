<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
    작성자: 정상준
    작성일: 2021-12-03
-->
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이템 상세보기: 제목</title>
<%-- <script src="../resources/js/detail.js" defer></script>--%>
<link rel="stylesheet" href="../resources/css/detail.css">
</head>
<body>
	<div class="container">
		<!-- 상품 클래스 -->
		<ul class="item_class">
			<li><a href="#">브랜드</a></li>
			<li>&#10095;</li>
			<li><a href="#">킬러</a></li>
		</ul>
		<!-- 상품 기본정보 및 구매 -->
		<div id="item_detail">
			<div id="img_slider">
				<ul class="slider" id="img_list">
					<li><img src="../resources/img/unnamed.jpg" alt="상품 준비중"></li>
				</ul>
			</div>
			<div class="like">
				<a href="#"> &#9825; &#9829; </a>
			</div>
			<form action="" id="purchaseForm" method="post">
				<table id="item_info">
					<caption>상품정보</caption>
					<tr><th>타이틀</th></tr>
					<tr><td>설명</td></tr>
					<tr><td>가격</td></tr>
					<tr><td>
							<!-- 옵션을 동적으로 추가 -->
						<select name="quantity" id="quantity">
								<option value="bk1">블랙 1개</option>
								<option value="bk2">블랙 2개</option>
								<option value="white1">화이트 1개</option>
						</select>
					</td></tr>
					<tr>
						<td>
							<button>장바구니</button><button>구매하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<%-- 이동 탭: 이후 고정해야함 --%>
		<div class="detail-tab">
			<ul class="tab__items">
				<li class="tab__item"><a href="#addinfo">상세정보</a></li>
				<li class="tab__item"><a href="#review">상품평</a></li>
				<li class="tab__item"><a href="#question">상품문의</a></li>
				<li class="tab__item"><a href="#transit">배송/교환 정보</a></li>
			</ul>
		</div>
		<!-- 추가 정보 -->
		<section id="addinfo">
			<jsp:include page="moreinfo.jsp" />
		</section>
		<!-- 상품평 -->
		<section id="review">
			<jsp:include page="review.jsp" />
		</section>
		<!-- 상품문의 -->
		<section id="question">
			<jsp:include page="question.jsp" />
		</section>
		<%-- 배송/교환정보 --%>
		<section id="transit">
			<jsp:include page="transit.jsp" />
		</section>
	</div>
	<!-- container -->
</body>
</html>