<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 작성자 : 박이삭
	 작성일자 : 2021-12-4
	 - 사은품페이지
	 
	  
 -->
<head>
    <meta charset="UTF-8">
    <title>사은품창</title>
</head>

<body>
    <form>
        <div>
            <select>
                <option>회원아이디</option>
                <input type="text">
                <input type="button" value="선택">
            </select>
        </div>
        <div>
            <table border="1">
                <th>상품 구매 목록

                </th>
                <th>사은품 종류</th>
                <tr>
                    <td>
                        <select>
                        <option selected>--선택--</option>
                        <option>디젤진</option>
                        <option>ck진</option>
                        </select>
                    </td>
                    <td>
                        <select>
                        <option selected>--선택--</option>
                        <option>사과</option>
                        <option>딸기</option>
                        </select>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <input type="button" value="사용여부선택">
            <input type="button" value="사용">
        </div>
    </form>
</body>

</html>