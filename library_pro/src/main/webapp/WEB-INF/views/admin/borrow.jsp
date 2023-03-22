<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid mt-5 mb-5 content_area">
	<div class="card">
		<h5 class="card-header">도서대출관리</h5>
		<div class="card-body">

			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-6">
					<form>
						<div class="input-group mb-3">
							<select class="form-select">
								<option value="">도서명</option>
								<option value="">대출상태</option>
								<option value="">대출회원아이디</option>
							</select> <input type="text" class="form-control"
								placeholder="검색어를 입력하세요.">
							<button class="btn btn-outline-primary" type="button">검색</button>
						</div>
					</form>
				</div>

			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">도서번호</th>
						<th scope="col">도서명</th>
						<th scope="col">회원아이디</th>
						<th scope="col">대출일</th>
						<th scope="col">반납예정일</th>
						<th scope="col">반납일</th>
						<th scope="col">반납연장여부</th>
						<th scope="col">대출상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- 반복 -->

					<c:choose>
						<c:when test="${empty searchBorrowdtos  and not empty borrowdtos}">
							<c:set var="Num" value="${number}" />
							<c:forEach items="${borrowdtos }" var="dto">
								<tr>
									<th class="align-middle" scope="row">${Num }</th>
									<td class="align-middle">${dto.book_keynum }</td>
									<td class="align-middle">${dto.title }.</td>
									<td class="align-middle">${dto.user_id }</td>
									<td class="align-middle">${dto.borrow_date }</td>
									<td class="align-middle">${dto.return_due_date }</td>


									<c:choose>
										<c:when test="${dto.return_date eq null }">
											<td class="align-middle"></td>
										</c:when>
										<c:otherwise>
											<td class="align-middle">${dto.return_date }</td>
										</c:otherwise>

									</c:choose>




									<td class="align-middle">${dto.return_extend }</td>
									<td class="align-middle">${dto.borrow_state }</td>
								</tr>
								<c:set var="Num" value="${Num-1}" />
							</c:forEach>
						</c:when>
						<c:when test="">
							<tr>
								<th class="align-middle" scope="row">1</th>
								<td class="align-middle">111</td>
								<td class="align-middle">책 제목입니다.</td>
								<td class="align-middle">abc1234</td>
								<td class="align-middle">0000-00-00</td>
								<td class="align-middle">0000-00-00</td>
								<td class="align-middle"></td>
								<td class="align-middle">Y</td>
								<td class="align-middle">대출</td>
							</tr>
						</c:when>
					</c:choose>

					<!-- 반복 -->
				</tbody>
			</table>

			<div class="pagination_area">
				<ul class="pagination justify-content-center">
					<!-- 처음 출력 시작 -->
					<c:choose>
						<c:when test="${not empty searchResultPv }">
							<c:choose>
								<c:when test="${searchResultPv.startPage >1}">
									<li class="page-item"><a class="page-link"
										href="searchUser?option=${option}&search=${query}&currentPage=1"
										aria-label="Previous"><span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="searchUser?option=${option}&search=${query}&currentPage=1"
										aria-label="Previous"><span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 처음 출력 끝 -->

							<!-- 이전 출력 시작 -->
							<c:choose>
								<c:when test="${searchResultPv.startPage >1}">
									<li class="page-item"><a class="page-link"
										style="cursor: pointer;"
										href="searchUser?option=${option}&search=${query}&currentPage=${searchResultPv.startPage-searchResultPv.blockPage}">
											> <span>&lsaquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										style="cursor: no-drop"> <span>&lsaquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 이전 출력 끝 -->

							<!-- 페이지번호 출력 시작 -->
							<c:forEach var="i" begin="${searchResultPv.startPage}"
								end="${searchResultPv.endPage}">
								<c:choose>
									<c:when test="${i==searchResultPv.currentPage}">
										<li class="page-item active"><a class="page-link"
											style="cursor: pointer;"
											href="searchUser?option=${option}&search=${query}&currentPage=${i}">${i}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											style="cursor: pointer;"
											href="searchUser?option=${option}&search=${query}&currentPage=${i}">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 페이지번호 출력 끝 -->

							<!-- 다음 출력 시작 -->
							<c:choose>
								<c:when
									test="${searchResultPv.endPage < searchResultPv.totalPage}">
									<li class="page-item"><a class="page-link"
										style="cursor: pointer;"
										href="searchUser?option=${option}&search=${query}&currentPage=${searchResultPv.startPage + searchResultPv.blockPage}">
											<span>&rsaquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										style="cursor: no-drop"> <span>&rsaquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 다음 출력 끝 -->

							<!-- 마지막 출력 시작 -->
							<c:choose>
								<c:when
									test="${searchResultPv.endPage < searchResultPv.totalPage}">
									<li class="page-item"><a class="page-link"
										style="cursor: pointer;"
										href="searchUser?option=${option}&search=${query}&currentPage=${searchResultPv.totalPage}">
											<span>&raquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										style="cursor: no-drop"> <span>&raquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${empty searchResultPv and not empty pv}">
							<c:choose>
								<c:when test="${pv.startPage >1}">
									<li class="page-item"><a class="page-link"
										style="cursor: pointer;" href="user?currentPage=1"> <span>&laquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										style="cursor: no-drop"> <span>&laquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 처음 출력 끝 -->

							<!-- 이전 출력 시작 -->
							<c:choose>
								<c:when test="${pv.startPage >1}">
									<li class="page-item"><a class="page-link"
										style="cursor: pointer;"
										href="user?currentPage=${pv.startPage-pv.blockPage}"> <span>&lsaquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										style="cursor: no-drop"> <span>&lsaquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 이전 출력 끝 -->

							<!-- 페이지번호 출력 시작 -->
							<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
								<c:choose>
									<c:when test="${i==pv.currentPage}">
										<li class="page-item active"><a class="page-link"
											style="cursor: pointer;" href="user?currentPage=${i}">${i}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											style="cursor: pointer;" href="user?currentPage=${i}">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 페이지번호 출력 끝 -->

							<!-- 다음 출력 시작 -->
							<c:choose>
								<c:when test="${pv.endPage < pv.totalPage}">
									<li class="page-item"><a class="page-link"
										style="cursor: pointer;"
										href="user?currentPage=${pv.startPage + pv.blockPage}"> <span>&rsaquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										style="cursor: no-drop"> <span>&rsaquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 다음 출력 끝 -->

							<!-- 마지막 출력 시작 -->
							<c:choose>
								<c:when test="${pv.endPage < pv.totalPage}">
									<li class="page-item"><a class="page-link"
										style="cursor: pointer;"
										href="user?currentPage=${pv.totalPage}"> <span>&raquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										style="cursor: no-drop"> <span>&raquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>
						</c:when>


					</c:choose>
				</ul>

			</div>
		</div>
	</div>