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
	const companyval = $("#company-input").val();
	if (companyval.length < 10 ) {
		$("#companyvalid").addClass("errmsg");
		$("#companyvalid").html("사업자번호 10자를 정확히 입력해주세요");
		$("#company-input").val('');
		$("#company-input").focus();
		return;
	}
	const bnojson = '{"b_no": ["' + companyval + '"]}';
	console.log(bnojson);
	bno = JSON.parse(bnojson);
	console.log(bno.b_no);
	$.ajax({
		url: "http://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=SVpCy0bvZ5pGxpQdz6HmdUFgFl5L6vUbmK9tzQAPslFjjRHSBsKGTvYAkRC84aHoeUct2mtsiD8YfWyEzOQMIQ%3D%3D",
		type: "POST",
		contentType: "application/json",
		data: bnojson,
		success: result => {
			//console.log(result.data[0]);
			const seller = result.data[0];
			if (seller.b_stt == null || seller.b_stt == "") {
				$("#companyvalid").addClass("errmsg");
				$("#companyvalid").html(seller.tax_type);
			} else {
				$("#companyvalid").addClass("greenmsg");
				$("#companyvalid").html("존재하는 사업자입니다");
			}
		},
		error: e => {
			alert("Request failed: " + e.status);	
		}
	});
}