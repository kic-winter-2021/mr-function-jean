<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 작성자 : 박이삭
	 작성일자 : 2021-12-4
	 - 쿠폰창
	 
	  
 -->
<head>
    <meta charset="UTF-8">
    <title>쿠폰창</title>
</head>

<body>
    <form>
        <div>
            <select>
                <option>회원아이디</option>
                <option>쿠폰번호</option>
                <input type="text">
                <input type="button" value="선택">
            </select>
        </div>
        <div>
            <table border="1">
                <th><input type="checkbox"></th>
                <th>쿠폰이름</th>
                    <th>쿠폰번호</th>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td></td>
                        <td></td>
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