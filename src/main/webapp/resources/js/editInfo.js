
function loginCheck(){	
	if(document.login.mam_passwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.login.mam_passwd.focus();
		return;
	}	
	document.login.submit();
}

function inputCheck(){	
	if(document.regForm.mam_passwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.regForm.mam_passwd.focus();
		return;
	}
	if(document.regForm.mam_name.value==""){
		alert("이름을 입력해 주세요.");
		document.regForm.mam_name.focus();
		return;
	}	
	if(document.regForm.mam_email.value==""){
		alert("이메일을 입력해 주세요.");
		document.regForm.mam_email.focus();
		return;
	}
	if(document.regForm.mam_phone.value==""){
		alert("연락처를 입력해 주세요.");
		document.regForm.mam_phone.focus();
		return;
	}	
	
	if(document.regForm.mam_passwd.value != document.regForm.mam_repasswd.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.mam_repasswd.focus();
		return;
	}
	document.regForm.submit();
}