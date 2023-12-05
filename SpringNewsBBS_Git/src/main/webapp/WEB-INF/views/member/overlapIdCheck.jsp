<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/member.js"></script>
</head>
<body>

	<div class="row my-5" id="global-content">
				
		<!-- 아이디가 사용할 수 없는 경우 -->
		<c:choose>
			<c:when test="${overlap}">		
				<div class="col">
					<div class="row">
						<div class="col text-center border-bottom py-3 fw-bold fixed-top">
							<h3>아이디 중복 체크</h3>
						</div>
					</div>			
					<div class="row my-5 text-center">
						<div class="col">
							입력한 <span style="color:red">[${id}]</span>은 이미 사용 중인 아이디 입니다.
						</div>
					</div>
					<form action="overlapIdCheck" method="post" name="idCheckForm"
						id="idCheckForm" class="row mt-5">
						<div class="col-6 offset-3">
							<div class="input-group">
								<input type="text" class="form-control" name="id" id="checkId" placeholder="아이디">
								<input type="submit" class="btn btn-outline-secondary" value="확인">
							</div>
						</div>				
					</form>			
				</div>
			</c:when>
			<c:otherwise>
			
			
				<!-- 아이디가 사용할 수 있는 경우 -->
				<div class="col">			
					<div class="row">
						<div class="col text-center border-bottom py-3 fw-bold fixed-top">
							<h3>아이디 중복 체크</h3>
						</div>
					</div>
					<div class="row my-5">
						<div class="col text-center">
							입력하신 [${id}]은 사용할 수 있는 아이디 입니다.
						</div>
					</div>
					<div class="row my-5">
						<div class="col text-center">
							<input type="button" value="${id} 사용하기"
								id="btnIdCheckClose" data-id-value="${id}"
								class="btn btn-outline-secondary">
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>	
	</div><!-- end global-content -->
</body>
</html>	
	
	