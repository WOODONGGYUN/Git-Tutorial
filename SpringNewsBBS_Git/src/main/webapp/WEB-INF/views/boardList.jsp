<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<style>
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}
</style>

    
<!-- content 영역 -->
<div class="row p-3" id="global-content">
	<div class="col-10 offset-1">

	<!-- 검색 요청이면서 게시 글이 있는 경우 -->
	<c:if test="${searchOption and not empty bList}">
	<div class="row">
		<div class="col-1 fw-bold text-start border-end">
			<div class="row">
				<div class="col my-2 border-bottom p-2">경제</div>
			</div>			
		</div>
		
		<div class="col-7 border-end">
			<div class="row p-3 ">
				<div class="col p-2 border-bottom fw-bold">
					헤드라인 뉴스
				</div>
			</div>
			
			<c:forEach var="headline" items="${headlines}" 
					varStatus="loop" begin="${i}" end="${i}">
			    ${headline.text()}<br>
			</c:forEach>
			
			<c:forEach var="b" items="${bList}">
			<input type="hidden" name="no" value="${ b.no }">
			<div class="row p-2">
				<div class="col-3 border-bottom pb-3">
					<a href="boardDetail?no=${b.no }" class="text-decoration-none link-secondary ">
					<img src="resources/img/${ b.file1 }" width="150" height="100"></a>
				</div>
				<div class="col-9 border-bottom p-4">
					<div class="row">
						<div class="col fw-bold">
						<a href="boardDetail?no=${b.no }&pageNum=${currentPage}" 
							class="text-decoration-none link-secondary ">
						${b.title }
						</a>						
						</div>
					</div>
					<div class="row">
						<div class="col pt-2">${b.office }</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
		</div>
		
		<div class="col-4">
			<div class="row">	
				<div class="col my-2 p-3 fw-bold">가장 많이 본 뉴스</div>
			</div>
		<c:forEach var="p" items="${pBList}">
			<div class="row">
				<div class="col-8 my-2">
					<a href="boardDetail?no=${p.no }" class="text-decoration-none link-secondary">
						${p.title }</a>
				</div>
				<div class="col-4 my-2">
					<img src="resources/img/${ p.file1 }" width="80" height=60">
				</div>
			</div>
		</c:forEach>
		</div>
		
	</div>
	</c:if>	
		
		
	<!-- 검색이 아니면서 게시 글이 있는 경우 -->
	<c:if test="${not searchOption and not empty bList}">
	<div class="row">
		<div class="col-1 fw-bold text-start border-end">
			<div class="row">
				<div class="col my-2 border-bottom p-2">경제</div>
			</div>			
		</div>
		
		<div class="col-7 border-end">
			<div class="row p-3 ">
				<div class="col p-2 border-bottom fw-bold">
					헤드라인 뉴스
				</div>
				<div class="col p-2 border-bottom fw-bold">
					
			

				</div>
			</div>
			
			<c:forEach var="b" items="${bList}">
			<input type="hidden" name="no" value="${ b.no }">
			<div class="row p-2">
				<div class="col-3 border-bottom pb-3">
					<a href="boardDetail?no=${b.no }" class="text-decoration-none link-secondary ">
					<img src="resources/img/${ b.file1 }" width="150" height="100"></a>
				</div>
				<div class="col-9 border-bottom p-4">
					<div class="row">
						<div class="col fw-bold">
						<a href="boardDetail?no=${b.no }" class="text-decoration-none link-secondary ">
						
						<c:forEach var="headline" items="${headlines}" 
								varStatus="loop" begin="${i}" end="${i}">
						    ${headline.text()}<br>
						</c:forEach>
						
						</a>						
						</div>
					</div>
					<div class="row">
						<div class="col pt-2">${b.office }</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
		</div>

		<div class="col-4">
			<div class="row">	
				<div class="col my-2 p-3 fw-bold">가장 많이 본 뉴스</div>
			</div>
		<c:forEach var="p" items="${pBList}">
			<div class="row">
				<div class="col-8 my-2">
					<a href="boardDetail?no=${p.no }" class="text-decoration-none link-secondary">
						${p.title }</a>
				</div>
				<div class="col-4 my-2">
					<img src="resources/img/${ p.file1 }" width="80" height=60">
				</div>
			</div>
		</c:forEach>
			
			
		
		</div>
	</div>
	</c:if>	
	
	
		
	<!-- 검색 요청일 때 게시 글이 없는경우  -->
	<c:if test="${searchOption and empty bList}">
		<div class="row">
			<div class="col my-5 text-center">"${keyword}"가 포함된 게시 글이 존재하지 않음</div>
		</div>
	</c:if>
	
	<!-- 일반 리스트 요청일 때 게시 글이 없는경우  -->
	<c:if test="${not searchOption and empty bList}">
		<div class="row">
			<div class="col my-5 text-center">게시 글이 존재하지 않음</div>
		</div>
	</c:if>
		
	
		
	</div> <!-- content 끝 -->
