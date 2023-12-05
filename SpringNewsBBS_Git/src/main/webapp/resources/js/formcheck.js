$(function() {


	
	$("#file2").off().on("change", function(){	
		
    	const fd = new FormData();
    	const file = $("#file2")[0].files[0]; 	
    	fd.append('file1',file);

    	$.ajax({

    		url : "imgUpload.ajax",
    		data:  fd,
    		dataType : "json",
    		type : "post",
    		enctype : "multipart/form-data",
    		processData: false,
    		contentType : false,
    		success : function(resData){

    		document.execCommand('insertImage',false, "resources/img/" + resData.fileName);
    		
   		
       		$("#contenteditable img").each(function() {
				 $(this).attr("width", 500);
				 $(this).attr("height", 350);
			});
			       		
       		
    		$("#contenteditable").focus();

    	}, error : function(err){

    	}
    	});
    });

	
	$("#detailDelete").on("click", function() {
		let pass = $("#pass").val();
		if(pass.length <= 0) {
			alert("비밀번호를 입력해 주세요");
			return false;
		}
		
		$("#rPass").val(pass);
		$("#checkForm").attr("action", "deleteProcess");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
		
	});
	
	
	$("#detailUpdate").on("click", function() {
		let pass = $("#pass").val();
		if(pass.length <= 0) {
			alert("비밀번호를 입력해 주세요");
			return false;
		}
		
		$("#rPass").val(pass);
		$("#checkForm").attr("action", "updateProcess");
		$("#checkForm").submit();
		
	});
	

	$("#updateForm").on("submit", function() {
	
		$("#content").val($("#contenteditable").html().trim());

		
		if($("#writer").val().length <= 0 ) {
			alert("오류 나시면 로그인 다시 해주세요");
			$("#writer").focus();
			return false;
		}
		
		if(("#title").val().length <= 0) {
			alert("제목을 입력해 주세요");
			$("#title").focus();
			return false;
		}
		
		if(("#pass").val().length <= 0) {
			alert("비밀번호를 입력해 주세요");
			$("#pass").focus();
			return false;
		}
		
		if(("#content").val().length <= 0) {
			alert("내용을 입력해 주세요");
			$("#content").focus();
			return false;
		}		
		
		if($("#summary").val().length <= 0) {
			alert("사진 요약 해주세요");
			$("#summary").focus();
			return false;
		}	
		
		if($("#file1").val().length <= 0) {
			alert("사진 올려주세요");
			$("#file1").focus();
			return false;
		}	
		
	});	
	
	
	$("#writeForm").on("submit", function() {
	
		$("#content").val($("#contenteditable").html().trim());
		
		
		if($("#writer").val().length <= 0 ) {
			alert("오류 나시면 로그인 다시 해주세요");
			$("#writer").focus();
			return false;
		}
		
		if($("#title").val().length <= 0) {
			alert("제목을 입력해 주세요");
			$("#title").focus();
			return false;
		}
		
		if($("#pass").val().length <= 0) {
			alert("비밀번호를 입력해 주세요");
			$("#pass").focus();
			return false;
		}
		
		if($("#content").val().length <= 0) {
			alert("내용을 입력해 주세요");
			$("#content").focus();
			return false;
		}	
		
		if($("#summary").val().length <= 0) {
			alert("사진 요약 해주세요");
			$("#summary").focus();
			return false;
		}	
		
		if($("#file1").val().length <= 0) {
			alert("사진 올려주세요");
			$("#file1").focus();
			return false;
		}		
		
		if($("#name").val().length <= 0) {
			alert("재로그인 해주세요");
			return false;
		}		
		
		if($("#email").val().length <= 0) {
			alert("재로그인 해주세요");
			return false;
		}	
		
		if($("#office").val().length <= 0) {
			alert("재로그인 해주세요");
			return false;
		}	
		
	});
	
});