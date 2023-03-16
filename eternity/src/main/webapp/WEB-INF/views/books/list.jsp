<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 통합도서조회 -->
<section class="subpage_wrap">
	<div class="inner">
		<h2>통합도서조회</h2>
		<div class="contents books_cont">
			<c:set var="index" value="${1}" />

			<p class="books_tab">
				<a class="books_tab_1 active" onclick="<c:set var="index" value="${1}" />">도서조회</a>
				·
				<a class="books_tab_2" onclick="<c:set var="index" value="${2}" />">신착도서</a>
				·
				<a class="books_tab_3" onclick="<c:set var="index" value="${3}" />">인기도서</a>
			</p>

			<div class="books_tab_cont_1 active">
				<div class="books_search_area">
					<form action="" method="">
						<select name="search_item">
							<option value="search_title" selected="selected">도서명</option>
							<option value="search_author">저자명</option>
							<option value="search_publisher">발행처</option>
						</select>
						<input type="text" placeholder="검색어를 입력하세요." />

						<!-- 도서분류값 -->
						<input class="bn_input" type="hidden" value="all" />

						<button type="button">
							<img src="/myapp/resources/assets/images/search_icon.png" alt="돋보기 검색 아이콘" />
						</button>
					</form>
				</div>
				<p class="bn_area">
					<a class="bn_all">전체</a>
					<span>·</span>
					<a class="bn_0">총류</a>
					<span>·</span>
					<a class="bn_1">철학</a>
					<span>·</span>
					<a class="bn_2">종교</a>
					<span>·</span>
					<a class="bn_3">사회과학</a>
					<span>·</span>
					<a class="bn_4">순수과학</a>
					<span>·</span>
					<br />
					<a class="bn_5">기술과학</a>
					<span>·</span>
					<a class="bn_6">예술</a>
					<span>·</span>
					<a class="bn_7">언어</a>
					<span>·</span>
					<a class="bn_8">문학</a>
					<span>·</span>
					<a class="bn_9">역사</a>
				</p>

				<h4 class="booklist_text">
					<!-- 총 <span>0000</span>건 -->
					"<span class="search_text">검색어 검색어 검색어 검색어 검색어 검색어 검색어</span>"에 대한 <span>0000</span>건의 검색 결과
				</h4>

				<div class="booklist_box">
					<div class="list">
						<a href="${pageContext.request.contextPath}/books/view">
							<img src="/myapp/resources/assets/images/book.png" alt="책 표지" />
						</a>
						<div class="list_text">
							<a href="${pageContext.request.contextPath}/books/view">
								<h4>책 제목</h4>
							</a>
							<p>
								저자 :
								<br />
								출판사 :
								<br />
								평점 :
								<span>★4.5</span>
								(24)
							</p>
							<p>구병모 미니픽션 『로렘 입숨의 책』이 안온북스에서 출간되었다. 200자 원고지 50장 내외의 작품 열세 편을 모은 이번 책에서 작가는 그간 보여준 심미적인 색채를 더욱 강렬하게 내뱉는 동시에 눈에 보이지 않는 관념과 의식을 소설화해내는 능력을 여지없이 펼쳐 보인다. 모두 달라 보이는 열세 가지 색감은 소설을 다 읽고서야 도달하게 될 높은 고도에서 내려다보아야만 비로소 그 진면모를 알 수 있다.</p>
						</div>
						<p>
							대출 :
							<span>가능</span>
							<br>
							예약 :
							<span>불가능</span>
						</p>
					</div>

					<div class="list">
						<a href="${pageContext.request.contextPath}/books/view">
							<img src="/myapp/resources/assets/images/book.png" alt="책 표지" />
						</a>
						<div class="list_text">
							<a href="${pageContext.request.contextPath}/books/view">
								<h4>책 제목</h4>
							</a>
							<p>
								저자 :
								<br />
								출판사 :
								<br />
								평점 :
								<span>★4.5</span>
								(24)
							</p>
							<p>구병모 미니픽션 『로렘 입숨의 책』이 안온북스에서 출간되었다. 200자 원고지 50장 내외의 작품 열세 편을 모은 이번 책에서 작가는 그간 보여준 심미적인 색채를 더욱 강렬하게 내뱉는 동시에 눈에 보이지 않는 관념과 의식을 소설화해내는 능력을 여지없이 펼쳐 보인다. 모두 달라 보이는 열세 가지 색감은 소설을 다 읽고서야 도달하게 될 높은 고도에서 내려다보아야만 비로소 그 진면모를 알 수 있다.</p>
						</div>
						<p>
							대출 :
							<span>가능</span>
							<br>
							예약 :
							<span>불가능</span>
						</p>
					</div>
				</div>

				<div class="pagination_area" style="width: 100%;">
					<ul class="pagination">
						<li class="page-item disabled">
							<a class="page-link" style="cursor: no-drop">
								<img style="opacity: .2;" src="/myapp/resources/assets/images/first.svg">
								<span>first</span>
							</a>
						</li>
						<li class="page-item disabled">
							<a class="page-link" style="cursor: no-drop">
								<img style="opacity: .2;" src="/myapp/resources/assets/images/prev.svg">
								<span>prev</span>
							</a>
						</li>
						<li class="page-item active">
							<a class="page-link" style="cursor: pointer;">1</a>
						</li>
						<li class="page-item">
							<a class="page-link" style="cursor: pointer;">2</a>
						</li>
						<li class="page-item">
							<a class="page-link" style="cursor: pointer;">
								<img style="opacity: .5;" src="/myapp/resources/assets/images/next.svg">
								<span>next</span>
							</a>
						</li>
						<li class="page-item">
							<a class="page-link" style="cursor: pointer;">
								<img style="opacity: .5;" src="/myapp/resources/assets/images/last.svg">
								<span>last</span>
							</a>
						</li>
					</ul>
				</div>
			</div>

			<div class="books_tab_cont_2">
				<%
				out.flush();
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("new.jsp");
				dispatcher1.include(request, response);
				%>
			</div>

			<div class="books_tab_cont_3">
				<%
				out.flush();
				RequestDispatcher dispatcher2 = request.getRequestDispatcher("popular.jsp");
				dispatcher2.include(request, response);
				%>
			</div>
		</div>
	</div>
