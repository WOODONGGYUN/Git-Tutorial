<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col-6 offset-3">
	
		<form name="updateForm" id="updateForm" action="updateProcess"
						class="row g-3" method="post" enctype="multipart/form-data">
		<div class="col">
		
			<input type="hidden" name="no" id="no" value="${ board.no }">
			<input type="hidden" class="form-control" name="email" id="email" 
					placeholder="이메일" value="${sessionScope.reporter.email }">		
			<input type="hidden" class="form-control" name="office" id="office" 
					placeholder="소속" value="${sessionScope.reporter.office }">			
			<input type="hidden" class="form-control" name="name" id="name" 
					placeholder="이름" value="${sessionScope.reporter.name }">									
			<input type="hidden" name="pageNum" value="${ pageNum }" />
			<div class="row">
				<div class="col text-center">
					<h3>뉴스 수정</h3>
				</div>
			</div>
	
			<div class="row">		
				<div class="col my-2">		
					<input type="text" class="form-control" name="writer" id="writer" 
									value="${sessionScope.reporter.writer }" placeholder="아이디" readonly>
				</div>						
				<div class="col my-2">		
					<input type="password" class="form-control" name="pass" id="pass" 
								placeholder="비밀번호">
				</div>
			</div>
				
			<div class="row">		
				<div class="col my-2 text-center">
					<input type="text" class="form-control" name="title" id="title"
						value="${board.title }" placeholder="제목">
				</div>	
			</div>
			
			<div class="row">
				<div class="col">
					<input type="hidden" name="content" id="content">
					<div id="contenteditable" contenteditable="true" 
							style="min-height: 50vh;" class="border rounded">${board.content }</div>						
				</div>
			</div>
				
			<div class="row">
				<div class="col p-3">
					<label> 뉴스 사진</label>
					<input type="file" class="form-control form-control-sm" name="file1" id="file1" 
							value="${board.file1 }" placeholder="사진"> 
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<input type="text" class="form-control" name="summary" id="summary"
						value="${board.summary }" placeholder="사진요약 ">
				</div>
			</div>
				
			<div class="text-center my-4">
					<input type="submit" value="등록하기" class="btn btn-light" >&nbsp;&nbsp;
					<input type="button" value="뒤로가기" class="btn btn-light"
						onclick="history.back()">
			</div>
					
		</div>			
		</form>
	</div>
</div>	