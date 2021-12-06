<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <script src="resources/js/userCart3.js"></script>
    <link rel="stylesheet" href="resources/css/userCart3.css">
</head>

<body>
    <form action="#">
        <table class="tab">
            <thead>
                <tr>
                    <th>제품명</th>
                    <th>단가</th>
                    <th>배송비</th>
                    <th>수량</th>
                    <th>금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>디젤진</th>
                    <td>50,000</td>
                    <td>2500</td>
                    <td><input id="jean1" type="number" value="0" onclick="this.select()"></td>
                    <td><input id="jean1Total" type="text" value="0">원</td>
                </tr>
                <tr>
                    <th>뱅뱅진</th>
                    <td>30,000</td>
                    <td>3000</td>
                    <td><input id="jean2" type="number" value="0" onclick="this.select()"></td>
                    <td><input id="jean2Total" type="text" value="0">원</td>
                </tr>
                <tr>
                    <th>리바이스진</th>
                    <td>40,000</td>
                    <td>2500</td>
                    <td><input id="jean3" type="number" value="0" onclick="this.select()"></td>
                    <td><input id="jean3Total" type="text" value="0">원</td>
                </tr>
                <tr>
                    <th colspan="2">합계</th>
                    <td><input type="text" id="shipping" size="2"></td>
                    <td><input type="text" id="totalNumber"></td>
                    <td><input type="text" id="totalPrice">원</td>
                </tr>
            </tbody>
        </table>
        <input type="button" value="합계계산" onclick="updateAll()">
        <input type="reset" value="초기화">
        <input type="submit" value="구매하기">
    </form>
</body>

</html>