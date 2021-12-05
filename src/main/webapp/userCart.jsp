<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>쇼핑몰 장바구니 예제</title>
    <link rel="stylesheet" type="text/css" href="resources/css/userCart.css">
</head>

<body>
    <div>
        <div>
            <!--<h2>장바구니</h2>-->
            <table class="list-table">
                <thead>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th width="350">상품정보</th>
                        <th width="120">상품금액</th>
                        <th width="150">판매자명</th>
                        <th width="100">등록일</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td width="300">
                            <div class="bak_item">
                                <img src="resources/img/cart.png" width="60px" height="60px">
                            </div>
                        </td>
                        <td width="150">3000</td>
                        <td width="150">디젤</td>
                        <td width="100">2021-12-04</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div><input type="button" value="구매하기"></div>
</body>

</html>