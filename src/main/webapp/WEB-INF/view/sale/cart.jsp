<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp"%>
<!-- 작성자 : 박이삭
	 작성일자 : 2021-12-6
	 -->
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="/resources/css/cart.css">
<script>
	function updateAll() {
		var n1 = document.getElementById("jean1").value;
		var n2 = document.getElementById("jean2").value;
		var n3 = document.getElementById("jean3").value;

		var p1 = 25000 * n1;
		var p2 = 27000 * n2;
		var p3 = 25000 * n3;

		document.getElementById("jean1Total").value = p1
		document.getElementById("jean2Total").value = p2
		document.getElementById("jean3Total").value = p3

		var shipping = 2500 + 3000 + 2500;
		document.getElementById("shipping").value = shipping;

		var totalNumber = parseInt(n1) + parseInt(n2) + parseInt(n3);
		document.getElementById("totalNumber").value = totalNumber;

		var totalPrice = p1 + p2 + p3 + shipping;
		document.getElementById("totalPrice").value = totalPrice;

	}
</script>
</head>

<body>
	<table class="tab">
		<caption></caption>
		<thead>
			<tr>
				<td colspan="5"><c:if test="${ sessionScope.signin == null }">
						<!-- 비회원 -->
          			비회원 장바구니<br>
						<a href="/customer/account/signin">로그인하러 가기</a>
					</c:if></td>
			</tr>
			<tr>
				<th>제품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="total" value="0" />
			<c:forEach var="itemset" items="${cart.items }"> <%-- items는 List<ItemSet> --%>
				<c:set var="item" value="${ itemset.item }" />
				<tr>
					<th>${ item.title }</th>
					<td>${ item.price }원</td>
					<td>${ itemset.quantity }개</td>
					<td><span class="price">${ item.price * itemset.quantity }</span></td>
					<c:set var="total" value="${ total + item.price * itemset.quantity}" />
				</tr>
			</c:forEach>
			<tr>
				<th colspan="3">합계</th>
				<td>${ total }원</td>
			</tr>
		</tbody>
	</table>
	<%-- JS로 체크박스에 따라 합계 계산 --%>
	<div class="btn-container">
		<a href="">구매하기</a>
	</div>
</body>

</html>