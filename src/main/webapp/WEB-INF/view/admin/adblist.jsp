<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/jspheader.jsp" %>
      <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>등록광고리스트</title>
            <link rel="stylesheet" href="/resources/css/adboard.css" />
            <!-- 작성자 : 박이삭 -->
            <!-- 작성날짜 : 21.12.15 -->
        </head>

        <body>
            <table class="tb_adblist">
                <h4 align="center">등록광고<span>수: ${ listcount }</span></h4>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>상품</th>
                        <th>내용</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <!-- Show adboard List -->
                <tbody>
                    <c:if test="${ listcount > 0 }">
                        <c:forEach var="adb" items="${ adblist }">
                            <tr>
                                <td>${ adb.num }</td>
                                <c:set var="num" value="${ adb.num + 1 }" />
                                <td><a href="adbdetail?num=${ adb.num }">${ adb.itemid }</a></td>
                                <td>${ adb.content }</td>
                                <td>${ adb.views }</td>
                            </tr>
                        </c:forEach>
                        <!--  paging -->
                        <tr class="adblist_paging">
                            <td colspan="5">
                                <c:if test="${ pageNum > 1 }">
                                    <!--  <a href="list?pageNum=${ pageNum - 1 }">[이전]</a> -->
                                    <a href="javascript:listpage(${ pageNum - 1 })">[이전]</a>
                                </c:if>
                                <c:if test="${pageNum <= 1 }">[이전]</c:if>
                                <c:forEach var="a" begin="${ startpage }" end="${ endpage }">
                                    <c:if test="${ a == pageNum }">[${ a }]</c:if>
                                    <c:if test="${ a != pageNum }">
                                        <!--  <a href="list?pageNum=${ a }">${ a }</a> -->
                                        <a href="javascript:listpage(${ a })">${ a }</a>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${ pageNum < maxpage }">
                                    <!--  <a href="list?pageNum=${ pageNum +1 }">[다음]</a> -->
                                    <a href="javascript:listpage(${ pageNum +1 })">[다음]</a>
                                </c:if>
                                <c:if test="${ pageNum >= maxpage }">[다음]</c:if>
                            </td>
                        </tr>
                    </c:if>
                    <!-- end if (listcount > 0) // -->
                    <!-- 게시물 없음 -->
                    <c:if test="${ listcount == 0 }">
                        <tr>
                            <td colspan="5">등록한 광고가 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
                <!-- 글쓰기 -->
                <tr>
                    <td class="btn" colspan="5" align="right"><a href="adbwrite">[광고등록]</a></td>
                </tr>
            </table>
        </body>

        </html>

     