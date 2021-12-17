const duplCheck = () => {
	let idval = $("#id-input").val();
	$("#idvalid").addClass("errmsg");
	if ($("#id-input").val().length < 4) {
		$("#idvalid").html("아이디는 4자 이상 입력해주세요");
		$("#id-input").val('');
		$("#id-input").focus();
		return;
	}
	$.ajax({
		url: "idavailable",
		type: "POST",
		data: {id : idval},
		success: data => {
			console.log(data);
			if (data == "N") {
				$("#idvalid").removeClass("greenmsg")
				$("#idvalid").addClass("errmsg");
				$("#idvalid").html("아이디가 중복되었습니다");
				$("#id-input").val('');
				$("#id-input").focus();
			}
			else if(data == "Y"){
				$("#idvalid").removeClass("errmsg");
				$("#idvalid").addClass("greenmsg");
				$("#idvalid").html(idval+"은(는) 사용가능합니다");
			}
		},
		error: e => {
			alert("Request failed: " + e.status);	
		}
	})
}
const companyCheck = () => {
	const obj = {};
	obj.b_no = [];
	
	obj.b_no[0] = $("#company-input").val();	
	$.ajax({
		url: "http://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey="
			+ "SVpCy0bvZ5pGxpQdz6HmdUFgFl5L6vUbmK9tzQAPslFjjRHSBsKGTvYAkRC84aHoeUct2mtsiD8YfWyEzOQMIQ%3D%3D",
		type: "POST",
		data: JSON.stringify({b_no: [$("#company-input").val()]}),
		success: result => {
			console.log(url);
			console.log(obj);
			console.log(result);
		},
		error: e => {
			console.log(e);
			console.log(obj);
			alert("Request failed: " + e.status);	
		}
	});
}