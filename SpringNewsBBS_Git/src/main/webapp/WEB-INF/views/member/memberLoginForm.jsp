<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row my-5" id="global-content">
	<div class="col-3 offset-4 text-center">
		<h2 class="fw-bold p-4"><a href="boardList" class="text-decoration-none link-secondary">HOME</a></h2>
		<div class="row">
			<div class="col text-center border rounded-4">
				
				<form class="my-5" id="memberLoginForm" action="memberLogin" method="post">
					<h2 class="fw-bold">Login</h2>
						<div class="row">
							<div class="col my-2">
								<img src="https://www.markuptag.com/images/user-icon.jpg" width="80" height="80" alt="Avatar">
							</div>
						</div>
						
						<div class="row">
							<div class="col-8 offset-2 pt-2">
								<input type="text" id=id name=id class="form-control" placeholder="아이디"/>
							</div>
						</div>
						
						<div class="row">
							<div class="col-8 offset-2 my-2">
								<input type="password" id="pass" name="pass" class="form-control" placeholder="비밀번호"/>
							</div>
						</div>
					
						<div class="row">
							<div class="col-4 offset-4">
								<input type="submit" value="Login" class="form-control" id="btnLogin" />
							</div>
						</div>
					
						<div class="row">
							<div class="col my-4">
								<input type="button" value="회원가입" id="btnJoin" onclick="location.href='memberJoinForm'" class="btn btn-outline-secondary"/>
								<input type="button" value="아이디/비밀번호 찾기" id="btnSearch" onclick="location.href='customerService'" class="btn btn-outline-secondary"/>
							</div>
						</div>
						
						<div class="row">
							<div class="col mt-3">
								<a href="reporterLoginForm" class="text-decoration-none link-secondary">기자이신가요?</a>
							</div>
						</div>
						
				</form>
			</div>
		</div>
	</div>
</div>