<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- /myapp 현재프로젝트 경로 리턴 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- 공지사항 리스트 -->
<section class="subpage_wrap notice_wrap">
	<div class="inner">
		<h2>도서관 소식</h2>
		<div class="contents">
			<div class="notice_top">
				<p>NO</p>
				<p>제목</p>
				<p>작성자</p>
				<p>작성일</p>
				<p>조회</p>
			</div>

			<div>
				<c:forEach items="${topList}" var="tdto">
					<div class="notice_Y">
						<p>-</p>
						<p>
							<c:url var="path" value="info">
								<c:param name="currentPage" value="${pv.currentPage}" />
								<c:param name="num" value="${tdto.num}" />
							</c:url>
							<a href="${path}"><b>${tdto.subject}</b></a>
							<%-- 첨부파일있으면 --%>
							<c:if test="${!empty tdto.upload_file}">
								<span><strong>F</strong></span>
							</c:if>
							<%-- 사진첨부있으면 --%>
							<c:if test="${!empty tdto.upload_img}">
								<span><strong>I</strong></span>
							</c:if>
						</p>
						<p>${tdto.adminname}</p>
						<p>${tdto.regdate}</p>
						<p>${tdto.readcount}</p>
					</div>
				</c:forEach>
				
				<c:forEach items="${topList}" var="tdto">
				<div class="notice_Y_mob">
					<h3>
						<c:url var="path" value="info">
							<c:param name="currentPage" value="${pv.currentPage}" />
							<c:param name="num" value="${tdto.num}" />
						</c:url>
						<a href="${path}"><b>${tdto.subject}</b></a>
					</h3>
					<p>${tdto.adminname} ｜ ${tdto.regdate} | ${tdto.readcount}</p>
				</div>
				</c:forEach>

				<c:set var="num" value="${pv.number}"/>
				<c:forEach items="${aList}" var="dto">
				<div class="notice_N">
					<p>${num}</p>
					<p>
						<c:url var="path" value="info">
				            <c:param name="currentPage" value="${pv.currentPage}" />
				            <c:param name="num" value="${dto.num}" />
			            </c:url>
				
						<a href="${path}"> ${dto.subject}</a>
						
						<%-- 첨부파일있으면 --%>
						<c:if test="${!empty dto.upload_file}">
							<span><strong>F</strong></span>
						</c:if>
						<%-- 사진첨부있으면 --%>
						<c:if test="${!empty dto.upload_img}">
							<span><strong>I</strong></span>
						</c:if>
					</p>
					<p>${dto.adminname}</p>
					<p>${dto.regdate}</p>
					<p>${dto.readcount}</p>
				</div>
				<c:set var="num" value="${num-1}"></c:set>
				</c:forEach>
				
				<c:set var="num" value="${pv.number}"/>
				<c:forEach items="${aList}" var="dto">
				<div class="notice_N_mob">
					<h3>
			            <c:url var="path" value="info">
				            <c:param name="currentPage" value="${pv.currentPage}" />
				            <c:param name="num" value="${dto.num}" />
			            </c:url>
				
						<a href="${path}"> ${dto.subject}</a>
					</h3>
					<p>${dto.adminname} ｜ ${dto.regdate} | ${dto.readcount}</p>
				</div>
				<c:set var="num" value="${num-1}"></c:set>
				</c:forEach>	

			</div>

			<div class="pagination_area">
				<ul class="pagination">
					<!-- 처음 출력 시작 -->
					<c:choose>
						<c:when test="${pv.startPage >1}">
							<li class="page-item disabled">
								<a class="page-link" style="cursor: pointer;" href="notice?currentPage=1" >
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
								<a class="page-link" style="cursor: pointer;" href="notice?currentPage=${pv.startPage-pv.blockPage}">
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
									<a class="page-link" style="cursor: pointer;" href="notice?currentPage=${i}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" style="cursor: pointer;" href="notice?currentPage=${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 페이지번호 출력 끝 -->

					<!-- 다음 출력 시작 -->
					<c:choose>
						<c:when test="${pv.endPage < pv.totalPage}">
							<li class="page-item">
								<a class="page-link" style="cursor: pointer;" href="notice?currentPage=${pv.startPage + pv.blockPage}">
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
								<a class="page-link" style="cursor: pointer;" href="notice?currentPage=${pv.totalPage}">
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

			<c:if test="${pv.totalCount==0}">
				<p class="not_cont">등록된 게시글이 없습니다.</p>
			</c:if>
			

		</div>
	</div>
</section>