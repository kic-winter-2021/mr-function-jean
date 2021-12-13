<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!-- 작성자 박이삭 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<%-- oinfo : 주문 정보 출력 --%>   
<div id="oinfo" class="info" >
  <table>
    <tr><th>주문번호</th><th>주문일자</th><th>총주문금액</th></tr>
    <c:forEach items="${salelist}" var="sale" varStatus="stat">     
     <tr id="saleLine" class="saleLine">
       <td colspan="3" align="center">
       <table>
         <tr><th width="25%">상품명</th><th width="25%">상품가격</th>
        <th width="25%">구매수량</th><th width="25%">상품총액</th></tr>
         <c:forEach items="${salelist}" var="sale">
           <tr><td class="title">
                ${sale.saleid}</td>
               <td><fmt:formatNumber value="${sale.saledate}" 
                  pattern="#,###"/>원</td>
               <td>${sale.invoice}개</td>
         <td>
 <fmt:formatNumber value="${saleI.receiver}"/>원</td></tr>
         </c:forEach>    
       </table></td></tr></c:forEach></table></div>
</body>
</html>