<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="subpage_wrap">
	<div class="inner">
		<h2>나의 도서관</h2>
		<div class="contents my_area">
			<p class="books_tab">
				<a class="books_tab_1" href="${pageContext.request.contextPath}/my">회원정보 관리</a> <span>&nbsp;&nbsp;·&nbsp;&nbsp;</span>
				<a class="books_tab_2" href="${pageContext.request.contextPath}/my/record">도서관 이용 이력</a> <span>&nbsp;&nbsp;·&nbsp;&nbsp;</span>
				<br /> <a class="books_tab_3 active" href="${pageContext.request.contextPath}/my/recommend">맞춤도서추천</a> <span>&nbsp;&nbsp;·&nbsp;&nbsp;</span>
				<a class="books_tab_4" href="${pageContext.request.contextPath}/my/map">가까운 도서관</a>
			</p>

			<!-- 맞춤도서추천 -->
			<div class="my_tab_cont_3 active">
			<table>
				<tr>
					<th>ISBN</th>
					<th>제목</th>
					<th>저자</th>
					<th>출판연도</th>
					<th></th>
					<th></th>
				</tr>
				
				<c:forEach items="${recomList }" var="recomList">
							<tr>
								<td>${recomList.isbn }</td>
								<td>${recomList.bookname }</td>
								<td>${recomList.author }</td>
								<td>${recomList.pubYear }</td>
								<td>
									<form method="GET" action="/myapp/books/search">
										<input type="hidden" name="search_item" value="search_title" />
										<input type="hidden" name="categories" value="a" />
										<input type="hidden" name="query" value="${recomList.bookname }" />
										<button type="submit">통합 도서 조회하기</button>
									</form>
								</td>
								<td><a href="${pageContext.request.contextPath}/my/">도서 신청하기</a></td>
							</tr>
				</c:forEach>
			</table>
			</div>

		</div>
	</div>
</section>