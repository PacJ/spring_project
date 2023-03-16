<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 인기도서 -->
<div class="booklist_box">
	<div class="list">
		<a href="${pageContext.request.contextPath}/books/view">
			<span class="best_tag">1</span>
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
			<span class="best_tag">1</span>
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