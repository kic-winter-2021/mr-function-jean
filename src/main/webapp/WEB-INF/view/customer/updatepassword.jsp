<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
	
</style>
<script>
	const duplCheck = (f) => {
		if (pw_new.value !== pw_chk.value) {
			alert("입력한 두 비밀번호가 다릅니다.");
			f.newpw.value="";
			f.chkpw.value="";
			f.newpw.focus();
			return false;
		}
		let passlen = f.newpw.value.length;
		let passlen = f.chgpass.value.length
		if(passlen < 3 || passlen > 30) {
			alert("비밀번호는 3자리 이상 30자 미만이어야 합니다.");
			f.chgpass.focus();
			return false;
		}
		return true;
	}
	const postpone = () => {
		location.href = document.referrer;
		// TODO: password update 주기 모델 추가
	}
	const cancel = () => {location.href = document.referrer;}
</script>
</head>
<body>
	<div class="" id="updatepw">
		<h3>비밀번호 변경하기</h3>
		<form action="updatepw" method="post" name="passwordForm" onsubmit="return duplCheck(this)">
			<table>
				<tr>
					<th>이전 비밀번호</th>
					<td><input type="password" name="oldpw" id="oldpw" maxlength="30"/></td>
				</tr>
				<tr>
					<th>새로운 비밀번호</th>
					<td><input type="password" name="newpw" id="newpw" maxlength="30"/></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="chkpw" id="chkpw" maxlength="30"/>
						<span id="msg"></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="확인"/>
						<input type="button" value="취소" onclick="javascript:cancel();" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>