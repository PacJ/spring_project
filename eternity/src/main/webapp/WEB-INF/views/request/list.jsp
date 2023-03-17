<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="request_list_area">

	<dl class="request_list_title">
		<dt>NO</dt>
		<dt>도서명</dt>
		<dt>저자</dt>
		<dt>신청일</dt>
		<dt>신청상태</dt>
	</dl>
	<dl class="request_list_cont">
		<dt>01</dt>
		<dd>여기는 도서명입니다</dd>
		<dd>김누구</dd>
		<dd>0000-00-00</dd>
		<dd>처리대기</dd>
	</dl>
	<dl class="request_list_cont">
		<dt>02</dt>
		<dd>여기는 도서명입니다 여기는 도서명입니다 여기는 도서명입니다 여기는 도서명입니다 여기는 도서명입니다</dd>
		<dd>김누구 김누구 김누구 김누구 김누구 김누구 김누구</dd>
		<dd>0000-00-00</dd>
		<dd>반려</dd>
	</dl>
</div>

<div class="pagination_area">
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

<div class="request_nodata">도서신청 정보가 존재하지 않습니다.</div>