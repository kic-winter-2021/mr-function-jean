<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<!-- 작성자 : 박이삭
	 작성일자 : 2021-12-02
 -->
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/userMyPage.css">
<title>회원마이페이지</title>
</head>
<body>
<div class="wrap">
  <div class="shippingStatusContainer">
    <div class="title">
      주문/배송조회
    </div>
    <div class="status">
      
      <div class="item">
        <div>
          <div class="green number">${cartcount}</div>
          <div class="text">장바구니<br>담긴갯수</div>
        </div>
        <div class="icon"> > </div>
      </div>     
      <div class="item">
        <div>
          <div class="number">${salecount}</div>
          <div class="text">결제완료</div>
        </div>
        <div class="icon"> > </div>
      </div> 
    </div>
    
  </div>  
  <div class="listContainer">
    <a href="/sale/buyInfo" class="item">
        <div class="icon"><img src="/resources/img/mustache.png" width="20px" height="20px"></div>
        <div class="text">주문목록<span class="circle"></span></div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon"><img src="/resources/img/mustache.png" width="20px" height="20px"></div>
        <div class="text">상품후기<span class="circle"></span></div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon"><img src="/resources/img/mustache.png" width="20px" height="20px"></div>
        <div class="text">상품문의<span class="circle"></span></div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon"><img src="/resources/img/mustache.png" width="20px" height="20px"></div>
        <div class="text">최근 본 상품<span class="circle"></span></div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon"><img src="/resources/img/mustache.png" width="20px" height="20px"></div>
        <div class="text">찜한상품<span class="circle"></span></div>
        <div class="right"> > </div>
    </a>
  </div>
   
  <div class="listContainer">
    <a href="coupon.jsp" target="_blank" class="item">
        <div class="icon"><img src="/resources/img/mustache.png" width="20px" height="20px"></div>
        <div class="text">
          <span>쿠폰함</span>
          <span class="smallLight">
          </span>          
        </div>                
        <div class="right"> > </div>
    </a>
    <a href="editinfo?id=${sessionScope.signinCustomer.id }" class="item">
        <div class="icon"><img src="/resources/img/mustache.png" width="20px" height="20px"></div>
        <div class="text">내정보 관리/수정</div>
        <div class="right"> > </div>
    </a>
    <%--배송조회는 운송장번호만 받아서 사이트링크로 이동후 각택배사별 조회 --%>
    <a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EB%B0%B0%EC%86%A1%EC%A1%B0%ED%9A%8C" class="item">
        <div class="icon"><img src="/resources/img/mustache.png" width="20px" height="20px"></div>
        <div class="text">택배사 배송조회</div>
        <div class="right"> > </div>
    </a>   
  </div>
</div>
</body>
</html>