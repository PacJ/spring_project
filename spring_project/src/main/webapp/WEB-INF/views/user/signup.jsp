<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	
	
 	$('#idCheck').on('click', process); 
	
	// 아이디 확인
/*  	function process() {
		$.ajax({
			type:'POST',
			data:{name:$('idCheckInput').val()},
			url:'/name.do',
			success: function(data) {
				if(data=="이미 사용중인 아이디입니다.") {
					$('usedId').addClass('on');
				} else {
					$('usedId').removeClass('on');
					console.log("사용가능 아이디")
				}
				console.log(data);
				viewMessage(data); 
			}
		});
	} */
	 
 	function process() {
		$.post('name.do', {name:$('#idCheckInput').val()}, viewMessage);
	} 
 	
 	function viewMessage(data) {
  		if(data != null) {
 			console.log("사용불가");
 			console.log(data);
 			console.log(data.dto);
			$('#usedId').addClass('on'); 			
 		} else {
 			console.log("사용 가능한 아이디입니다!")
 		} 
	} 
	    
	    // 비밀번호 확인
	    $("input[name='userPw']").keyup(function() {
	    	if($("input[name='userPw']").val() != $("input[name='userPwCheck']").val()) {
	    		$('#pwCheck').addClass('on');
	    	} else {
	    		$('#pwCheck').removeClass('on');
	    	}
	    });
	    
	    $("input[name='userPwCheck']").keyup(function() {
	    	if($("input[name='userPw']").val() != $("input[name='userPwCheck']").val()) {
	    		$('#pwCheck').addClass('on');
	    	} else {
	    		$('#pwCheck').removeClass('on');
	    	}
	    });
	    
	function displayVals() {
		let postVal = $("#member_post").val();
		let addrVal = $("#member_addr").val();
		let extra = $("#extra").val();
		
		console.log(postVal);
		console.log(addrVal);
		console.log(extra);
		
		$("input[name='userAddress']").val(postVal + " " + addrVal + " " + extra);
	}
	  
 
	$('#extra').keyup(function() {
		console.log($("#extra").val());
		displayVals();
	})
});
</script>
<!-- sign up -->
        <section class="sign_area">
            <article class="inner">
                <h2>회원가입</h2>
                <p>영원한 도서관 회원가입을 환영합니다.</p>
                <form class="signup_form" action="signup.do" method="post">
                    <ul>
                        <li class="id_input">
                            <h4>아이디</h4>
                            <input type="text" placeholder="아이디를 입력하세요.(영어 대/소문자, 숫자 8~15자)" name="userId" id="idCheckInput"
                            pattern="[a-zA-Z0-9]{8,15}"/>
                            <button type="button" id="idCheck">아이디 중복확인</button>
                            <p class="" id = "userId">※ 이미 가입된 아이디 입니다.</p>
                        </li>
                        <li>
                            <h4>비밀번호</h4>
                            <input type="password" placeholder="패스워드를 입력하세요." name="userPw"/>
                            <p class="">※ 작성오류 문구</p>
                        </li>
                        <li>
                            <h4>비밀번호 재확인</h4>
                            <input type="password" placeholder="패스워드를 입력하세요." name="userPwCheck"/>
                            <p class="" id="pwCheck">※ 비밀번호가 다릅니다.</p>
                        </li>
                        <li>
                            <h4>성명</h4>
                            <input type="text" placeholder="성명을 입력하세요."  name="userName"/>
                            <p class="">※ 작성오류 문구</p>
                        </li>
                        <li class="addr_input">
                            <h4>주소</h4>

                            <input id="member_post" type="text" placeholder="우편번호" readonly>
                            <button class="addr_btn" type="button">주소찾기</button>
                            <input id="member_addr" type="text" placeholder="주소" readonly> <br>
                            <input type="text" id="extra" placeholder="상세 주소를 입력하세요.">
                            <input type="hidden" name=userAddress>
                            <p class="">※ 작성오류 문구</p>
                        </li>
                        <li class="sex_input">
                            <h4>성별</h4>
                            <input type="hidden" name="userSex" value="남성" />
                            <button type="button" class="radio_btn active">남성</button>
                            <button type="button" class="radio_btn">여성</button>

                            <p class="">※ 작성오류 문구</p>
                        </li>
                        <li>
                            <h4>생년월일</h4>
                            <input type="text" placeholder="6자리 숫자로 입력하세요." name=""/>
                            <p class="">※ 작성오류 문구</p>
                        </li>
                    </ul>
                    <button type="submit">가입하기</button>
                </form>
            </article>
        </section>