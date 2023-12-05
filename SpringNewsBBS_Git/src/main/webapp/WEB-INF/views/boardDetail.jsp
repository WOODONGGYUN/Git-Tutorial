<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<script src="resources/js/reply.js"></script>
<style>
	.fontDate{
		font-size:x-small;	
	}
	
textarea {
        resize: none;
        border: none;
    }

</style>    
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col-6 offset-3">
		<form name="checkForm" id="checkForm">
			<input type="hidden" name="no" id="no" value="${ board.no }">
			<input type="hidden" name="pass" id="rPass">
			<input type="hidden" name="pageNum" value="${ pageNum }" />
		</form>
		
		<c:if test="${sessionScope.reporter.writer == board.writer }">
		<div class="row my-3">
			<div class="col-2 text-start">
				<input class="form-control" type="password" name="pass"
					id="pass" placeholder="비밀번호">
			</div>
			<div class="col-4">	
				<input class="btn btn" type="button" id="detailUpdate" value="수정" />
				<input class="btn btn" type="button" id="detailDelete" value="삭제" />	
			</div>
		</div>
		</c:if>
		
		<div class="row">
			<div class="col-10">
				<h3>${board.title }</h3>
			</div>
		</div>
		
		<div class="row">
			<div class="col-9">${board.regDate }</div>
			<div class="col-3">조회수 ${ board.readCount }</div>
		</div>
		<div class="row">
			<div class="col py-2">${board.office} ${board.name } 기자</div>
		</div>
		<div class="row">
			<div class="col pt-5 pb-1">
				<img src="resources/img/${ board.file1 }" width="500" height="350">
			</div>
		</div>
		<div class="row">
			<div class="col text-center pb-5">${board.summary }</div>
		</div>
		<div class="row">
			<div class="col" >
				<span style="font-family : 'Noto Sans KR', sans-serif;"></span>
				${board.content }
			</div>
		</div>
		<div class="row">
			<div class="col py-5">${board.office} ${board.name } 기자 (${board.email })</div>
		</div>
		
		
		
		
		
		<!-- 추천/땡큐 영역 -->
			<div class="row my-2">
				<div class="col p-5 ">
					<div id="recommend" class="text-center">
						<span id="commend" class="btnCommend text-primary"
								style="cursor:pointer;">
							<i class="bi bi-emoji-smile pe-1" style="color: black"></i>쏠쏠정보
							<span class="recommend">(${board.recommend})</span>
						</span>
						<span id="thank" class="btnCommend text-primary" 
								style="cursor:pointer;">
							<i class="bi bi-emoji-laughing pe-1" style="color: black"></i>공감백배
							<span class="recommend">(${board.thank})</span>
						</span>
						
					</div>
				</div>
			</div>

			<!-- 댓글 헤더 영역 -->
			<div class="row border-bottom p-2" id="replyTitle" >
				<div class="col-3 p-2 text-start">
					<span class="fw-bold">댓글 리스트</span>
				</div>
				<c:if test="${sessionScope.member.id != null}">
				<div class="col-3 p-2">	
					<span id="replyWrite" class="" style="cursor:pointer;">
							<i class="bi bi-chat-dots pe-1" style="color: black"></i>댓글쓰기
					</span>
				</div>
				</c:if>
			</div>
			
			
			
		<!-- 댓글 리스트 영역 -->		
		<!-- 댓글이 존재하는 경우 -->
		<c:if test="${not empty replyList }">
		<div class="row mb-3" id="replyList">
			<div class="col ">
				<c:forEach var="reply" items="${replyList }">
					<div class="replyRow row border-top-0">
						<div class="col">
							<div class="row p-2">
								<div class="col-4 pt-2 fw-bold">
									<i class="bi bi-person-check"></i>
									<span name="replyId ">${ reply.id}</span>
								</div>	
							</div>															
							<div class="row">
								<div class="col-4 ps-4 fontDate">
									<span class="fs-7">${reply.regDate }</span>				
								</div>
								
								<c:if test="${sessionScope.member.id != null }">
								<div class="col-8 text-end">
									<button data-no="${reply.no}" class="modifyReply btn btn-default btn-sm">
										<i class="bi bi-journal-text">수정</i>
									</button>
									<button data-no="${reply.no}"  class="deleteReply btn btn-default btn-sm">
										<i class="bi bi-journal-text">삭제</i>
									</button>
									<button onclick="reportReply('${reply.no}');"class="btn btn-default btn-sm">
										<i class="bi bi-journal-text">신고</i>
									</button>
								</div>
								</c:if>
							 </div>
								
								
								
							<div class="row"><!-- 댓글 내용 -->
								<div class="col font border-bottom ps-4 ">
									<pre>${reply.replyContent }</pre>
								</div>
							</div>
							
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		</c:if>
			
			
			<!-- 댓글이 존재하지 않는 경우 -->
			<c:if test="${ empty replyList}">
			<div class="row my-3" id="replyList">
				<div class="col text-center border p-5">
					<div>이 게시 글의 댓글이 존재 하지 않습니다.</div>
				</div>
			</div>
			</c:if>
			
			<!-- 댓글 쓰기 폼 -->			
			<div class="row my-3 d-none" id="replyForm">
				<div class="col">
					<form name="replyWriteForm" id="replyWriteForm">
						<input type="hidden" name="bbsNo" value="${board.no }">
						<input type="hidden" name="id" value="${sessionScope.member.id }"> 
						<div class="row my-3 p-3 boder">
							
								
						<div class="row">
							<div class="col border px-4 pt-2">
								<i class="bi bi-person-check"></i>
									<span class="fw-bold ">${sessionScope.member.id }</span>
								<div class="row my-3">
									<div class="col-12">	
										<textarea name="replyContent" id="replyContent"
											class="form-control" row="4">
										</textarea>
									</div>
									<div class="col-12 text-end">
										<input type="submit" class="btn" id="replyWriteButton" value="등록">
									</div>
								</div>	
							</div>
						</div>	
									
									
																			
							</div>
						</div>
					</form>
				</div>
			</div> <!-- end replyForm -->
			
			
		
		
		
	</div> <!-- content -->
</div>	