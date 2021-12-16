<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
</head>
<body>
	<div id="manage-container">
		<!-- GRID -->
		<section id="managecount">
			<!-- 등록한 상품 수 -->
			<div id="cnt__registered">
				<table>
					<colgroup>
						<col class="cnt__key"/>
						<col class="cnt__value"/>
						<col class="cnt__link"/>
					</colgroup>
					<tr>
						<th>등록한 상품</th>
						<td>${ itemcount }</td>
						<td><a href="register">등록하러가기</a></td>
					</tr>
					<tr>
						<th>매진 상품</th>
						<%-- sold out --%>
						<td></td>
						<td><a href="">재입고하기</a></td>
					</tr>
					<tr>
						<th>재고 소진 예정</th>
						<td></td>
						<td></td>
					</tr>
				</table> 
			</div>
			<!-- 요청 기록-->
			<div id="cnt__question">
				<table>
					<colgroup>
						<col class="cnt__key"/>
						<col class="cnt__value"/>
						<col class="cnt__link"/>
					</colgroup>
					<tr>
						<th>재입고 요청</th>
						<%-- 추가 기능. 고객이 매진된 상품에 대해 재입고 요청을 했을시 --%>
						<td></td>
						<td><a href="">재입고하기</a></td>
					</tr>
					<tr>
						<th>상품 문의</th>
						<%-- 판매자의 등록 상품리스트 + 문의 보드의 추가 뷰를 생성 --%>
						<td></td>
						<td><a href="">답변하러 가기</a></td>
					</tr>
				</table>
			</div>
			<!-- 판매 기록 -->
			<div id="cnt__sold">
				<table>
					<colgroup>
						<col class="cnt__key"/>
						<col class="cnt__value"/>
						<col class="cnt__link"/>
					</colgroup>
					<tr>
						<th>구매 요청</th>
						<%-- 운송장 등록이 필요한 상품 --%>
						<td></td>
						<td></td>
					
					<tr>
						<th>배송 중</th>
						<%-- 운송장이 등록되어있는 상품 --%>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>배송 완료</th>
						<%-- 배송이 완료된 상품: 주기적 갱신 --%>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</section>
		<section>
			<div> 배송/교환정보 수정</div>
		</section>
	</div>
</body>
</html>