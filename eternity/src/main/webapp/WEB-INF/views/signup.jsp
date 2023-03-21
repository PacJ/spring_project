<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- sign up -->
<script>
	var ic = false;

	function check() {
		//팝업 메세지
		var popup = $('.popup_back');
		var popupContent = $('.popup p');
		
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
			id.focus();
			return false;
		}
		if (pw.value == "") {
			popupContent.text("비밀번호를 입력하세요.");
			popup.addClass('on');
			pw.focus();
			return false;
		}
		if (name.value == "") {
			popupContent.text("이름을 입력하세요.");
			popup.addClass('on');
			name.focus();
			return false;
		}
		if (pwc.value == "") {
			popupContent.text("비밀번호를 확인을 입력해주세요.");
			popup.addClass('on');
			pwc.focus();
			return false;
		}
		// 비밀번호와 확인하는 과정에서 다를시 focus 하고 안넘어감 

		if (pw.value != pwc.value) {
			popupContent.text("비밀번호가 다릅니다.");
			popup.addClass('on');
			pwc.focus();
			return false;
		}
		if (post.value == "") {
			popupContent.text("우편번호를 입력하세요.");
			popup.addClass('on');
			post.focus();
			return false;
		}
		if (addr.value == "") {
			popupContent.text("주소를 입력하세요.");
			popup.addClass('on');
			addr.focus();
			return false;
		}
		if (extra.value == "") {
			popupContent.text("상세주소를 입력하세요.");
			popup.addClass('on');
			extra.focus();
			return false;
		}
		if (gender.value == "") {
			popupContent.text("성별을 선택해주세요.");
			popup.addClass('on');
			gender.focus();
			return false;
		}
		if (birth.value == "") {
			popupContent.text("생년월일을 입력해주세요.");
			popup.addClass('on');
			gender.focus();
			return false;
		}

		// 중복확인을 안할시 false값 유지
		if (ic == false) {
			popupContent.text("아이디 중복체크를 해주세요.");
			popup.addClass('on');
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
		var popup = $('.popup_back');
		var popupContent = $('.popup p');
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
						popupContent.text("사용 가능한 아이디 입니다.");
						popup.addClass('on');
						$('#unavailableId').removeClass('on');
						ic = true; // ic값 true 로 변경
					} else {
						popupContent.text("이미 등록되어 있는 아이디 입니다.");
						popup.addClass('on');
						$('#unavailableId').addClass('on');
						$('#user_id').val(''); // 중복되는 아이디가 있을시 아이디 입력란을 공란으로 만듬 
					}

				},
				error : function() {
					alert("통신오류");
				}
			});
		} else {
			// 아이디를 입력하지 않았을 시 알러트 
			popupContent.text("아이디를 입력하세요.");
			popup.addClass('on');

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
					<p id="unavailableId" class="">※ 사용 할 수 없는 아이디입니다.</p>
				</li>
				<li>
					<h4>비밀번호</h4> <input type="password" name="user_password" id="user_password"
					placeholder="패스워드를 입력하세요." />
					<p class="">※ 유효한 패스워드가 아닙니다.</p>
				</li>
				<li>
					<h4>비밀번호 재확인</h4> <input type="password" name="passwordcheck"
					id="passwordcheck" placeholder="패스워드를 입력하세요." />
					<p class="">※ 비밀번호가 일치하지 않습니다.</p>
				</li>
				<li>
					<h4>성명</h4> <input type="text" name="user_name" id="user_name"
					placeholder="성명을 입력하세요." />
					<p class="">※ 작성오류 문구</p>
				</li>
				<li class="addr_input">
					<h4>주소</h4> <input id="member_post" type="text" placeholder="우편번호"
					readonly>
					<button class="addr_btn" type="button">주소찾기</button> <input
					id="member_addr" type="text" placeholder="주소" readonly> <br>
					<input type="text" id="extra"placeholder="상세 주소를 입력하세요.">
					 <input type="hidden" name="user_address" id="user_address"> 
					<p class="">※ 정확한 주소 값을 입력해 주세요.</p>
				</li>
				<li class="sex_input" >
					<h4>성별</h4> <input type="hidden" name="user_sex" value="남성" id="user_sex"/>
					<button type="button" class="radio_btn active"
						>남성</button>
					<button type="button" class="radio_btn"
						>여성</button>

					<p class="">※ 작성오류 문구</p>
				</li>
				<li>
					<h4>생년월일</h4> <input type="number" id="user_age" name="user_age"
					placeholder="8자리 숫자로 입력하세요." pattern="[0-9]{8}" />
					<p class="">※ 생년월을 올바른 형태로 입력하십시오.</p>
				</li>
			</ul>
			<button type="button" onclick="check()">가입하기</button>
		</form>
	</article>
</section>