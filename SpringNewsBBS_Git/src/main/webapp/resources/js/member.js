function joinFormCheck(elem) {
	
	if($("#userId").val().length == 0) {
		alert("아이디를 입력해 주세요");
		return false;
	}
	
	if($(elem).is("#memberUpdateForm")) {
	
		if($("#isIdCheck").val() == 'false') {
			alert("아이디 중복을 체크해 주세요");
			return false;
		}
		
		if($("#userPass").val().length == 0) {
			alert("비밀번호를 입력해주세요");
			return false;
		}
	
	}
	
	
	if($("#userName").val().length == 0) {
		alert("이름을 입력해주세요");
		return false;		
	}
	
	if($("#emailId").val().length == 0) {
		alert("이메일을 입력해주세요");
		return false;
	}
	
	if($("#emailDomain").val().length == 0) {
		alert("이메일을 입력해주세요");
		return false;
	}
	
	if($("#zipcode").val().length == 0) {
		alert("우편번호를 입력해주세요");
		return false;
	}
	if($("#address1").val().length == 0) {
		alert("주소를 입력해주세요");
		return false;
	}
	
	if($("#mobile2").val().length == 0 || $("#mobile3").val().length == 0) {
		alert("전화번호를 확인해주세요");
		return false;
	}					
}



function findZipcode() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
            	addr = data.roadAddress;
                //addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                addr += extraAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#zipcode").val(data.zonecode);
            $("#address1").val(addr);
            
            // 커서를 상세주소 필드로 이동한다.
            $("#address2").focus();
        }
    }).open();	
}



function inputCharReplace() {
	let regExp = /[^A-Za-z0-9]/gi;
		
	if(regExp.test($(this).val())) {
		alert("한글은 입력할 수 없습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}

function inputNumber() {
	let regExp = /[^0-9]/gi;
		
	if(regExp.test($(this).val())) {
		alert("숫자만 입력해주세요.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}










$(function() {

	$("#memberUpdateForm").on("submit", function() {
	
		let pass1 = $("#pass1").val();
		let pass2 = $("#pass2").val();		
		
		if(! $("#btnPassCheck").prop("disabled")) {
			alert("비밀번호를 입력해주세요.");
			return false;
			
		} 
		 if(pass1 == pass2) {
			return true;
		} else {	
			alert("새 비밀번호를 다시 확인해주세요.");
			return false;
		}
		
		return joinFormCheck(false);
			
	});


	$("#btnPassCheck").click(function() {
		var id = $("#userId").val();
		var pass = $("#oldPass").val();
		
		if($.trim(oldPass).length == 0) {
			alert("기존 비밀번호를 입력해주세요");
			return false;
		}
		var data = "id=" + id + "&pass="+pass;
		console.log("data : 123123123" + data);
		
		$.ajax({
			"url": "passCheck.ajax",
			"type": "get",
			"data": data,
			"dataType": "json",			
			"success": function(resData) {				
				if(resData.result) {
					alert("비밀번호가 확인되었습니다.\n비밀번호를 수정해주세요");
					$("#btnPassCheck").prop("disabled", true);
					$("#oldPass").prop("readonly", true);
					$("#pass1").focus();
					
				} else {
					alert("비밀번호가 다릅니다.\n비밀번호를 다시 확인해주세요");
					$("#oldPass").val("").focus();
				}
			},
			"error": function(xhr, status) {
				console.log("error : " + status);
			}
		});
		
	});




	$("#memberjoinForm").on("submit", function(){
		return joinFormCheck();
	});



	$("#btnZipcode").on("click", findZipcode);


	$("#selectDomain").on("change", function() {		
		let domain = $(this).val();
		 
		if(domain == "직접입력") {
			
			$("#emailDomain").val("");
			$("#emailDomain").prop("readonly", false);		
			
		} else if(domain == "네이버") {
			$("#emailDomain").val("naver.com");
			$("#emailDomain").prop("readonly", true);
			
		}  else if(domain == "다음") {
			$("#emailDomain").val("daum.net");
			$("#emailDomain").prop("readonly", true);
			
			
		}  else if(domain == "구글") {
			$("#emailDomain").val("gmail.com");
			$("#emailDomain").prop("readonly", true);
			
		} else if(domain == "카카오") {
			$("#emailDomain").val("kakao.com");
			$("#emailDomain").prop("readonly", true);
		}
	});



	$("#userId").on("keyup", inputCharReplace);
	$("#emailId").on("keyup", inputCharReplace);
	$("#emailDomain").on("keyup", inputCharReplace);
	$("#mobile2").on("keyup", inputNumber);
	$("#mobile3").on("keyup", inputNumber);
	
	$("#userName").on("keyup", function(){
		let regExp = /[A-Za-z0-9]/gi;
		
		if(regExp.test($(this).val())) {
			alert("한글만 입력해주세요.");
			$(this).val($(this).val().replace(regExp, ""));
		}
		
	});
	
	
	
	$("#btnIdCheckClose").on("click", function() {
		let id = $(this).attr("data-id-value");
		opener.document.memberjoinForm.id.value = id;
		opener.document.memberjoinForm.isIdCheck.value = true;
		window.close();
	});
	
	
	
	$("#btnOverlapId").on("click", function(){
		let id = $("#userId").val();
		url = "overlapIdCheck?id=" + id;
		
		if(id.length == 0) {
			
			alert("아이디를 입력해주세요");
			return false;
			
		}
		
		if(id.lenth < 4 || id.length > 13) {
			alert("아이디는 4~12글자이어야 합니다");
			return false;
		}
		
		window.open(url, "idCheck", "toolbar=no, location=no, "
				+ "status=no, memubar=no, width=500, height=300, top=500, left=500 ");
		
		
	
	});
	
	
	$("#memberLoginForm").submit(() => {
		var id = $("#id").val();
		var pass = $("#pass").val();
		
		if(id.length <= 0) {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
		
			return false;	
		}
		
		if(pass.length <= 0) {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			
			return false;
		}
	});
	
	
	$("#btnSearch").on("click", function(){
		alert("고객센터로 연락주세요");	
	});
	
});