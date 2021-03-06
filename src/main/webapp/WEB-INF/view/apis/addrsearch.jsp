<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>우편번호 찾기</title>
    <link rel="stylesheet" href="resources/css/addrSearch.css" type="text/css">
=======
    <!-- 작성자 : 박이삭
    	 작성날짜 : 12/4
     -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>우편번호 찾기</title>
    <link rel="stylesheet" href="../resources/css/addrSearch.css" type="text/css">
>>>>>>> refs/heads/front-1.1
</head>
<body>
<form>

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

<span id="guide" style="color:#999"></span>
</form>
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
</body>
</html>