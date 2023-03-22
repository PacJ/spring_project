
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 공지사항 리스트 -->
<section class="subpage_wrap notice_wrap">
	<div class="inner">
		<p>${userDTO.user_name}님의 도서관.</p>
	<!-- 나의 도서 관리 -->
		<table>
			<caption>나의 도서 관리</caption>
			<thead>
				<tr>
					<th>도서번호</th>
					<th>대출 현황</th>
	        		<th>반납 예정일</th>
	        		<th>대출 연장 여부</th>
	        		<th>대출 연장 신청</th>
	        		<th>예약 취소 신청</th>
	        		<th>반납 신청</th>
				</tr>
			</thead>
			<c:forEach var="cdto" items="${CurrBookList }" varStatus="status">
				<tr>
					<td>${cdto.book_keynum }</td>
					<td>${cdto.borrow_state }</td>
					<c:set var="returnDueDate">
  						<fmt:formatDate value="${cdto.return_due_date }" pattern="yyyy년 M월 d일"/>
					</c:set>
					<td>${returnDueDate }</td>
					<td>${cdto.return_extend }</td>
					<!-- 도서 연장 신청 -->
					<td>
						<c:if test="${fn:contains(cdto.return_extend, 'N') && cdto.borrow_state != '예약중'}">
                			<form id="extendForm_${cdto.borrow_keynum}" method="post" action="extend">
                   				<input type="hidden" name="borrow_keynum" value="${cdto.borrow_keynum }" />
                   				<input type="hidden" name="book_keynum" value="${cdto.book_keynum }" />
                   				<button type="submit">신청</button>
                			</form>
            			</c:if>
					</td>
					<!-- 예약 취소 신청 -->
					<td>
						<c:if test="${fn:contains(cdto.borrow_state, '예약중')}">
                			<form id="cancelForm_${cdto.borrow_keynum}" method="post" action="cancelReserve">
                   				<input type="hidden" name="borrow_keynum" value="${cdto.borrow_keynum }" />
                   				<input type="hidden" name="book_keynum" value="${cdto.book_keynum }" />
                   				<button type="submit">취소</button>
                			</form>
            			</c:if>
					</td>
					<!-- 도서 반납 신청 -->
					<td>
						<c:if test="${fn:contains(cdto.borrow_state, '대출중')}">
                			<form id="returnForm_${cdto.borrow_keynum}" method="post" action="return">
                   				<input type="hidden" name="borrow_keynum" value="${cdto.borrow_keynum }" />
                   				<button type="submit">반납</button>
                			</form>
            			</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 나의 도서 이력 -->
		<table>
			<caption>나의 도서 이력</caption>
			<thead>
				<tr>
					<th>도서번호</th>
	        		<th>대출 현황</th>
	        		<th>대출일</th>
	        		<th>반납일</th>
				</tr>
			</thead>
			<c:forEach var="pdto" items="${PastBookList }" varStatus="status">
				<tr>
					<td>${pdto.book_keynum }</td>
					<td>${pdto.borrow_state }</td>
					<c:set var="borrowDate">
  						<fmt:formatDate value="${pdto.borrow_date }" pattern="yyyy년 M월 d일"/>
					</c:set>
					<td>${borrowDate }</td>
					<c:set var="returnDate">
  						<fmt:formatDate value="${pdto.return_date }" pattern="yyyy년 M월 d일"/>
					</c:set>
					<td>${returnDate }</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 나의 정보 관리 -->
		<table>
			<caption>나의 정보</caption>
			<thead>
				<tr>
					<th>이름</th>
	        		<th>나이</th>
	        		<th>성별</th>
	        		<th>주소</th>
	        		<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${userDTO.user_id}</td>
					<td>${userDTO.user_age }</td>
					<td>${userDTO.user_sex }</td>
					<td>${userDTO.user_address }</td>
					<c:set var="signDate">
  						<fmt:formatDate value="${userDTO.sign_date }" pattern="yyyy년 M월 d일"/>
					</c:set>
  					<td>${signDate}</td>
				</tr>
			</tbody>
		</table>
		<p>
			<a href="${pageContext.request.contextPath}/my/editmyinfo">나의 정보 수정</a>
		</p>
		<p>
			<a href="${pageContext.request.contextPath}/my/withdraw">탈퇴 신청</a>
		</p>
	</div>
</section>