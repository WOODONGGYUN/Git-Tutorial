<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	<!-- content 영역 -->
	<div class="row" id="global-content">		
		<div class="col-6 offset-3 border rounded-4 mt-5">
		
			<div class="row mb-3">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center py-4 ">MyPage</h2>					
				</div>		
			</div>
			
			<form action="memberUpdateResult" name="memberUpdateForm" id="memberUpdateForm" method="post">
				
				<div class="row">
					<div class="colr">	
					
						<div class="row">
							<div class="col-8 offset-2">							
								<div class="row">
									<div class="col-5">
										<input type="text" class="form-control" name="id" id="userId" placeholder="아이디"
												value="${sessionScope.member.id}" readonly>
									</div>
									
								</div>
							</div>					
						</div>
						
						<div class="row my-3">
							<div class="col-3 offset-2">							
								<input type="password" class="form-control" id="oldPass" placeholder="비밀번호">
							</div>	
							<div class="col">		
								<input type="button" class="btn btn-outline-secondary" id="btnPassCheck" value="Check">
							</div>					
						</div>
						<div class="row my-3">
							<div class="col-3 offset-2">							
								<input type="password" class="form-control" name="pass1" id="pass1" placeholder="새 비밀번호">
							</div>					
						</div>
						<div class="row my-3">
							<div class="col-3 offset-2">							
								<input type="password" class="form-control" name="pass2" id="pass2" placeholder="새 비밀번호 확인">
							</div>					
						</div>
						
						
						<div class="row my-3">
							<div class="col-3 offset-2">
								<input type="text" class="form-control" name="name" id="userName" placeholder="이름"
										value="${sessionScope.member.name}" readonly>
							</div>					
						</div>
						
						<div class="row">
							<div class="col-7 offset-2">							
								<div class="row">
									<div class="col">
										<input type="text" class="form-control" name="emailId" id="emailId" placeholder="이메일"
												value='${sessionScope.member.email.split("@")[0]}'>
									</div> @
									<div class="col">
										<input type="text" class="form-control" name="emailDomain" id="emailDomain"
												value='${sessionScope.member.email.split("@")[1]}'>
									</div>
									<div class="col">
										<select class="form-select" name="selectDomain" id="selectDomain">
											<option ${sessionScope.member.email.split('@')[1] == 'naver.com' ? 'selected' : ''}>네이버</option>
											<option ${sessionScope.member.email.split('@')[1] == 'daum.net' ? 'selected' : ''}>다음</option>
											<option ${sessionScope.member.email.split('@')[1] == 'google.com' ? 'selected' : ''}>구글</option>
											<option ${sessionScope.member.email.split('@')[1] == 'kakao.com' ? 'selected' : ''}>카카오</option>
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
									id="zipcode" maxlength="5" readonly value="${sessionScope.member.zipcode}">
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
							name="address1" id="address1" readonly value="${sessionScope.member.address1}">
					</div>					
				</div>
				<div class="row my-3">
					<div class="col-7 offset-2">
						<input type="text" class="form-control" name="address2" id="address2" placeholder="상세주소"
								value="${sessionScope.member.address2}">
					</div>					
				</div>
				
				<div class="row my-3">
					<div class="col-7 offset-2">
						<div class="row">
							<div class="col">
								<select class="form-select" name="mobile1" id="mobile1">
									<option ${sessionScope.member.mobile.split('-')[0] == '010' ? 'selected' : ''}>010</option>
									<option ${sessionScope.member.mobile.split('-')[0] == '011' ? 'selected' : ''}>011</option>
									<option ${sessionScope.member.mobile.split('-')[0] == '016' ? 'selected' : ''}>016</option>
									<option ${sessionScope.member.mobile.split('-')[0] == '017' ? 'selected' : ''}>017</option>
									<option ${sessionScope.member.mobile.split('-')[0] == '018' ? 'selected' : ''}>018</option>
									<option ${sessionScope.member.mobile.split('-')[0] == '019' ? 'selected' : ''}>019</option>
								</select>
							</div> -
							<div class="col">
								<input type="text" class="form-control" name="mobile2" id="mobile2"
										value="${sessionScope.member.mobile.split('-')[1]}">
							</div> -
							<div class="col">
								<input type="text" class="form-control" name="mobile3" id="mobile3"
										value="${sessionScope.member.mobile.split('-')[2]}">
							</div>
						</div>						
					</div>					
				</div>	

						
				<div class="row my-5">
					<div class="col-2 offset-4 text-center">
						<input type="submit" value="수정하기" class="btn btn-outline-secondary">												
					</div>
					<div class="col-2">
						<input type="button" value="뒤로가기" class="btn btn-outline-secondary"
							onclick="location.href='boardList'">												
					</div>					
				</div>
					
			</form>		
		</div>
	</div>		