</div>

		<!-- 검색 -->
		<div class="row">
			<div class="col" text-center">
			
		<form name="searchForm" id="searchForm" action="#"
				class="row my-3 mt-5">
			<div class="col-1 offset-4">
				<select name="type" class="form-select">
					<option value="title">제목</option>
					<option value="writer">뉴스매체</option>
					<option value="content">내용</option>
				</select>
			</div>
			<div class="col-3">
				<input type="text" name="keyword" class="form-control"/>
			</div>
			<div class="col-2">
				<input type="submit" value="검 색" class="btn btn-outline-secondary"/>
			</div>	
		</form>
		
			</div>
		</div>

		<!-- 검색 요청이면서 페이지네이션이 존재할 경우 -->	
		<c:if test="${searchOption and not empty bList }">	
		<div class="row">
			<div class="col mt-3">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<c:if test="${ startPage > pageGroup }">
							<li class="page-item">
								<a class="page-link" href="boardList?pageNum=${ startPage -
								pageGroup }&type=${type}&keyword=${keyword}">Pre</a>
							</li>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage }">
								<li class="page-item active" aria-current="page">
									<span class="page-link">${i}</span>
								</li>
							</c:if>
							<c:if test="${i != currentPage }">
								<li class="page-item">
									<a class="page-link" href="boardList?pageNum=${ i }&type=${type}&keyword=${keyword}">${i}</a>
								</li>
							</c:if>	
						</c:forEach>
						
						<c:if test="${ endPage < pageCount }">
							<li class="page-item">
								<a class="page-link" 
									href="boardList?pageNum=${endPage + 1}&type=${type}&keyword=${keyword}">Next</a>
							</li>	
						</c:if>
					</ul>
				</nav>
			</div>			
		</div>
		</c:if>
		
		<!-- 검색 요청이 아니면서 페이지네이션이 존재할 경우 -->	
		<c:if test="${not searchOption and not empty bList }">	
		<div class="row">
			<div class="col mt-3">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<c:if test="${ startPage > pageGroup }">
							<li class="page-item">
								<a class="page-link" href="boardList?pageNum=${ startPage -
								pageGroup }">Pre</a>
							</li>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage }">
								<li class="page-item active" aria-current="page">
									<span class="page-link">${i}</span>
								</li>
							</c:if>
							<c:if test="${i != currentPage }">
								<li class="page-item">
									<a class="page-link" href="boardList?pageNum=${ i }">${i}</a>
								</li>
							</c:if>	
						</c:forEach>
						
						<c:if test="${ endPage < pageCount }">
							<li class="page-item">
								<a class="page-link" href="boardList?pageNum=${endPage + 1}">Next</a>
							</li>	
						</c:if>
					</ul>
				</nav>
			</div>			
		</div>
		</c:if>