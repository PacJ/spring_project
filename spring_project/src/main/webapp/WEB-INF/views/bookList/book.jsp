<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="/myapp/resources/resources/js/jquery.star-rating-svg.js"></script>
<link rel="stylesheet" type="text/css" href="/myapp/resources/css/star-rating-svg.css">
</head>
<!-- /myapp 프로젝트 경로 리턴 -->
<c:set var = "contextPath" value = "${pageContext.request.contextPath}"/> 

<!-- 후기 작성 -->
	<form id = "frm" method = "get" action = "writeRev.do">
		<input type = "submit" id = "btnWrite" value = "글쓰기"/>
	</form>
	
	<p>${contextPath }</p>
	<!-- 후기 리스트 -->
	<table>
		<tr>
			<th>NO.</th>
			<th>작성자</th>
			<th>내용</th>
		</tr>
		
		<c:forEach items = "${revList}" var = "dto">
			<tr>
				<td>${dto.reviewKeynum}</td>
				<c:url var = "path" value = "review.do">
					<c:param name = "currentPage" value= "${pv.currentPage}"/>
					<c:param name = "num" value = "${dto.reviewKeynum}"/>
				</c:url>
				<td>${dto.userId}</td>
				<td>${dto.reviewContents}</td>
			</tr>
		</c:forEach>
		
	</table>
		<div class="pagination_area">
				<ul class="pagination">
					<!-- 처음 출력 시작 -->
					<c:choose>
						<c:when test="${pv.startPage >1}">
							<li class="page-item disabled">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=1" >
									<img style="opacity: .5;" src="/myapp/resources/assets/images/first.svg">
									<span>first</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
								<a class="page-link" style="cursor: no-drop">
									<img style="opacity: .2;" src="/myapp/resources/assets/images/first.svg">
									<span>first</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					<!-- 처음 출력 끝 -->				

					<!-- 이전 출력 시작 -->
					<c:choose>
						<c:when test="${pv.startPage >1}">
							<li class="page-item disabled">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=${pv.startPage-pv.blockPage}">
									<img style="opacity: .5;" src="/myapp/resources/assets/images/prev.svg">
									<span>prev</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
								<a class="page-link" style="cursor: no-drop">
									<img style="opacity: .2;" src="/myapp/resources/assets/images/prev.svg">
									<span>prev</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					<!-- 이전 출력 끝 -->

					<!-- 페이지번호 출력 시작 -->
					<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
						<c:choose>
							<c:when test="${i==pv.currentPage}">
								<li class="page-item active">
									<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=${i}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 페이지번호 출력 끝 -->

					<!-- 다음 출력 시작 -->
					<c:choose>
						<c:when test="${pv.endPage < pv.totalPage}">
							<li class="page-item">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=${pv.startPage + pv.blockPage}">
									<img style="opacity: .5;" src="/myapp/resources/assets/images/next.svg">
									<span>next</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" style="cursor: no-drop">
									<img style="opacity: .2;" src="/myapp/resources/assets/images/next.svg">
									<span>next</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					<!-- 다음 출력 끝 -->
		
					<!-- 마지막 출력 시작 -->
					<c:choose>
						<c:when test="${pv.endPage < pv.totalPage}">
							<li class="page-item">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=${pv.totalPage}">
								<img style="opacity: .5;" src="/myapp/resources/assets/images/last.svg">
								<span>last</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" style="cursor: no-drop">
								<img style="opacity: .2;" src="/myapp/resources/assets/images/last.svg">
								<span>last</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					<!-- 마지막 출력 끝 -->

				</ul>
			</div>
