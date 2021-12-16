<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<c:set var="id" value="${sessionScope.signinCustomer.id}"/>
<!DOCTYPE html>
<!-- 작성자 : 박이삭
	 작성일자 : 2021-12-02
	 
	 1차 수정 : 정상준
	 작성일: 2021-12-15
 -->
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/mypage.css">
<title>회원마이페이지</title>
</head>
<body>
<div class="wrap">
  <header class="shippingStatusContainer">
    <h3 class="title">주문/배송조회</h3>
    <div class="status">
      <div class="item">
        <div>
          <div class="green number">${cartcount}</div>
          <div class="text">장바구니<br>담긴갯수</div>
        </div>
        <div class="icon"> 〉 </div>
      </div>     
      <div class="item">
        <div>
          <div class="number">${salecount}</div>
          <div class="text">결제완료</div>
        </div>
        <div class="icon"> 〉 </div>
      </div> 
    </div>
  </header>
  <div class="mypage-menubar"><%@ include file="menubar.jspf" %></div>
  <main><div></div></main>
  <div class="sidebar"></div>
</div>
</body>
</html>