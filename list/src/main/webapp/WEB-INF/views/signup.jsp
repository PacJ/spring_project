<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- sign up -->
<section class="sign_area">
	<article class="inner">
		<h2>회원가입</h2>
		<p>영원한 도서관 회원가입을 환영합니다.</p>
		<form class="signup_form" action="" method="">
			<ul>
				<li class="id_input">
					<h4>아이디</h4> <input type="text" placeholder="아이디를 입력하세요." />
					<button type="button">아이디 중복확인</button>
					<p class="on">※ 작성오류 문구</p>
				</li>
				<li>
					<h4>비밀번호</h4> <input type="password" placeholder="패스워드를 입력하세요." />
					<p class="on">※ 작성오류 문구</p>
				</li>
				<li>
					<h4>비밀번호 재확인</h4> <input type="password" placeholder="패스워드를 입력하세요." />
					<p class="on">※ 작성오류 문구</p>
				</li>
				<li>
					<h4>성명</h4> <input type="text" placeholder="성명을 입력하세요." />
					<p class="on">※ 작성오류 문구</p>
				</li>
				<li class="addr_input">
					<h4>주소</h4> <input id="member_post" type="text" placeholder="우편번호"
					readonly>
					<button class="addr_btn" type="button">주소찾기</button> <input
					id="member_addr" type="text" placeholder="주소" readonly> <br>
					<input type="text" placeholder="상세 주소를 입력하세요.">
					<p class="on">※ 작성오류 문구</p>
				</li>
				<li class="sex_input">
					<h4>성별</h4> <input type="hidden" name="user_gender" value="남성" />
					<button type="button" class="radio_btn active">남성</button>
					<button type="button" class="radio_btn">여성</button>

					<p class="on">※ 작성오류 문구</p>
				</li>
				<li>
					<h4>생년월일</h4> <input type="text" placeholder="6자리 숫자로 입력하세요." />
					<p class="on">※ 작성오류 문구</p>
				</li>
			</ul>
			<button type="submit">가입하기</button>
		</form>
	</article>
</section>