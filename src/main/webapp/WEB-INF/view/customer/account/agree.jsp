<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관 동의</title>
<link href="/resources/css/agree.css" rel="stylesheet">
</head>
<body>
	<div id="agreement">
		<ul class="join_box">
			<li class="checkBox">
				<ul class="clearfix">
					<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
						동의합니다.</li>
					<li class="checkAllBtn"><input type="checkbox" name="chkAll"
						id="chkAll" class="chk" onchange="changeCheck(this)"></li>
				</ul>
			</li>
			<li class="checkBox">
				<ul class="clearfix">
					<li>이용약관 동의(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" id="chk1"></li>
				</ul> <textarea name="" id="" readonly>여러분을 환영합니다.
	네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
	       </textarea>
			</li>
			<li class="checkBox">
				<ul class="clearfix">
					<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" id="chk2">
					</li>
				</ul> <textarea name="" id="" readonly>여러분을 환영합니다.
	네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
	       </textarea>
			</li>
			<li class="checkBox">
				<ul class="clearfix">
					<li>위치정보 이용약관 동의(선택)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" id="chk3"></li>
				</ul> <textarea name="" id="" readonly>여러분을 환영합니다.
	네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
	       </textarea>
			</li>
			<li class="checkBox check04">
				<ul class="clearfix">
					<li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" id="chk4"></li>
				</ul>
	
			</li>
		</ul>
		<ul class="footBtwrap clearfix">
			<li><button class="fpmgBt1" onclick="location.href='signin'">비동의</button></li>
			<li><button class="fpmgBt2" id="agree">동의</button></li>
		</ul>
	</div>
<script>
	const signup = () => {
		'${param.t}'=='p'?(location.href="psignup"):(location.href="ssignup");
	}
	const checks = [];
	checks[0] = document.getElementById("chk1");
	checks[1] = document.getElementById("chk2");
	checks[2] = document.getElementById("chk3");
	checks[3] = document.getElementById("chk4");
	const chkAll = document.getElementById("chkAll");
	const agreeBtn = document.getElementById("agree");
	const changeCheck = checkbox => {
		// 다른 체크 선언
		if(checkbox.checked) {
			checks.forEach(c => c.checked = true);
			activeBtn(agreeBtn);
		} else {
			checks.forEach(c => c.checked = false);
			inactiveBtn(agreeBtn);
		}
	}
	const activeBtn = btn => {
		btn.classList.add("active")
		btn.addEventListener("click", signup);
	}
	const inactiveBtn = btn => {
		btn.classList.remove("active")
		btn.removeEventListener("click", signup);
	}
	const agreeCheck = () => {
		if (!checks[0].checked || !checks[1].checked || !checks[2].checked) {
			inactiveBtn(agreeBtn);
			chkAll.checked = false;
		}
		else activeBtn(agreeBtn);
	}
	checks.forEach(c => {
		c.addEventListener("change", agreeCheck);
	})
</script>
</body>
</html>