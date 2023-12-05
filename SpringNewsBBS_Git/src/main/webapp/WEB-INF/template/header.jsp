<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header  -->
<div class="row" id="global-header">
	<div class="col-10 offset-1 p-3 border-top border-bottom">
		
		<div class="row">
			<div class="col-2 pb-2">
				<a href="boardList">
				<img alt="" src="resources/img/news2.JPG" height="50" width="120"></a>
			</div>
		
			<div class="col-10">
				<ul class="nav justify-content-end">
					<li class="nav-item">
						<a class="nav-link active" 
					    	href='${sessionScope.isLogin ? "memberLogout" : "memberLoginForm"}'>
					    	${sessionScope.isLogin ? "로그아웃" : " 로그인"}
					    </a>
					</li>
					<li class="nav-item">
						<a class="nav-link" 
							href='${sessionScope.isLogin ? "memberUpdateForm" : "memberJoinForm"}'>
					    	${sessionScope.isLogin ? "정보수정" : " 회원가입"}</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="customerService">고객센터</a>
					</li>
				</ul>
			</div>
		</div>

		
		
		<div class="row">
			<div class="col border-top pt-3">
				<a href="boardList?category="" class="text-decoration-none link-secondary">정치</a>
				<a href="boardList?category=eoconomy" class="text-decoration-none link-secondary">경제</a>
				<a href="boardList?category=society" class="text-decoration-none link-secondary" >사회</a>
			</div>	
			<div class="col border-top pt-3 text-end">
				<a href="writeForm" class="text-decoration-none link-secondary">뉴스 작성</a>
			</div>	
		</div>
		
	</div>
</div>