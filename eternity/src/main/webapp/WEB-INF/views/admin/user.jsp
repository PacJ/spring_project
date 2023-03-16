<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	
</script>


<div class="container-fluid mt-5 mb-5 content_area">
	<div class="card">
		<h5 class="card-header">회원현황</h5>
		<div class="card-body">

			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-6">
					<form action="searchUser" method="post">
						<div class="input-group mb-3">
							<select class="form-select" name="option">
								<option value="nmq">회원명</option>
								<option value="idq">아이디</option>
							</select> <input type="text" class="form-control" name="search"
								placeholder="검색어를 입력하세요.">
							<button class="btn btn-outline-primary" type="submit">검색</button>
						</div>
					</form>
				</div>

			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">아이디</th>
						<th scope="col">회원명</th>
						<th scope="col">성별</th>
						<th scope="col">주소</th>
						<th scope="col">생년월일</th>
						<th scope="col" class=" text-end">〓</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty searchdtos }">

						<c:forEach var="dto" items="${dtos }" varStatus="status">

							<!-- 반복 -->
							<tr>
								<th class="align-middle" scope="row">${status.count }:</th>
								<td class="align-middle">${dto.user_id }</td>
								<td class="align-middle">${dto.user_name }</td>
								<td class="align-middle">${dto.user_sex }</td>
								<td class="align-middle">${dto.user_address }</td>
								<td class="align-middle">${dto.user_age }</td>
								<td class="align-middle text-end">
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-danger fw-bold"
										data-bs-toggle="modal"
										data-bs-target="#userDelModal${dto.user_id}">직권탈퇴</button> <!-- Modal -->
									<div class="modal fade" id="userDelModal${dto.user_id}"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-5" id="info">${dto.user_name}님
														: ${dto.user_id}</h1>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>

												</div>
												<div class="modal-body text-start">
													<p>직권탈퇴를 진행하시겠습니까?</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">취소</button>
													<form action="deleteUser" method="post">
														<input type="hidden" name="user_id" value=${dto.user_id }>
														<button type="submit" class="btn btn-danger">직권탈퇴</button>
													</form>
												</div>
											</div>
										</div>
									</div>

								</td>
							</tr>
						</c:forEach>

						<!-- 반복 -->
					</c:if>
					<c:if test="${not empty searchdtos }">
					<c:forEach var="dto" items="${searchdtos }" varStatus="status">
					  
					<!-- 반복 -->
					<tr>
						<th class="align-middle" scope="row">${status.count }:</th>
						<td class="align-middle" >${dto.user_id }</td>
						<td class="align-middle">${dto.user_name }</td>
						<td class="align-middle">${dto.user_sex }</td>
						<td class="align-middle">${dto.user_address }</td>
						<td class="align-middle">${dto.user_age }</td>
						<td class="align-middle text-end">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-danger fw-bold" data-bs-toggle="modal" data-bs-target="#userDelModal${dto.user_id}" >직권탈퇴</button>
							
							<!-- Modal -->
							<div class="modal fade" id="userDelModal${dto.user_id}" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="info">${dto.user_name}님 : ${dto.user_id}</h1>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											
										</div>
										<div class="modal-body text-start">
											<p>직권탈퇴를 진행하시겠습니까?</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
											<form action="deleteUser" method="post">
												<input type="hidden" name="user_id" value=${dto.user_id }>		
												<button type="submit" class="btn btn-danger">직권탈퇴</button>
											</form>
										</div>
									</div>
								</div>
							</div>

						</td>
					</tr>
					</c:forEach>
					
					<!-- 반복 -->
					</c:if>
					

				</tbody>
			</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&lsaquo;</span>
					</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&rsaquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>