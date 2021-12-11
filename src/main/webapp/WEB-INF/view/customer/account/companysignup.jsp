<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자용 회원가입 페이지</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {               
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                var sido = data.sido;
                var sigungu = data.sigungu;

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                var remainRoadAddr = fullRoadAddr.replace(sido + " " + sigungu, "");
                var remainjibunAddr = data.jibunAddress.replace(sido + " " + sigungu, "");

                
                document.getElementById('zip_code').value = data.zonecode;
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;
                document.getElementById('user_selected_type').value = data.userSelectedType;

                document.getElementById('sido').value = sido;
                document.getElementById('sido2').value = sido;
                document.getElementById('sigungu').value = sigungu;
                document.getElementById('sigungu2').value = sigungu;
                document.getElementById('remain_road_addr').value = remainRoadAddr;
                document.getElementById('remain_jibun_addr').value = remainjibunAddr;


                
                if(data.autoRoadAddress) {
                
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<link href="/resources/css/companysignup.css" rel="stylesheet">
</head>
<body>
<div id="wrap" class ="wrapper">
<header class ="logoheader">
	<center><img src="/resources/img/logo-1.png"></center>
</header>
	<!-- 회원가입 타이틀 부분 -->
	<form:form modelAttribute="customer" action="csignup" method="post" class="id">
	<!-- error binding -->
			<spring:hasBindErrors name="user">
				<c:forEach var="error" items="${ errors.globalErrors }">
					<span class="err"><spring:message code="${ error.code }"/></span>
				</c:forEach>
			</spring:hasBindErrors>
	<div id ="container">
		<div class="row_gorup">		
	<div class ="idInput">
	<!-- 아이디입력 -->
	<h3 class="list">사업자등록 번호</h3>
	<span class="box_comnum"><input type ="text" id ="companynum" class="int check"
	maxlength="20"></span>
	<input type ="button" name ="companyNum" value="사업자번호 조회" id="companyNum" class="id_check">
	</div>
	 <div class="nameInput">
                  <h3 class="list">이름</h3>
                  <span class="box_name"><input type="text" id="name" class="int_check"
                     maxlength="20"></span>
               </div>               
	 
		<div class ="row_group">
	 <!-- 상호 입력 -->
               <div class="companynameInput">
                  <h3 class="list">상호</h3>
                  <span class="box_companyname"><form:input path="nickname" type="text" id="nickname" class="int check"
                     maxlength="20" /></span>
               </div>
  			</div>
  			
	<div class ="idInput">
	<!-- 아이디입력 -->
	<h3 class="list">아이디</h3>
	<span class="box_id"><input type ="text" id ="id" placeholder="아이디 입력" class="int check"
	maxlength="20"></span>
	</div>
	
	<input type ="button" name ="userIdcheck" value="중복확인" class="id_check">	
	
	<!-- 비밀번호 입력 -->
	<div class="pwInput">
	<h3 class="list">비밀번호</h3>
	<span class="box_pw"><input type ="password" id ="pw" class="check"
	maxlength="20"></span><br>
	</div>
	
	<!-- 비밀번호 재확인 -->
		<div class="pwInputCheck">
	<h3 class="list">비밀번호 재확인</h3>
	<span class="box_pwcheck"><input type ="password" id ="pwCheck" class="int check"
	maxlength="20"></span><br>
		</div>
		
		<!-- 전화번호 입력 -->
					<div class="phonenoInput">
						<h3 class="list">전화번호</h3>
						<span class="box_name"><form:input type="text" id="name"
							path="phoneno" class="int_check" maxlength="20" /></span>
					</div>
		
		<!-- 판매자 구분 선택 -->
		<div class="pwInputCheck">
	<h3 class="list">판매 구분</h3>
	<form:select path="type" class="box_pwcheck">
		<option value="3" label="온라인"></option>
		<option value="4" label="오프라인"></option>
	</form:select><br>
		</div>
		<div class="emailInput">
				<h3 class="list">이메일</h3>
				<form:input type="email" path="email" class="box_email" />				
			</div>
			<div class="genderInput">
				<h3 class="list">성별</h3>
				<span class="box_gender">
					<form:select path="gender" id="gender">
							<form:option value="0" label="선택" />
							<form:option value="1" label="남자" />
							<form:option value="2" label="여자" />
					</form:select><br><br>
				</span>
			</div>
			<!-- 생년월일 입력 -->
					<div class="birthInput">
						<h3 class="list">생년월일</h3>
						<form:input type="date" path="birthday"/>
					</div>
<div>
신 우편번호 : <input type="text" id="zip_code" placeholder="우편번호"><br>
도로명 주소 : <input type="text" id="roadAddress" placeholder="도로명주소" size="70"><br>
도로명 주소 분리형 : <input type="text" id="sido" placeholder="도로명주소" size="20"><input type="text" id="sigungu"  size="20"><input type="text" id="remain_road_addr"  size="30"><br>
지번 주소 : <input type="text" id="jibunAddress" placeholder="지번주소" size="70"><br>
지번 주소 분리형 : <input type="text" id="sido2" placeholder="도로명주소" size="20"><input type="text" id="sigungu2"  size="20"><input type="text" id="remain_jibun_addr"  size="30"><br>
사용자가 선택한 주소의 타입(R(도로명), J(지번)) : <input type="text" id="user_selected_type" name="user_selected_type" /><br>
<input type="button" id="btn" onclick="execDaumPostcode()" value="우편번호 찾기">
<input type="button" id="btn" onclick="execDaumPostcode()" value="주소등록">
</div>
				
		
		
	</div>

      </div>
      <div class="click_signup">
      <input type="submit" value="가입하기" class="signup">
      <input type="reset" value="취소" class="signup">
      </div>
	</form:form>
</div>
<footer>
	<div class="coper"><center>© Mr.function.</center></div>
</footer>
</body>
</html>