<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="subpage_wrap">
	<div class="inner">
		<h2>나의 도서관</h2>
		<div class="contents my_area">
			<p class="books_tab">
				<a class="books_tab_1 active"
					href="${pageContext.request.contextPath}/my">회원정보 관리</a> <span>&nbsp;&nbsp;·&nbsp;&nbsp;</span>
				<a class="books_tab_2"
					href="${pageContext.request.contextPath}/my/record">도서관 이용 이력</a> <span>&nbsp;&nbsp;·&nbsp;&nbsp;</span>
				<br /> <a class="books_tab_3"
					href="${pageContext.request.contextPath}/my/recommend">맞춤도서추천</a> <span>&nbsp;&nbsp;·&nbsp;&nbsp;</span>
				<a class="books_tab_4"
					href="${pageContext.request.contextPath}/my/map">가까운 도서관</a>
			</p>


			<!-- 내 정보 관리 -->
			<div class="my_tab_cont_1 active">
				<p>- 회원정보 수정</p>
				<div>
					<form class="address_form" id="changeAdd" method="post"
						action="my/changeAdd">
						<h4>주소 변경</h4>
						<input id="member_post" type="text" placeholder="우편번호" readonly>
						<button class="addr_btn" type="button">주소찾기</button>
						<input id="member_addr" type="text" placeholder="주소" readonly>
						<br> <input type="text" id="extra"
							placeholder="상세 주소를 입력하세요."> <input type="hidden"
							name=user_address id="user_address">
						<h4>비밀번호 확인</h4>
						<input type="password" placeholder="패스워드를 입력하세요."
							id="user_password" name="user_password" /> <input type="text"
							hidden="hidden" name="user_id"
							value="${sessionScope.authInfo.user_id }">
						<button type="submit">수정하기</button>
					</form>
				</div>

				<p>- 비밀번호 변경</p>
				<div>
					<form class="password_form" id="changePwd" action="my/changePwd"
						method="POST">
						<h4>현재 비밀번호</h4>
						<input type="password" placeholder="패스워드를 입력하세요."
							id="user_password2" />
						<p class="">※ 비밀번호가 일치하지 않습니다.</p>
						<h4>새 비밀번호</h4>
						<input type="password" placeholder="패스워드를 입력하세요."
							id="new_user_password" name="user_password" />
						<p class="">※ 유효한 패스워드가 아닙니다.</p>
						<h4>비밀번호 확인</h4>
						<input type="password" placeholder="패스워드를 입력하세요."
							id="chk_user_password" />
						<p class="">※ 비밀번호가 일치하지 않습니다.</p>
						<input type="text" hidden="hidden" name="user_id"
							value="${sessionScope.authInfo.user_id }">
						<button type="submit">수정하기</button>
					</form>
				</div>

				<p>- 회원 탈퇴</p>
				<div>
					<form id="frm" method="post">
						<c:if test="${not empty cbdto }">
							<p>현재 대출/예약중인 도서가 있으면 회원 탈퇴는 불가능합니다.</p>
						</c:if>
						<c:if test="${empty cbdto }">
							<button id="delete" type="submit">탈퇴</button>
						</c:if>
					</form>
					<button id="cancel" type="button">취소</button>
				</div>
			</div>

		</div>
	</div>
</section>

<script>
	$(document).ready(
			function() {
				//팝업 메세지
				var ic = false;
				var popup = $('.popup_back');
				var popupContent = $('.popup p');

				// check 할 정보 가져오기
				var spw = '${userDTO.user_password}';
				var pw = document.getElementById('user_password');
				var pw2 = document.getElementById('user_password2');
				var npw = document.getElementById('new_user_password');
				var cpw = document.getElementById('chk_user_password');

				// 주소 값
				var post = document.getElementById('member_post');
				var addr = document.getElementById('member_addr');
				var extra = document.getElementById('extra');

				// 주소 변경. 변경한다. 
				$('#changeAdd').submit(
						function(event) {
							console.log("제출됬다.")
							$("#user_address").val(
									post.value + ' ' + addr.value + ' '
											+ extra.value);
							console.log($("#user_address").val());

							if (pw.value == '') {
								popupContent.text('비밀번호를 입력하세요.');
								popup.addClass('on');
								pw.focus();
								return false;
							}

							if (pw.value != spw) {
								popupContent.text('비밀번호가 틀렸습니다.');
								popup.addClass('on');
								return false;
							}

							if (post.value == '') {
								popupContent.text('우편번호를 입력하세요.');
								popup.addClass('on');
								post.focus();
								return false;
							}
							if (addr.value == '') {
								popupContent.text('주소를 입력하세요.');
								popup.addClass('on');
								addr.focus();
								return false;
							}
							if (extra.value == '') {
								popupContent.text('상세주소를 입력하세요.');
								popup.addClass('on');
								extra.focus();
								return false;
							}
						});

				//비밀번호 변경
				$('#changePwd').submit(function(event) {
					console.log('돼라');

					// 비밀번호와 확인하는 과정
					if (pw2.value == '') {
						popupContent.text('현재 비밀번호를 입력하세요.');
						popup.addClass('on');
						pw2.focus();
						return false;
					}
					if (npw.value == '') {
						popupContent.text('비밀번호를 입력하세요.');
						popup.addClass('on');
						npw.focus();
						return false;
					}
					if (cpw.value == '') {
						popupContent.text('비밀번호를 확인을 입력해주세요.');
						popup.addClass('on');
						cpw.focus();
						return false;
					}
					if (pw2.value != spw) {
						popupContent.text('현재 비밀번호가 잘못 입력되었습니다.');
						popup.addClass('on');
						pw2.focus();
						return false;
					}
					if (npw.value != cpw.value) {
						popupContent.text('비밀번호 확인이 잘못 입력되었습니다.');
						popup.addClass('on');
						cpw.focus();
						return false;
					}
				});

			});
</script>

