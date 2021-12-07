<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 작성자 : 박이삭
	 작성일자 : 2021-12-4
	 - 문의하기 - 글 작성페이지
	 
	  
 -->

<html>

<head>
    <meta charset="UTF-8">
    <title>문의하기 - 글 작성페이지</title>
    <link rel="stylesheet" href="resources/css/writeQ.css" type="text/css">
</head>

<body>
    <form class="myform">
        <div>
            <h2>작성하기</h2>
        </div>
        <div class="text">문의유형
            <select>
              <option value="CK">CK</option>
              <option value="DIESEL">DIESEL</option>
              <option value="BB">BB</option>
              <option value="KIC">KIC</option>
            </select>
        </div>
        <div class="text">
            <input class="write" type="text" placeholder="주문번호">
        </div>
        <div class="text">
            <input class="write" type="text" placeholder="작성자">
        </div>
        <div class="text">
            <input class="write" type="text" placeholder="휴대전화 ">
        </div>
        <div class="text">
            <input class="write" " type="email " placeholder="이메일 ">
        </div>
        <div class="text ">
            <input class="write "" type="text" placeholder="문의내용 ">
        </div>
        <input type="submit" class="btn" value="작성완료 " />
    </form>

</body>

</html>