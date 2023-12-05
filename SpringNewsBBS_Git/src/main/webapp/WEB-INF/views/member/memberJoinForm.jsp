<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	<!-- content 영역 -->
	<div class="row" id="global-content">		
		<div class="col-6 offset-3 border rounded-4 mt-5">
		
			<div class="row mb-3">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center py-4 ">JOIN</h2>					
				</div>		
			</div>
			
			<form action="memberJoinResult" name="memberjoinForm" id="memberjoinForm" method="post">
				<input type="hidden" name="isIdCheck" id="isIdCheck" value="false">
				
				<div class="row">
					<div class="colr">	
					
						<div class="row">
							<div class="col-8 offset-2">							
								<div class="row">
									<div class="col-5">
										<input type="text" class="form-control" name="id" id="userId" placeholder="아이디">
									</div>
									<div class="col-4">
										<input type="button" 
											class="btn btn-outline-secondary" id="btnOverlapId" value="중복확인">
									</div>
								</div>
							</div>					
						</div>
						
						<div class="row my-3">
							<div class="col-3 offset-2">							
								<input type="password" class="form-control" name="pass1" id="userPass" placeholder="비밀번호">
							</div>					
						</div>
						
						<div class="row my-3">
							<div class="col-3 offset-2">
								<input type="text" class="form-control" name="name" id="userName" placeholder="이름">
							</div>					
						</div>
						
						<div class="row">
							<div class="col-7 offset-2">							
								<div class="row">
									<div class="col">
										<input type="text" class="form-control" name="emailId" id="emailId" placeholder="이메일">
									</div> @
									<div class="col">
										<input type="text" class="form-control" name="emailDomain" id="emailDomain">
									</div>
									<div class="col">
										<select class="form-select" name="selectDomain" id="selectDomain">
											<option>직접입력</option>
											<option>네이버</option>
											<option>다음</option>
											<option>구글</option>
											<option>카카오</option>
										</select>
									</div>
								</div>						
							</div>					
						</div>	
					</div>
				</div>

				<div class="row my-3">
					<div class="col-7 offset-2">
						<div class="row">
							<div class="col-4">
								<input type="text" class="form-control" name="zipcode" placeholder="우편번호"
									id="zipcode" maxlength="5" readonly >
							</div>
							<div class="col-2">
								<input type="button" 
									class="btn btn-outline-secondary" id="btnZipcode" value="찾기">
							</div>
						</div>
					</div>					
				</div>
				<div class="row my-3">
					<div class="col-7 offset-2">
						<input type="text" class="form-control" placeholder="주소"
							name="address1" id="address1" readonly>
					</div>					
				</div>
				<div class="row my-3">
					<div class="col-7 offset-2">
						<input type="text" class="form-control" name="address2" id="address2" placeholder="상세주소">
					</div>					
				</div>
				
				<div class="row my-3">
					<div class="col-7 offset-2">
						<div class="row">
							<div class="col">
								<select class="form-select" name="mobile1" id="mobile1">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select>
							</div> -
							<div class="col">
								<input type="text" class="form-control" name="mobile2" id="mobile2">
							</div> -
							<div class="col">
								<input type="text" class="form-control" name="mobile3" id="mobile3">
							</div>
						</div>						
					</div>					
				</div>	

						
				<div class="row my-5">
					<div class="col-2 offset-4 text-center">
						<input type="submit" value="가입하기" class="btn btn-outline-secondary">												
					</div>
					<div class="col-2">
						<input type="button" value="뒤로가기" class="btn btn-outline-secondary"
							onclick="location.href='boardList'">												
					</div>					
				</div>
					
			</form>		
		</div>
	</div>		