</section>


<script>
	for(let i=1; i<12; i++){
		if($('.bn_input').val() == $('.bn_area a:nth-of-type('+ i +')').attr('class').split('_')[1]){
			$('.bn_area a.bn_' + String($('.bn_input').val())).addClass('active');
		}
	}
	
	$('.bn_area a').on('click', function(){
		$('.bn_area a').removeClass('active');
		$('.bn_input').val($(this).attr('class').split('_')[1]);
		$(this).addClass('active');
	})


	$('.books_tab_1').on('click', function() {
		if (!$('.books_tab_cont_1').hasClass('active')) {
			$('.books_tab_1').addClass('active');
			$('.books_tab_2').removeClass('active');
			$('.books_tab_3').removeClass('active');
			
			$('.books_tab_cont_1').addClass('active');
			$('.books_tab_cont_2').removeClass('active');
			$('.books_tab_cont_3').removeClass('active');
		}
	});
	
	$('.books_tab_2').on('click', function() {
		if (!$('.books_tab_cont_2').hasClass('active')) {
			$('.books_tab_2').addClass('active');
			$('.books_tab_1').removeClass('active');
			$('.books_tab_3').removeClass('active');
			
			$('.books_tab_cont_2').addClass('active');
			$('.books_tab_cont_1').removeClass('active');
			$('.books_tab_cont_3').removeClass('active');
		}
	});

	$('.books_tab_3').on('click', function() {
		if (!$('.books_tab_cont_3').hasClass('active')) {
			$('.books_tab_3').addClass('active');
			$('.books_tab_1').removeClass('active');
			$('.books_tab_2').removeClass('active');
			
			$('.books_tab_cont_3').addClass('active');
			$('.books_tab_cont_1').removeClass('active');
			$('.books_tab_cont_2').removeClass('active');
		}
	});
</script>