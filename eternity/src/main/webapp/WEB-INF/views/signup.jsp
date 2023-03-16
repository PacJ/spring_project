<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- sign up -->
<script>
	var ic = false;

	function check() {
		// check 할 정보 가져오기
		var id = document.getElementById("user_id");
		var pw = document.getElementById("user_password");
		var name = document.getElementById("user_name");
		var pwc = document.getElementById("passwordcheck");
		var post = document.getElementById("member_post");
		var extra= document.getElementById("extra");
		
		var addr = document.getElementById("member_addr");
		var user_address= document.getElementById("user_address");
		user_address.value=post.value+" "+addr.value+" "+extra.value;
		console.log(user_address);
		
		var gender = document.getElementById("user_sex");
		var birth = document.getElementById("user_age");
		var join= document.getElementById("signup")
		console.log(gender.value)
		if (id.value == "") {
			alert("아이디를입력하세요");
			id.focus();
			return false;
		}
		if (pw.value == "") {
			alert("비밀번호를입력하세요");
			pw.focus();
			return false;
		}
		if (name.value == "") {
			alert("이름를입력하세요");
			name.focus();
			return false;
		}
		if (pwc.value == "") {
			alert("비밀번호확인을입력하세요");
			pwc.focus();
			return false;
		}
		// 비밀번호와 확인하는 과정에서 다를시 focus 하고 안넘어감 

		if (pw.value != pwc.value) {
			alert("비밀번호가 다릅니다.");
			pwc.focus();
			return false;
		}
		if (post.value == "") {
			alert("우편번호를 입력하세요");
			post.focus();
			return false;
		}
		if (addr.value == "") {
			alert("주소를 입력하세요");
			addr.focus();
			return false;
		}
		if (extra.value == "") {
			alert("상세주소를 입력하세요");
			extra.focus();
			return false;
		}
		if (gender.value == "") {
			alert("성별을 선택해주세요");
			gender.focus();
			return false;
		}
		if (birth.value == "") {
			alert("생년월일을 입력해주세요 ");
			gender.focus();
			return false;
		}

		// 중복확인을 안할시 false값 유지
		if (ic == false) {
			alert('중복확인을하세요')
		}

		//위의 조건들을 다 통과하면 submit
		if (ic == true) {
			join.action = "signup";
			join.method = "post";
			join.submit();
		}

	};
	//중복확인
	function checkid() {
		// 아이디값 가져옴
		var id = $('#user_id').val();
		if (id != "") {
			$.ajax({
				url : "idcheck", //컨트롤러 주소 
				type : "post", // 전달방식
				data : {
					id : id
				// 전달할 파라미터 admin_id 
				},
				success : function(cnt) { // 성공시 ctn는 컨트롤러 실행 결과
					if (cnt == 0) { //cnt 값이 0이면 중복되는 아이디 없음
						alert("사용가능");
						ic = true; // ic값 true 로 변경
					} else {
						alert("불가능");
						$('#user_id').val(''); // 중복되는 아이디가 있을시 아이디 입력란을 공란으로 만듬 
					}

				},
				error : function() {
					alert("통신오류");
				}
			});
		} else {
			alert('아이디를 입력하세요'); // 아이디를 입력하지 않았을 시 알러트 

		}

	};
</script>
<section class="sign_area">
	<article class="inner">
		<h2>회원가입</h2>
		<p>영원한 도서관 회원가입을 환영합니다.</p>
		<form class="signup_form" id="signup">
			<ul>
				<li class="id_input">
					<h4>아이디</h4> <input type="text" name="user_id" id="user_id"
					placeholder="아이디를 입력하세요." />
					<button type="button"onclick="checkid()">아이디 중복확인</button>
					<p class="on">※ 작성오류 문구</p>
				</li>
				<li>
					<h4>비밀번호</h4> <input type="password" name="user_password" id="user_password"
					placeholder="패스워드를 입력하세요." />
					<p class="on">※ 작성오류 문구</p>
				</li>
				<li>
					<h4>비밀번호 재확인</h4> <input type="password" name="passwordcheck"
					id="passwordcheck" placeholder="패스워드를 입력하세요." />
					<p class="on">※ 작성오류 문구</p>
				</li>
				<li>
					<h4>성명</h4> <input type="text" name="user_name" id="user_name"
					placeholder="성명을 입력하세요." />
					<p class="on">※ 작성오류 문구</p>
				</li>
				<li class="addr_input">
					<h4>주소</h4> <input id="member_post" type="text" placeholder="우편번호"
					readonly>
					<button class="addr_btn" type="button">주소찾기</button> <input
					id="member_addr" type="text" placeholder="주소" readonly> <br>
					<input type="text" id="extra"placeholder="상세 주소를 입력하세요.">
					 <input type="hidden" name="user_address" id="user_address"> 
					<p class="on">※ 작성오류 문구</p>
				</li>
				<li class="sex_input" >
					<h4>성별</h4> <input type="hidden" name="user_sex" value="남성" id="user_sex"/>
					<button type="button" class="radio_btn active"
						>남성</button>
					<button type="button" class="radio_btn"
						>여성</button>

					<p class="on">※ 작성오류 문구</p>
				</li>
				<li>
					<h4>생년월일</h4> <input type="number" id="user_age" name="user_age"
					placeholder="6자리 숫자로 입력하세요." pattern="[0-9]{6}" />
					<p class="on">※ 작성오류 문구</p>
				</li>
			</ul>
			<button type="button" onclick="check()">가입하기</button>
		</form>
	</article>
</section>