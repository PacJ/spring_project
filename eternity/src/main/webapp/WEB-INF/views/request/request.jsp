<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 희망도서신청 -->
<section class="subpage_wrap">
	<div class="inner">
		<h2>희망도서신청</h2>
		<div class="contents request_area">
			<c:set var="index" value="${1}" />
			<p class="books_tab">
				<a class="books_tab_1 active" onclick="<c:set var="index" value="${1}"/>">도서신청</a>
				·
				<a class="books_tab_2" onclick="<c:set var="index" value="${2}"/>">신청내역</a>
			</p>

			<div class="request_tab_cont_1 active">
				<div class="books_search_area">
					<form action="" method="">
						<select name="search_item">
							<option value="search_title" selected="selected">도서명</option>
							<option value="search_author">저자명</option>
							<option value="search_publisher">발행처</option>
						</select>
						<input type="text" placeholder="검색어를 입력하세요.">
						<input type="hidden" value="">
						<button type="button">
							<img src="/myapp/resources/assets/images/search_icon.png" alt="돋보기 검색 아이콘">
						</button>
					</form>
				</div>

				<div class="request_bookset">
					<div class="inner">
						<div class="request_book">
							<img src="/myapp/resources/assets/images/book.png" alt="책 표지" />
							<div class="request_text">
								<h4>여기에 도서명이 들어갑니다.여기에 도서명이 들어갑니다.여기에 도서명이 들어갑니다.</h4>
								<p>저자 :</p>
								<p>출판사 :</p>
								<button>선택</button>
							</div>
						</div>
						<div class="request_book">
							<img src="/myapp/resources/assets/images/book.png" alt="책 표지" />
							<div class="request_text">
								<h4>여기에 도서명이 들어갑니다.여기에 도서명이 들어갑니다.여기에 도서명이 들어갑니다.</h4>
								<p>저자 :</p>
								<p>출판사 :</p>
								<button>선택</button>
							</div>
						</div>
						<div class="request_book">
							<img src="/myapp/resources/assets/images/book.png" alt="책 표지" />
							<div class="request_text">
								<h4>여기에 도서명이 들어갑니다.여기에 도서명이 들어갑니다.여기에 도서명이 들어갑니다.</h4>
								<p>저자 :</p>
								<p>출판사 :</p>
								<button>선택</button>
							</div>
						</div>
						<div class="request_book">
							<img src="/myapp/resources/assets/images/book.png" alt="책 표지" />
							<div class="request_text">
								<h4>여기에 도서명이 들어갑니다.여기에 도서명이 들어갑니다.여기에 도서명이 들어갑니다.</h4>
								<p>저자 :</p>
								<p>출판사 :</p>
								<button>선택</button>
							</div>
						</div>
						<p class="request_no">검색 결과가 존재하지 않습니다.</p>
					</div>
				</div>

				<div class="request_form">
					<div class="inner">
						<h4>선택 도서정보</h4>
						<img src="/myapp/resources/assets/images/none_img.png" alt="책 표지" />
						<!-- <p>선택된 도서가 없습니다.<br />도서검색 후 신청할 도서를 선택해주세요.</p> -->
						<ul>
							<li>여기에 제목이 들어갑니다. 여기에 제목이 들어갑니다.</li>
							<li>
								저자 :
								<span> 김누구, 이누구</span>
							</li>
							<li>
								출판사 :
								<span>창비</span>
							</li>
						</ul>
					</div>
					<div class="inner">
						<h4>신청 사유</h4>
						<form>
							<textarea class="request_input" placeholder="신청사유를 작성해주세요."></textarea>
							<input type="hidden" value="" />
							<button type="submit">도서신청</button>
						</form>
					</div>
				</div>

			</div>

			<div class="request_tab_cont_2">
				<%
				out.flush();
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("list.jsp");
				dispatcher1.include(request, response);
				%>
			</div>

		</div>
	</div>
</section>


<script>
	$('.books_tab_1').on('click', function() {
		if (!$('.request_tab_cont_1').hasClass('active')) {
			$('.books_tab_1').addClass('active');
			$('.books_tab_2').removeClass('active');
			
			$('.request_tab_cont_1').addClass('active');
			$('.request_tab_cont_2').removeClass('active');
		}
	});
	
	$('.books_tab_2').on('click', function() {
		if (!$('.request_tab_cont_2').hasClass('active')) {
			$('.books_tab_2').addClass('active');
			$('.books_tab_1').removeClass('active');
			
			$('.request_tab_cont_2').addClass('active');
			$('.request_tab_cont_1').removeClass('active');
		}
	});
</script>