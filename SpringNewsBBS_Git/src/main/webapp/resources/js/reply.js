/**
 * reply.js
 */
 // DOM이 준비되면
 $(function() {
 
 
 
 
 	$(document).on("click", ".deleteReply", function() {	
		
		var no = $(this).attr("data-no");
		var writer = $(this).parent().parent().prev().find("span").text();
		var bbsNo = $("#replyForm input[name=bbsNo]").val();
		var params = "no=" + no + "&bbsNo=" + bbsNo;	
		console.log(params);
		
		/* 아래에서 $("#replyTable").empty(); 가 호출되면
		 * 댓글 쓰기 폼이 문서에서 삭제될 수 있으므로 백업을 받아야 한다.
		 **/				
		$replyForm = $("#replyForm").slideUp(300);
		
		var result = confirm("댓글을 삭제하시겠습니까?");
		
		if(result) {
			$.ajax({
				url: "replyDelete.ajax",
				type: "post",
				data: params,
				dataType: "json",
				success: function(resData, status, xhr) {			
					
					console.log(resData);
	 				
	 				// 반복문을 통해서 - html 형식으로 작성
	 				$("#replyList").empty();
	 				
	 				$.each(resData, function(i, data) {
	 				
	 					// v.regData == 1672300816000
	 					let date = new Date(data.regDate); 
	 					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
	 								? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
	 								+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) +  " " 
	 								+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
	 								+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
	 								+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
	 					 
		 				var result = 
		 				

		 				'<div class="replyRow row border-top-0">'
						+		'<div class="col">'
						+			'<div class="row p-2">'
						+				'<div class="col-4 pt-2 fw-bold">'
						+					'<i class="bi bi-person-check"></i>'
						+					'<span name="replyId ">'+ data.id +'</span>'
						+				'</div>'	
						+			'</div>'															
						+			'<div class="row">'
						+				'<div class="col-4 ps-4 fontDate">'
						+					'<span class="fs-7">' + strDate + '</span>'				
						+				'</div>'																				
						+				'<div class="col-8 text-end">'
						+				'<button data-no="' + data.no + '" class="modifyReply btn btn-default btn-sm">'
						+					'<i class="bi bi-journal-text">수정</i>'
						+				'</button> ' 
						+				'<button data-no="' + data.no + '"  class="deleteReply btn btn-default btn-sm">'
						+					'<i class="bi bi-journal-text">삭제</i>'
						+				'</button> ' 
						+				'<button onclick="reportReply(\'' + data.no + '\');" class="btn btn-default btn-sm">'
						+					'<i class="bi bi-journal-text">신고</i>'
						+				'</button>'
						+			'</div>'
						+		 	'</div>'
						+			'<div class="row">'
						+				'<div class="col font border-bottom ps-4">'
						+					'<pre>'+ data.replyContent +'</pre>'
						+				'</div>'
						+			'</div>	'
						+		'</div>'
						+	'</div>'
					
		 					 				
		 				$("#replyList").append(result);
	 				 				
	 				}); // end $.each()
	 				
	 				// 댓글 쓰기가 완료되면 폼을 숨긴다.
	 				$("#replyContent").val("");
	 				$replyForm.css("display", "none"); 				
	 				$("#global-content > div.col").append($replyForm);
	 				
				},
				error: function(xhr, status, error) {
					alert("ajax 실패 : " + status + " - " + xhr.status);
				}
			});
		}
		// 앵커 태그에 의해 페이지가 이동되는 것을 취소한다.
		return false;
	});	
 		
 
 	
 
 	$("#replyWrite").on("click", function() {
 		// 자식요소로 이동 또는 추가하는 것
 		
 		console.log($("#replyForm").css("display")); 		
 		console.log($("#replyForm").is(":visible"));
 	
		if($("#replyForm").is(":visible")) { // 폼이 현재 보이고 있는 상태			
			
			let $prev = $("#replyTitle").prev(); 
			
			// 현재 폼이 보이고 있는 버튼이 아닐 때만 동작
			if(! $prev.is("#replyForm")) {
				$("#replyForm").slideUp(300);
			}			
			setTimeout(function() {
					$("#replyForm").insertBefore("#replyTitle")
		 									.slideDown(300);
				}, 300);
				
		} else { // 폼이 현재 화면에 보이지 않는 상태 처리
		
	 		// 형제 요소의 앞 뒤로 이동 
	 		$("#replyForm").insertBefore("#replyTitle")
	 			.removeClass("d-none").css("display", "none").slideDown(300);
 		}
 		
 		$("#replyForm").find("form")
 			.attr("id", "replyWriteForm").removeAttr("data-no");
 		$("#replyContent").val("");
 		$("#replyWriteButton").val("등록");
 		 		 		 	
 	});
 	
 	
 	// 댓글 쓰기 폼이 submit 될 때
 	$(document).on("submit", "#replyWriteForm", function(e) {
 		
 		if($("#replyContent").val().length < 5) {
 			alert("댓글은 5자 이상이어야 합니다.");
 			return false;
 		}
 		
 		let params = $(this).serialize();
 		console.log(params);
 		
 		$.ajax({
 			url: "replyWrite.ajax",
 			data: params,
 			type: "post",
 			dataType: "json",
 			success: function(resData) { // ajax 통신이 성공하고 데이터까지 파싱이 완료되었을 때 호출되는 콜백
 				// console.log(resData);
 				// 기존의 내용을 화면에서 삭제
 				$("#replyList > .col").empty();
 				
 				$.each(resData, function(index, data) {
 					// 1699845066000 -> 2023-10-09 12:12:10
 					let date = new Date(data.regDate);  
 					let strDate = date.getFullYear() + "-" 
 						+ ((date.getMonth() + 1 < 10) ? "0" + date.getMonth() + 1 : date.getMonth() + 1)
 						+ ((date.getDate() < 10) ? "0" + date.getDate() : date.getDate()) + " "
 						+ ((date.getHours() < 10) ? "0" + date.getHours() : date.getHours()) + " : "
 						+ ((date.getMinutes() < 10) ? "0" + date.getMinutes() : date.getMinutes()) + " : " 
 						+ ((date.getSeconds() < 10) ? "0" + date.getSeconds() : date.getSeconds());
 					
 					let result = 
	 					
		 					'<div class="replyRow row border-top-0">'
						+		'<div class="col">'
						+			'<div class="row p-2">'
						+				'<div class="col-4 pt-2 fw-bold">'
						+					'<i class="bi bi-person-check"></i>'
						+					'<span name="replyId ">'+ data.id +'</span>'
						+				'</div>'	
						+			'</div>'															
						+			'<div class="row">'
						+				'<div class="col-4 ps-4 fontDate">'
						+					'<span class="fs-7">' + strDate + '</span>'				
						+				'</div>'																				
						+				'<div class="col-8 text-end">'
						+				'<button data-no="' + data.no + '" class="modifyReply btn btn-default btn-sm">'
						+					'<i class="bi bi-journal-text">수정</i>'
						+				'</button> ' 
						+				'<button data-no="' + data.no + '"  class="deleteReply btn btn-defaultv btn-sm">'
						+					'<i class="bi bi-journal-text">삭제</i>'
						+				'</button> ' 
						+				'<button onclick="reportReply(\'' + data.no + '\');" class="btn btn-default btn-sm">'
						+					'<i class="bi bi-journal-text">신고</i>'
						+				'</button>'
						+			'</div>'
						+		 	'</div>'
						+			'<div class="row">'
						+				'<div class="col font border-bottom ps-4 ">'
						+					'<pre>'+ data.replyContent +'</pre>'
						+				'</div>'
						+			'</div>	'
						+		'</div>'
						+	'</div>'
					
					
					$("#replyList > .col").append(result);
								 					
 				}); // end $.each()
 				
 				// 댓글 쓰기 완료되면 폼은 숨긴다.
 				$("#replyForm").slideUp(300)
 					.add("#replyContent").val("");
 				 	
 			},
 			error: function(xhr, status) { // ajax 통신시 오류 발생할 때 호출되는 콜백
 				console.log("error : ", status);
 			}
 		});
 		
 		// 최종적으로 폼 전송을 막는다.
 		return false;
 	});
 	
 	
 	$(document).on("submit", "#replyUpdateForm", function(e) {
 		
 		if($("#replyContent").val().length < 5) {
 			alert("댓글은 5자 이상이어야 합니다.");
 			return false;
 		}
 		
 		let params = $(this).serialize() + "&no=" + $(this).attr("data-no"); 		
 		console.log(params);
 		
 		$replyForm = $("#replyForm").slideUp(300);
 		console.log("$replyForm : " , $replyForm); 
 		
 		$.ajax({
 			url: "replyUpdate.ajax",
 			data: params,
 			type: "post",
 			dataType: "json",
 			success: function(resData) { // ajax 통신이 성공하고 데이터까지 파싱이 완료되었을 때 호출되는 콜백
 				console.log(resData);
 				// 기존의 내용을 화면에서 삭제
 				$("#replyList > .col").empty();
 				
 				$.each(resData, function(index, data) {
 					// 1699845066000 -> 2023-10-09 12:12:10
 					let date = new Date(data.regDate);  
 					let strDate = date.getFullYear() + "-" 
 						+ ((date.getMonth() + 1 < 10) ? "0" + date.getMonth() + 1 : date.getMonth() + 1)
 						+ ((date.getDate() < 10) ? "0" + date.getDate() : date.getDate()) + " "
 						+ ((date.getHours() < 10) ? "0" + date.getHours() : date.getHours()) + " : "
 						+ ((date.getMinutes() < 10) ? "0" + date.getMinutes() : date.getMinutes()) + " : " 
 						+ ((date.getSeconds() < 10) ? "0" + date.getSeconds() : date.getSeconds());
 					
 					let result = 
	 					'<div class="replyRow row border-top-0">'
						+		'<div class="col">'
						+			'<div class="row p-2">'
						+				'<div class="col-4 pt-2 fw-bold">'
						+					'<i class="bi bi-person-check"></i>'
						+					'<span name="replyId ">'+ data.id +'</span>'
						+				'</div>'	
						+			'</div>'															
						+			'<div class="row">'
						+				'<div class="col-4 ps-4 fontDate">'
						+					'<span class="fs-7">' + strDate + '</span>'				
						+				'</div>'																				
						+				'<div class="col-8 text-end">'
						+				'<button data-no="' + data.no + '" class="modifyReply btn btn-default btn-sm">'
						+					'<i class="bi bi-journal-text">수정</i>'
						+				'</button> ' 
						+				'<button data-no="' + data.no + '"  class="deleteReply btn btn-default btn-sm">'
						+					'<i class="bi bi-journal-text">삭제</i>'
						+				'</button> ' 
						+				'<button onclick="reportReply(\'' + data.no + '\');" class="btn btn-default btn-sm">'
						+					'<i class="bi bi-journal-text">신고</i>'
						+				'</button>'
						+			'</div>'
						+		 	'</div>'
						+			'<div class="row">'
						+				'<div class="col font border-bottom ps-4 ">'
						+					'<pre>'+ data.replyContent +'</pre>'
						+				'</div>'
						+			'</div>	'
						+		'</div>'
						+	'</div>'
					
					$("#replyList > .col").append(result);
								 					
 				}); // end $.each()
 				
 				// 댓글 수정하기가 완료되면 백업한 폼을 원래 자리에 다시 넣는다.
 				$("#replyContent").val("");
 				$replyForm.css("display", "none");
 				$("#global-content > div.col-6").append($replyForm);
 				 	
 			},
 			error: function(xhr, status) { // ajax 통신시 오류 발생할 때 호출되는 콜백
 				console.log("error : ", status);
 			}
 		});
 		
 		// 최종적으로 폼 전송을 막는다.
 		return false;
 	});
 	

 	$(document).on("click", ".modifyReply", function() {
 	
 		let $replyRow = $(this).parents(".replyRow");
 		console.log($(this).parents(".replyRow"));
 	
 		console.log($("#replyForm").css("display")); 		
 		console.log($("#replyForm").is(":visible"));

		if($("#replyForm").is(":visible")) { // 폼이 현재 보이고 있는 상태			
			
			// 현재 폼이 보이고 있는 버튼이 아닐 때만 동작
			if(! $replyRow.next().is("#replyForm")) {
				$("#replyForm").slideUp(300);
			}			
			setTimeout(function() {
					$("#replyForm").insertAfter($replyRow)
		 									.slideDown(300);
				}, 300);		
		} else { // 폼이 현재 화면에 보이지 않는 상태 처리
	 		// 형제 요소의 앞 뒤로 이동 
	 		$("#replyForm").insertAfter($replyRow)
	 			.removeClass("d-none").css("display", "none").slideDown(300);
 		}
 		
 		let reply = $(this).parent().parent().next().find("pre").text();
 		$("#replyContent").val($.trim(reply));
 		
 		$("#replyForm").find("form")
 			.attr({"id": "replyUpdateForm", "data-no": $(this).attr("data-no")}); 		
 		$("#replyWriteButton").val("댓글수정");
 		
 		
 	
 	});
 
 
 
 	$(".btnCommend").click(function() {
 		
 		let com = $(this).attr("id");
 		
 		//let obj = JSON.parse({"id": "midas", "num":0 })
 		//JSON.stringify(obj)
 		
 		$.ajax({
 			url: "recommend.ajax",
 			type: "post",
 			data: {recommend: com, no: $("#no").val() }, 
 			dataType: "json",
 			success: function(resData) {
 				console.log(resData.recommend, " : ", resData.thank);
 				
 				let msg = com == 'commend' ? "쏠쏠정보" : "공감백배";
 					
 				$("#commend > .recommend").text("(" + resData.recommend + ")");
 				$("#thank > .recommend").text("(" + resData.thank + ")");
 			},
 			error: function(xhr, status, err) {
 				console.log("error : ", status, " - ", err);
 			}
 		});
 	
 	});
 
 
 }); 
 
 function reportReply(replyNo) {
 	let result = confirm("이 댓글을 신고 하시겠습니까?");
 	if(result) {
 		location.href="customerService";
 	}
 }